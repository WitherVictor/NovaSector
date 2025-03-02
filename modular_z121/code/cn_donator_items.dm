/obj/item/pneumatic_cannon/pie/egg
	name = "鸡儿枪"
	desc = "制作这件物品的科学家有意向让他同时可以发射篮球。"
	force = 0
	icon = 'modular_z121/icons/obj/guns/guns.dmi'
	icon_state = "Chicken_gun"
	gasPerThrow = 0
	checktank = FALSE
	range_multiplier = 1
	throw_amount = 1
	selfcharge = TRUE
	charge_type = /obj/item/food/egg
	charge_ticks = 10
	maxWeightClass = 6
	var/static/list/egg_typecache = typecacheof(/obj/item/food/egg)

/obj/item/pneumatic_cannon/pie/egg/Initialize()
	. = ..()
	allowed_typecache = egg_typecache

/obj/item/toy/plush/skyrat/lanxue
	icon = 'modular_z121/icons/obj/plushes.dmi'
	name = "外星小龙毛绒玩具"
	desc = "蓝色的小龙毛绒玩具，看上去不太聪明的样子，抱一抱似乎能治愈你的情感创伤。"
	icon_state = "plushie_lanxue"
	attack_verb_continuous = list("cuddles","snuggles")
	attack_verb_simple = list("cuddle","snuggle")
	squeak_override = list('modular_nova/modules/customization/game/objects/items/sound/merowr.ogg' = 1)
	gender = FEMALE

/obj/item/toy/plush/skyrat/chen
	icon = 'modular_z121/icons/obj/plushes.dmi'
	name = "茂密毛绒玩具"
	desc = "一只有两条尾巴的茂密玩具，每个人都应该有一只fumo，但是她的妈咪呢?"
	icon_state = "plushie_chen"
	attack_verb_continuous = list("cuddles","snuggles")
	attack_verb_simple = list("cuddle","snuggle")
	squeak_override = list('modular_nova/modules/customization/game/objects/items/sound/merowr.ogg' = 1)
	gender = FEMALE

/obj/item/clothing/accessory/green_pin
	name = "绿徽章"
	desc = "赋予给新晋员工的徽章"

/obj/item/clothing/accessory/green_pin_fake
	name = "掉色绿徽章"
	desc = "赋予给新晋员工的徽章，这个看起来已经被使用了很长一段时间了。"
	icon_state = "green"
	icon = 'modular_nova/master_files/icons/obj/clothing/accessories.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/accessories.dmi'

/obj/item/toy/plush/skyrat/fumo
	icon = 'modular_z121/icons/obj/plushes.dmi'
	name = "fumo"
	desc = "A plushie of a....?"
	icon_state = "fumoplushie_marisa"
	attack_verb_continuous = list("cuddles","snuggles")
	attack_verb_simple = list("cuddle","snuggle")
	squeak_override = list('modular_nova/modules/customization/game/objects/items/sound/merowr.ogg' = 1)
	gender = FEMALE

/obj/item/toy/plush/skyrat/fumo/astolfo
	icon_state = "fumoplushie_astolfo"

/obj/item/toy/plush/skyrat/fumo/cirno
	icon_state = "fumoplushie_cirno"

/obj/item/toy/plush/skyrat/fumo/bocchi
	icon_state = "fumoplushie_bocchi"

/obj/item/nullrod/dream_breaker
	name = "dream breaker"
	desc = "A cross-shaped weapon emitting a faint, dream-like light. Its blows will wake any dreamer."
	icon = 'modular_z121/icons/obj/dreambreaker.dmi'
	icon_state = "dreambreaker"
	inhand_icon_state = "dreambreaker"
	lefthand_file = 'modular_z121/icons/mob/dreambreaker_left.dmi'
	righthand_file = 'modular_z121/icons/mob/dreambreaker_right.dmi'
	force = 15
	throwforce = 25
	throw_range = 10
	throw_speed = 2
	block_chance = 10
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	hitsound = SFX_SWING_HIT
	var/l_range = 3
	var/l_power = 0.8
	light_color = "#FFCC66"

/obj/item/nullrod/dream_breaker/Initialize()
	. = ..()
	set_light(l_range, l_power, light_color)