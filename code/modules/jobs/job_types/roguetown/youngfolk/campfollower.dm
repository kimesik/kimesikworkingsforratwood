/datum/job/roguetown/campfollower //Slave-But-Not-Quite for Bandits.
	title = "Camp Follower"
	flag = CAMPFOLLOWER
	department_flag = WANDERERS
	faction = "Station"
	total_positions = 3 //Probably should be enough
	spawn_positions = 3
	allowed_races = RACES_ALL_KINDS
	tutorial = "Whether out of greed, religious convictions or pure boredom, you have decided to follow local brigands and help them around their camp. \
	Your fate and their fates are closely intertwined."
	cmode_music = 'sound/music/cmode/towner/combat_towner.ogg'

	outfit = null
	outfit_female = null

	obsfuscated_job = TRUE

	display_order = JDO_CAMPFOLLOWER
	announce_latejoin = FALSE
	min_pq = 3
	max_pq = null
	round_contrib_points = 3
	allowed_patrons = ALL_INHUMEN_PATRONS

	advclass_cat_rolls = list(CTAG_CAMPFOLLOWER = 20)
	PQ_boost_divider = 10

	wanderer_examine = TRUE
	advjob_examine = TRUE
	always_show_on_latechoices = TRUE
	job_traits = list(TRAIT_STEELHEARTED)
	same_job_respawn_delay = 0
	job_subclasses = list(
		/datum/advclass/barbersurgeon,
		/datum/advclass/blacksmith,
		/datum/advclass/cheesemaker,
		/datum/advclass/fisher,
		/datum/advclass/miner,
		/datum/advclass/minstrel,
		/datum/advclass/peasant,
		/datum/advclass/potter,
		/datum/advclass/seamstress,
		/datum/advclass/witch,
		/datum/advclass/woodworker
	) //All Towner classes except for Drunkard, both Hunters and Thug.

/datum/job/roguetown/campfollower/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/H = L
		if(!H.mind)
			return
		H.ambushable = FALSE
		var/datum/antagonist/new_antag = new /datum/antagonist/bandit() //To avoid unexpected issues when interacting with Bandit stuff
		H.mind.add_antag_datum(new_antag)
		H.grant_language(/datum/language/thievescant)
