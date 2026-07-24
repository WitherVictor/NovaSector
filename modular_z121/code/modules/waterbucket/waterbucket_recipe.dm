/datum/crafting_recipe/water_bucket
	name = "water bucket"
	result = /obj/item/water_bucket
	reqs = list(
		/obj/item/stack/sheet/iron = 4,
		/obj/item/pipe = 2,
		/obj/item/stack/cable_coil = 5,
		/obj/item/stock_parts/water_recycler = 3,
		/obj/item/reagent_containers/cup/bucket = 1
	)
	tool_behaviors = list(TOOL_WELDER, TOOL_WRENCH, TOOL_SCREWDRIVER)
	time = 50
	category = CAT_ENTERTAINMENT