/datum/crafting_recipe/gun_workshop
	abstract_type = /datum/crafting_recipe/gun_workshop
	category = CAT_GUN_WORKSHOP

/datum/crafting_recipe/gun_workshop/gun_part_workshop
	name = "枪械零件工作台"
	result = /obj/structure/gun_part_workshop

	reqs = list(
		/obj/item/stack/sheet/iron = 5,
		/obj/item/stack/sheet/mineral/wood = 5,
		/obj/item/stack/sheet/plasteel = 3,
		/obj/item/screwdriver = 2,
		/obj/item/wirecutters = 1
	)

	time = 10 SECONDS
	crafting_flags = CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND

/datum/crafting_recipe/gun_workshop/gun_assemble_workshop
	name = "枪械组装工作台"
	result = /obj/structure/gun_assemble_workshop

	reqs = list(
		/obj/item/stack/sheet/iron = 10,
		/obj/item/stack/sheet/plasteel = 5,
		/obj/item/screwdriver = 1,
		/obj/item/wirecutters = 1,
		/obj/item/wrench = 1
	)

	time = 10 SECONDS
	crafting_flags = CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND

/datum/crafting_recipe/gun_workshop/ammo_workshop
	name = "弹药装配工作台"
	result = /obj/structure/ammo_workshop

	reqs = list(
		/obj/item/stack/sheet/iron = 10,
		/obj/item/stack/sheet/plasteel = 5,
		/obj/item/forging/tongs = 1,
		/obj/item/wirecutters = 1,
		/obj/item/wrench = 1
	)

	time = 10 SECONDS
	crafting_flags = CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND
