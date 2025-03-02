/*
/obj/item/coin/comm
	name = "纪念币"
	desc = "仅具有观赏价值的纪念货币,这枚硬币表面上镀有微量的贵金属,但是不足以改变它的价值."
	icon = 'modular_z121/icons/obj/economy.dmi'
	var/coinmat = null
	material_flags = MATERIAL_AFFECT_STATISTICS

/obj/item/coin/comm/iron
	name = "钢铁纪念币"
	desc = "仅具有观赏价值的纪念货币,和市面上的铁硬币价值相同."
	coinmat = "iron"
	custom_materials = list(/datum/material/iron = 400)

/obj/item/coin/comm/gold
	name = "黄金纪念币"
	coinmat = "gold"
	custom_materials = list(/datum/material/gold = 0,
							/datum/material/iron = 400)

/obj/item/coin/comm/silver
	name = "白银纪念币"
	desc = "仅具有观赏价值的纪念货币,这枚硬币的设计最后变成了标准通用货币的样式."
	coinmat = "silver"
	custom_materials = list(/datum/material/silver = 0,
							/datum/material/iron = 400)

/obj/item/coin/comm/diamond
	name = "钻石纪念币"
	desc = "仅具有观赏价值的纪念货币,这枚硬币由钢化玻璃制成."
	coinmat = "diamond"
	custom_materials = list(/datum/material/glass = 200,
							/datum/material/iron = 200)

/obj/item/coin/comm/plasma
	name = "离紫纪念币"
	desc = "仅具有观赏价值的纪念货币,由于等离子的危险性,这枚硬币由钢化玻璃仿制而成."
	coinmat = "plasma"
	custom_materials = list(/datum/material/glass = 300,
							/datum/material/iron = 100)

/obj/item/coin/comm/uranium
	name = "绿铀纪念币"
	desc = "仅具有观赏价值的纪念货币,这枚货币含有的铀少的可怜,因此它的辐射基本不会影响健康."
	coinmat = "uranium"
	custom_materials = list(/datum/material/uranium = 0,
							/datum/material/iron = 400)

/obj/item/coin/comm/bananium
	name = "香蕉纪念币"
	coinmat = "bananium"
	desc = "仅具有观赏价值的纪念货币,这枚硬币使用塑料制成,闻起来像是香蕉奶油派."
	custom_materials = list(/datum/material/plastic = 0,
							/datum/material/iron = 400)

/obj/item/coin/comm/adamantine
	name = "精金纪念币"
	coinmat = "adamantine"
	custom_materials = list(/datum/material/adamantine = 0,
							/datum/material/iron = 400)

/obj/item/coin/comm/mythril
	name = "秘银纪念币"
	coinmat = "mythril"
	custom_materials = list(/datum/material/mythril = 0,
							/datum/material/iron = 400)

/obj/item/coin/comm/Initialize()
	. = ..()
	icon_state = "coin_[coinmat]_[coinflip]"

/obj/item/coin/comm/attack_self(mob/user)
	if(cooldown < world.time)
		if(string_attached) //does the coin have a wire attached
			to_chat(user, "<span class='warning'>The coin won't flip very well with something attached!</span>" )
			return FALSE//do not flip the coin
		cooldown = world.time + 15
		flick("coin_[coinmat]_flip", src)
		coinflip = pick(sideslist)
		icon_state = "coin_[coinmat]_[coinflip]"
		playsound(user.loc, 'sound/items/coinflip.ogg', 50, TRUE)
		var/oldloc = loc
		sleep(15)
		if(loc == oldloc && user && !user.incapacitated
			user.visible_message("<span class='notice'>[user] flips [src]. It lands on [coinflip].</span>", \
				"<span class='notice'>You flip [src]. It lands on [coinflip].</span>", \
				"<span class='hear'>You hear the clattering of loose change.</span>")
	return TRUE//did the coin flip? useful for suicide_act
*/