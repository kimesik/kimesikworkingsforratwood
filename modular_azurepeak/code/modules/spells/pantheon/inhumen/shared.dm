/obj/effect/proc_holder/spell/invoked/evil_resurrect
	name = "Perfect Reanimation" //Wretch Heresiarch-exclusive variant of Anastasis
	desc = "Rip the target's soul out of Necra's grasp and revive them at a cost of a humanoid being's heart. The target's attributes will be temporarily reduced."
	overlay_state = "noc_revive"
	releasedrain = 90
	chargedrain = 0
	chargetime = 50
	range = 1
	warnie = "sydwarning"
	no_early_release = TRUE
	movement_interrupt = TRUE
	chargedloop = /datum/looping_sound/invokeholy
	sound = 'sound/magic/zizo_snuff.ogg'
	associated_skill = /datum/skill/magic/holy
	antimagic_allowed = TRUE
	recharge_time = 10 MINUTES
	miracle = TRUE
	devotion_cost = 250
	var/revive_pq = PQ_GAIN_REVIVE
	var/required_structure = /obj/structure/fluff/psycross/zizocross
	var/required_items = list(/obj/item/organ/heart = 1)
	var/alt_required_items = list(/obj/item/organ/heart = 1)
	var/item_radius = 1
	var/debuff_type = /datum/status_effect/debuff/revived
	var/structure_range = 1

/obj/effect/proc_holder/spell/invoked/evil_resurrect/start_recharge()
	recharge_time = initial(recharge_time) * SSchimeric_tech.get_resurrection_multiplier()
	. = ..()

/obj/effect/proc_holder/spell/invoked/evil_resurrect/proc/get_current_required_items()
	if(SSchimeric_tech.has_revival_cost_reduction() && length(alt_required_items))
		return alt_required_items
	return required_items

/obj/effect/proc_holder/spell/invoked/evil_resurrect/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]))
		var/mob/living/target = targets[1]

		var/validation_result = validate_items(target)
		if(validation_result != "")
			to_chat(user, span_warning("[validation_result] on the floor next to or on top of [target]"))
			revert_cast()
			return FALSE

		var/found_structure = FALSE
		var/list/search_area = oview(structure_range, target)

		for(var/atom/A in search_area)
			// Check if the atom itself is the required structure type
			if(istype(A, required_structure))
				found_structure = TRUE
				break

			if(istype(A, /turf))
				var/turf/T = A
				for(var/obj/O in T.contents)
					if(istype(O, required_structure))
						found_structure = TRUE
						break // Found it in the turf, no need to check further
			if(found_structure)
				break

		if(!found_structure)
			var/atom/temp_structure = required_structure
			to_chat(user, span_warning("I need an unholy [initial(temp_structure.name)] near [target]."))
			revert_cast()
			return FALSE
		var/mob/living/carbon/spirit/underworld_spirit = target.get_spirit()
		if(underworld_spirit)
			var/mob/dead/observer/ghost = underworld_spirit.ghostize()
			qdel(underworld_spirit)
			ghost.mind.transfer_to(target, TRUE)
		target.grab_ghost(force = TRUE)
		if(!target.check_revive(user))
			revert_cast()
			return FALSE
		if(target.mob_biotypes & MOB_UNDEAD) //no effect on undead
			to_chat(user, span_warning("[target] is undead. Nothing happens."))
			revert_cast()
			return FALSE
		target.adjustOxyLoss(-target.getOxyLoss()) //Ye Olde CPR
		if(!target.revive(full_heal = FALSE))
			to_chat(user, span_warning("Nothing happens."))
			revert_cast()
			return FALSE
		target.emote("agony")
		target.Jitter(100)
		target.update_body()
		target.visible_message(span_notice("[target] is reanimated by unholy magic!"), span_warning("My soul is snatched from Necra's grasp. Damnation continues."))
		if(revive_pq && !HAS_TRAIT(target, TRAIT_IWASREVIVED) && user?.ckey)
			adjust_playerquality(revive_pq, user.ckey)
			ADD_TRAIT(target, TRAIT_IWASREVIVED, "[type]")
		target.mind.remove_antag_datum(/datum/antagonist/zombie)
		target.remove_status_effect(/datum/status_effect/debuff/rotted_zombie)	//Removes the rotted-zombie debuff if they have it - Failsafe for it.
		target.apply_status_effect(debuff_type)	//Temp debuff on revive, your stats get hit temporarily. Doubly so if having rotted.
		//Due to an increased cost and cooldown, these revival types heal quite a bit.
		target.apply_status_effect(/datum/status_effect/buff/healing, 14)
		consume_items(target)
		return TRUE
	revert_cast()
	return FALSE

/obj/effect/proc_holder/spell/invoked/evil_resurrect/cast_check(skipcharge = 0,mob/user = usr)
	if(!..())
		to_chat(user, span_warning("The miracle fizzles."))
		return FALSE
	return TRUE

/obj/effect/proc_holder/spell/invoked/evil_resurrect/proc/validate_items(atom/center)
	var/list/current_required_items = get_current_required_items()
	var/list/available_items = list()
	var/list/missing_items = list()

	// Scan for items in radius
	for(var/obj/item/I in range(item_radius, center))
		if(I.type in current_required_items)
			available_items[I.type] += 1

	// Check quantities and compile missing list
	for(var/item_type in current_required_items)
		var/needed = current_required_items[item_type]
		var/have = available_items[item_type] || 0

		if(have < needed) {
			var/obj/item/I = item_type
			var/amount_needed = needed - have
			missing_items += "[amount_needed] [initial(I.name)][amount_needed > 1 ? "s" : ""] "
		}

	if(length(missing_items))
		var/string = ""
		for(var/item in missing_items)
			string += item
		return "Missing components: [string]."
	return ""

/obj/effect/proc_holder/spell/invoked/evil_resurrect/proc/consume_items(atom/center)
	var/list/current_required_items = get_current_required_items()
	for(var/item_type in current_required_items)
		var/needed = current_required_items[item_type]

		for(var/obj/item/I in range(item_radius, center))
			if(needed <= 0)
				break
			if(I.type == item_type)
				needed--
				qdel(I)