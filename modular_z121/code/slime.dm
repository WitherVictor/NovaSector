/datum/chemical_reaction/slime/slimemammal
	results = list(/datum/reagent/mutationtoxin/mammal = 1)
	required_reagents = list(/datum/reagent/water = 1)
	required_other = TRUE
	required_container = /obj/item/slime_extract/green

/datum/reagent/mutationtoxin/mammal
	name = "Mammal Mutation Toxin"
	description = "A glowing toxin."
	color = "#5EFF3B" //RGB: 94, 255, 59
	race = /datum/species/mammal
	taste_description = "fluffy"