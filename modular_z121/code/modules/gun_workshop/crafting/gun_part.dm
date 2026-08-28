// 合成分类 - 枪械零件
/datum/crafting_recipe/gun_part
	abstract_type = /datum/crafting_recipe/gun_part
	category = CAT_GUN_PART

	// 所有合成都需要零件工作台
	structures = list(
		/obj/structure/gun_part_workshop = CRAFTING_STRUCTURE_USE
	)

	time = 10 SECONDS

/datum/crafting_recipe/gun_part/pistol_barrel
	name = "手枪枪管"
	result = /obj/item/gun_part/barrel/pistol

	reqs = list(
		/obj/item/stack/sheet/plasteel = 5,
	)

/datum/crafting_recipe/gun_part/pistol_slide
	name = "手枪套筒"
	result = /obj/item/gun_part/slide/pistol

	reqs = list(
		/obj/item/stack/sheet/plasteel = 3,
	)

/datum/crafting_recipe/gun_part/pistol_fire_control
	name = "手枪击发组"
	result = /obj/item/gun_part/fire_control/pistol

	reqs = list(
		/obj/item/stack/sheet/plasteel = 3,
		/obj/item/stack/sheet/mineral/diamond = 1
	)

/datum/crafting_recipe/gun_part/beretta_92fs_receiver
	name = "Beretta 92FS 机匣"
	result = /obj/item/receiver/beretta_92fs

	reqs = list(
		/obj/item/stack/sheet/plasteel = 5,
		/obj/item/stack/sheet/iron = 5
	)
