/datum/advclass/wretch/pyromaniac
	name = "Pyromaniac"
	tutorial = "A notorious arsonist with a penchant for fire and a talent for pyromancy, driven by fiery revenge or, perhaps, pure insanity. A mysterious ritual made you immune to fire."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/wretch/pyromaniac
	cmode_music = 'sound/music/Iconoclast.ogg'
	category_tags = list(CTAG_WRETCH)
	traits_applied = list(TRAIT_MEDIUMARMOR, TRAIT_ALCHEMY_EXPERT, TRAIT_ARCYNE_T2, TRAIT_NOFIRE) //Immunity to fire damage.
	subclass_stats = list(
		STATKEY_WIL = 3,
		STATKEY_CON = 3,
		STATKEY_INT = 3
	)
	subclass_skills = list(
		/datum/skill/combat/bows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/crossbows = SKILL_LEVEL_JOURNEYMAN,
		/datum/skill/combat/knives = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/swimming = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/athletics = SKILL_LEVEL_EXPERT, // RUN BOY RUN
		/datum/skill/combat/wrestling = SKILL_LEVEL_EXPERT, // To escape grapplers, fuck you
		/datum/skill/combat/unarmed = SKILL_LEVEL_APPRENTICE,
		/datum/skill/misc/climbing = SKILL_LEVEL_EXPERT,
		/datum/skill/misc/reading = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/traps = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/alchemy = SKILL_LEVEL_EXPERT,
		/datum/skill/craft/crafting = SKILL_LEVEL_APPRENTICE,
		/datum/skill/craft/engineering = SKILL_LEVEL_NOVICE,
		/datum/skill/labor/farming = SKILL_LEVEL_NOVICE,
		/datum/skill/magic/arcane = SKILL_LEVEL_JOURNEYMAN,
	)

/datum/outfit/job/roguetown/wretch/pyromaniac/pre_equip(mob/living/carbon/human/H)
	head = /obj/item/clothing/head/roguetown/helmet/heavy/sheriff //wear protection :)
	mask = /obj/item/clothing/mask/rogue/facemask/
	neck = /obj/item/clothing/neck/roguetown/chaincoif/full //Protect your head!
	pants = /obj/item/clothing/under/roguetown/splintlegs
	armor = /obj/item/clothing/suit/roguetown/armor/brigandine/light
	shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/iron
	backr = /obj/item/gun/ballistic/revolver/grenadelauncher/crossbow
	backl = /obj/item/storage/backpack/rogue/satchel
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/rogueweapon/scabbard/sheath
	beltl = /obj/item/quiver/pyrobolts
	gloves = /obj/item/clothing/gloves/roguetown/plate/iron
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor
	wrists = /obj/item/clothing/wrists/roguetown/splintarms
	r_hand = /obj/item/rogueweapon/woodstaff/toper
	l_hand = /obj/item/bomb
	backpack_contents = list(
		/obj/item/bomb = 2,
		/obj/item/rogueweapon/huntingknife/idagger = 1,
		/obj/item/storage/belt/rogue/pouch/coins/poor = 1,
		/obj/item/flashlight/flare/torch/lantern/prelit = 1,
		/obj/item/flint = 1,
		/obj/item/reagent_containers/glass/bottle/alchemical/healthpot = 1,	//Small health vial
		)
	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/touch/prestidigitation)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/create_campfire)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/spitfire)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fireball)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/projectile/fireball/artillery)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/rebuke)
		H.set_blindness(0)
		wretch_select_bounty(H)
