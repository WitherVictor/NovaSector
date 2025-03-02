/*
/obj/item/food/breadslice/Initialize()
	. = ..()
	AddComponent(/datum/component/customizable_reagent_holder, null, CUSTOM_INGREDIENT_ICON_STACK)

/obj/item/food/pie/plain/Initialize()
	. = ..()
	AddComponent(/datum/component/customizable_reagent_holder, null, CUSTOM_INGREDIENT_ICON_FILL, max_ingredients = 6)

/obj/item/food/cake/plain/Initialize()
	. = ..()
	AddComponent(/datum/component/customizable_reagent_holder, null, CUSTOM_INGREDIENT_ICON_FILL, max_ingredients = 6)

/obj/item/food/customizable/kebab
	name = "kebab"
	desc = "Delicious food on a stick."
	trash = /obj/item/stack/rods
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	max_ingredients = 6
	icon_state = "rod"
	AddComponent(/datum/component/customizable_reagent_holder, null, CUSTOM_INGREDIENT_ICON_LINE, max_ingredients = 6)

/obj/item/stack/rods/attackby(obj/item/W, mob/user, params)
	if(W.tool_behaviour == TOOL_WELDER)
		if(get_amount() < 2)
			to_chat(user, span_warning("You need at least two rods to do this!"))
			return

		if(W.use_tool(src, user, 0, volume=40))
			var/obj/item/stack/sheet/iron/new_item = new(usr.loc)
			user.visible_message(span_notice("[user.name] shaped [src] into iron sheets with [W]."), \
				span_notice("You shape [src] into iron sheets with [W]."), \
				span_hear("You hear welding."))
			var/obj/item/stack/rods/R = src
			src = null
			var/replace = (user.get_inactive_held_item()==R)
			R.use(2)
			if (!R && replace)
				user.put_in_hands(new_item)
	else if(istype(W, /obj/item/food/customizable/kebab))
		var/obj/item/food/S = W
		if(amount != 1)
			to_chat(user, "<span class='warning'>You must use a single rod!</span>")
		else if(S.w_class > WEIGHT_CLASS_SMALL)
			to_chat(user, "<span class='warning'>The ingredient is too big for [src]!</span>")
		else
			var/obj/item/food/customizable/A = new/obj/item/food/customizable/kebab(get_turf(src))
			A.initialize_custom_food(src, S, user)
	else
		return ..()

/obj/item/food/customizable/soup
	name = "soup"
	desc = "A bowl with liquid and... stuff in it."
	trash = /obj/item/reagent_containers/glass/bowl
	icon = 'icons/obj/food/soupsalad.dmi'
	icon_state = "wishsoup"

/obj/item/food/customizable/soup/Initialize()
	. = ..()
	eatverb = pick("slurp","sip","suck","inhale","drink")
	AddComponent(/datum/component/customizable_reagent_holder, null, CUSTOM_INGREDIENT_ICON_FILL, max_ingredients = 8)

/obj/item/reagent_containers/glass/bowl/on_reagent_change(changetype)
	..()
	update_icon()

/obj/item/reagent_containers/glass/bowl/update_icon_state()
	if(!reagents || !reagents.total_volume)
		icon_state = "bowl"

/obj/item/reagent_containers/glass/bowl/update_overlays()
	. = ..()
	if(reagents && reagents.total_volume)
		var/mutable_appearance/filling = mutable_appearance('icons/obj/food/soupsalad.dmi', "fullbowl")
		filling.color = mix_color_from_reagents(reagents.reagent_list)
		. += filling
*/