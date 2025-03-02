/obj/item/clothing/suit/ran
	name = "shikigami costume"
	desc = "A costume that looks like a certain shikigami, is super fluffy."
	icon = 'modular_z121/icons/obj/clothing/clothingicon.dmi'
	worn_icon = 'modular_z121/icons/mob/clothing/clothing.dmi'
	worn_icon_digi = 'modular_z121/icons/mob/clothing/clothing.dmi'
	icon_state = "ran_suit"
	body_parts_covered = CHEST|GROIN|LEGS
	cold_protection = CHEST|GROIN|ARMS
	min_cold_protection_temperature = FIRE_SUIT_MIN_TEMP_PROTECT

/obj/item/clothing/head/ran
	name = "shikigami hat"
	desc = "A hat that looks like it keeps any fluffy ears contained super warm, has little charms over it."
	icon = 'modular_z121/icons/obj/clothing/clothingicon.dmi'
	worn_icon = 'modular_z121/icons/mob/clothing/clothing.dmi'
	worn_icon_muzzled = 'modular_z121/icons/mob/clothing/clothing.dmi'
	icon_state = "ran_hat"
	flags_inv = HIDEEARS

/obj/item/clothing/suit/egorabbit
	name = "兔子雇佣兵护甲"
	desc = "R公司的佣兵装甲服,这一件是便宜的仿制品,没有防御能力"
	icon = 'modular_z121/icons/obj/clothing/clothingicon.dmi'
	worn_icon = 'modular_z121/icons/mob/clothing/clothing.dmi'
	worn_icon_digi = 'modular_z121/icons/mob/clothing/clothing_digi.dmi'
	icon_state = "rabbit_grunt_suit"
	body_parts_covered = CHEST|GROIN|LEGS
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"队长" = list(
			RESKIN_ICON_STATE = "rabbit_suit",
			RESKIN_WORN_ICON_STATE =  "rabbit_suit",
		),
		"镇压" = list(
			RESKIN_ICON_STATE = "rabbit_grunt_suit",
			RESKIN_WORN_ICON_STATE =  "rabbit_grunt_suit",
		),
		"突击" = list(
			RESKIN_ICON_STATE = "rabbit_ass_suit",
			RESKIN_WORN_ICON_STATE =  "rabbit_ass_suit",
		),
	)

/obj/item/clothing/head/egorabbit
	name = "兔子雇佣兵头盔"
	desc = "R公司的佣兵装甲头盔,这一个是便宜的仿制品,没有防御能力"
	icon = 'modular_z121/icons/obj/clothing/clothingicon.dmi'
	worn_icon = 'modular_z121/icons/mob/clothing/clothing.dmi'
	worn_icon_muzzled = 'modular_z121/icons/mob/clothing/clothing_digi.dmi'
	icon_state = "rabbit_grunt_head"
	flags_inv = HIDEEARS
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"队长" = list(
			RESKIN_ICON_STATE = "rabbit_head",
			RESKIN_WORN_ICON_STATE =  "rabbit_head",
		),
		"兔子1" = list(
			RESKIN_ICON_STATE = "rabbit_grunt_head",
			RESKIN_WORN_ICON_STATE =  "rabbit_grunt_head",
		),
		"兔子2" = list(
			RESKIN_ICON_STATE = "rabbit_grunt_one_head",
			RESKIN_WORN_ICON_STATE =  "rabbit_grunt_one_head",
		),
		"兔子3" = list(
			RESKIN_ICON_STATE = "rabbit_grunt_two_head",
			RESKIN_WORN_ICON_STATE =  "rabbit_grunt_two_head",
		),
		"兔子4" = list(
			RESKIN_ICON_STATE = "rabbit_grunt_three_head",
			RESKIN_WORN_ICON_STATE =  "rabbit_grunt_three_head",
		),
	)

/obj/item/clothing/under/rank/captain/femformal
	name = "captain's female formal outfit"
	desc = "An ironically skimpy blue dress with gold markings denoting the rank of \"Captain\"."
	icon = 'modular_z121/icons/obj/clothing/uniforms.dmi'
	worn_icon = 'modular_z121/icons/mob/clothing/uniform.dmi'
	worn_icon_digi = 'modular_z121/icons/mob/clothing/uniform_digi.dmi'
	icon_state = "lewdcap"
	can_adjust = FALSE
	armor = list(MELEE = 0, BULLET = 0, LASER = 0, ENERGY = 0, BOMB = 0, BIO = 10, FIRE = 0, ACID = 0, WOUND = 5)
/*
/obj/machinery/vending/autodrobe/Initialize()
	skyrat_products[/obj/item/clothing/suit/ran] = 1
	skyrat_products[/obj/item/clothing/head/ran] = 1
	. = ..()
*/

/obj/item/clothing/head/costume/maidheadband/syndicate/fake
	name = "战术女仆头带复制品"

/obj/item/clothing/gloves/syndimaid
	name = "战术女仆护袖复制品"
	desc = "一双仿制的护袖手套,采用的材料更加轻薄,因此没有任何的保护能力."
	icon = 'modular_nova/master_files/icons/obj/clothing/gloves.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/hands.dmi'
	worn_icon_teshari = TESHARI_HANDS_ICON
	icon_state = "syndimaid_arms"

/obj/item/clothing/under/syndicate/nova/maid/fake
	name = "战术女仆装复制品"
	desc = "一套黑色毛衣裁剪并装饰成女仆装的样式."

/obj/item/clothing/accessory/maidcorset/syndicate
	name = "black maid apron"