/obj/item/storage/fancy/treat_box
	name = "狗粮盒"
	desc = "一个装着狗粮的纸盒."
	icon = 'modular_z121/icons/obj/citadel.dmi'
	icon_state = "treatbox"
	base_icon_state = "treatbox"
	contents_tag = "dogtreat"
	spawn_type = /obj/item/food/cracker/dogtreat
	spawn_count = 6

/obj/item/storage/fancy/treat_box/Initialize(mapload)
	. = ..()
	atom_storage.set_holdable(list(/obj/item/food/cracker/dogtreat))

/obj/item/storage/fancy/cracker_pack
	name = "包装饼干"
	desc = "一个装着饼干的纸盒,不要放在鹦鹉能碰到的地方!"
	icon = 'modular_z121/icons/obj/citadel.dmi'
	icon_state = "crackerbox"
	base_icon_state = "crackerbox"
	contents_tag = "cracker"
	spawn_type = /obj/item/food/cracker
	spawn_count = 6

/obj/item/storage/fancy/cracker_pack/Initialize(mapload)
	. = ..()
	atom_storage.set_holdable(list(/obj/item/food/cracker))

/obj/item/food/cracker/dogtreat
	name = "狗粮"
	desc = "It's a scooby-snack. Right?"
	icon = 'modular_z121/icons/obj/citadel.dmi'
	icon_state = "dogtreat"
	bite_consumption = 1
	food_reagents = list(/datum/reagent/consumable/nutriment = 3)
	tastes = list("meat" = 1, "dough" = 1)
	foodtypes = GRAIN | MEAT
	food_flags = FOOD_FINGER_FOOD
	w_class = WEIGHT_CLASS_TINY

/datum/crafting_recipe/food/dogtreat
	name = "Dog Treat"
	reqs = list(
		/datum/reagent/consumable/salt = 1,
		/obj/item/food/meat/cutlet = 1,
		/obj/item/food/pastrybase = 1
	)
	result = /obj/item/food/cracker/dogtreat
	category = CAT_PASTRY

/datum/supply_pack/goody/dogtreatbox
	name = "狗粮"
	desc = "一盒狗粮"
	cost = PAYCHECK_LOWER * 4
	contains = list(/obj/item/storage/fancy/treat_box)

/datum/supply_pack/goody/cracker_pack
	name = "饼干"
	desc = "一盒饼干"
	cost = PAYCHECK_LOWER * 4
	contains = list(/obj/item/storage/fancy/cracker_pack)
