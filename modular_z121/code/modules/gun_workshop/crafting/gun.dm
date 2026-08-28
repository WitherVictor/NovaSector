/datum/crafting_recipe/gun
	abstract_type = /datum/crafting_recipe/gun
	category = CAT_GUN_WEAPON

	time = 20 SECONDS

	structures = list(
		/obj/structure/gun_assemble_workshop = CRAFTING_STRUCTURE_USE
	)

/datum/crafting_recipe/gun/beretta_92fs
	name = "Beretta 92FS"
	result = /obj/item/gun/ballistic/automatic/pistol/beretta_92fs

	reqs = list(
		/obj/item/receiver/beretta_92fs = 1,
		/obj/item/gun_part/slide/pistol = 1,
		/obj/item/gun_part/barrel/pistol = 1,
		/obj/item/gun_part/fire_control/pistol = 1,
		/obj/item/stack/sheet/plasteel = 3
	)
