/datum/migrant_wave/ranesheni_noble
	name = "Zybantine Emir"
	max_spawns = 1
	shared_wave_type = /datum/migrant_wave/ranesheni_noble
	weight = 50
	downgrade_wave = /datum/migrant_wave/ranesheni_noble_down_one
	roles = list(
		/datum/migrant_role/ranesheni/emir = 1,
		/datum/migrant_role/ranesheni/amirah = 1,
		/datum/migrant_role/ranesheni/janissary = 2,
		/datum/migrant_role/ranesheni/advisor = 1,
	)
	greet_text = "You are far from home on missive from the Zybantine Empire."

/datum/migrant_wave/ranesheni_noble_down_one
	name = "Zybantine Emir"
	shared_wave_type = /datum/migrant_wave/ranesheni_noble
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/ranesheni_noble_down_two
	roles = list(
		/datum/migrant_role/ranesheni/emir = 1,
		/datum/migrant_role/ranesheni/amirah = 1,
		/datum/migrant_role/ranesheni/janissary = 1,
		/datum/migrant_role/ranesheni/advisor = 1,
	)
	greet_text = "You are far from home on missive from the Zybantine Empire."

/datum/migrant_wave/ranesheni_noble_down_two
	name = "Zybantine Emir"
	shared_wave_type = /datum/migrant_wave/ranesheni_noble
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/ranesheni_noble_down_three
	roles = list(
		/datum/migrant_role/ranesheni/emir = 1,
		/datum/migrant_role/ranesheni/amirah = 1,
		/datum/migrant_role/ranesheni/janissary = 2,
	)
	greet_text = "You are far from home on missive from the Zybantine Empire."

/datum/migrant_wave/ranesheni_noble_down_three
	name = "Zybantine Emir"
	shared_wave_type = /datum/migrant_wave/ranesheni_noble
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/ranesheni_noble_down_four
	roles = list(
		/datum/migrant_role/ranesheni/emir = 1,
		/datum/migrant_role/ranesheni/janissary = 2,
		/datum/migrant_role/ranesheni/advisor = 1,
	)
	greet_text = "You are far from home on missive from the Zybantine Empire."

/datum/migrant_wave/ranesheni_noble_down_four
	name = "Zybantine Emir"
	shared_wave_type = /datum/migrant_wave/ranesheni_noble
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/ranesheni_noble_down_five
	roles = list(
		/datum/migrant_role/ranesheni/emir = 1,
		/datum/migrant_role/ranesheni/janissary = 1,
		/datum/migrant_role/ranesheni/advisor = 1,
	)
	greet_text = "You are far from home on missive from the Zybantine Empire."

/datum/migrant_wave/ranesheni_noble_down_five
	name = "Zybantine Emir"
	shared_wave_type = /datum/migrant_wave/ranesheni_noble
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/ranesheni_noble_down_six
	roles = list(
		/datum/migrant_role/ranesheni/emir = 1,
		/datum/migrant_role/ranesheni/amirah = 1,
		/datum/migrant_role/ranesheni/janissary = 1,
	)
	greet_text = "You are far from home on missive from the Zybantine Empire."

/datum/migrant_wave/ranesheni_noble_down_six
	name = "Zybantine Emir"
	shared_wave_type = /datum/migrant_wave/ranesheni_noble
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/ranesheni_noble_down_seven
	roles = list(
		/datum/migrant_role/ranesheni/emir = 1,
		/datum/migrant_role/ranesheni/amirah = 1,
	)
	greet_text = "You are far from home on missive from the Zybantine Empire."

/datum/migrant_wave/ranesheni_noble_down_seven
	name = "Zybantine Emir"
	shared_wave_type = /datum/migrant_wave/ranesheni_noble
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/ranesheni_noble_down_eight
	roles = list(
		/datum/migrant_role/ranesheni/emir = 1,
		/datum/migrant_role/ranesheni/advisor = 1,
	)
	greet_text = "You are far from home on missive from the Zybantine Empire."

/datum/migrant_wave/ranesheni_noble_down_eight
	name = "Zybantine Emir"
	shared_wave_type = /datum/migrant_wave/ranesheni_noble
	downgrade_wave = /datum/migrant_wave/ranesheni_noble_down_nine
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/ranesheni/emir = 1,
		/datum/migrant_role/ranesheni/janissary = 1,
	)
	greet_text = "You are far from home on missive from the Zybantine Empire."

/datum/migrant_wave/ranesheni_noble_down_nine
	name = "Zybantine Emir"
	shared_wave_type = /datum/migrant_wave/ranesheni_noble
	downgrade_wave = /datum/migrant_wave/ranesheni_noble_down_nine
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/ranesheni/emir = 1,
	)
	greet_text = "You are far from home on missive from the Zybantine Empire."
