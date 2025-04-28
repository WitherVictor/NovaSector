/obj/item/ammo_box/magazine/internal/shot/single
	name = "单发内置霰弹枪弹匣"

	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	caliber = CALIBER_SHOTGUN

	max_ammo = 1

/obj/item/gun/ballistic/shotgun/single
	name = "Romerol 77"
	desc = "一把中折式单发霰弹枪，每次发射之后都要重新装填。"

	internal_magazine = TRUE
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/shot/single

	fire_sound = 'sound/items/weapons/gun/shotgun/shot.ogg'

	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

	slot_flags = ITEM_SLOT_BACK

	semi_auto = TRUE
	bolt_type = BOLT_TYPE_NO_BOLT

/obj/item/gun/ballistic/shotgun/single/give_gun_safeties()
	return

/obj/item/ammo_box/magazine/internal/double_barrel
	name = "双管步枪内置弹匣"

	ammo_type = /obj/item/ammo_casing/c40sol
	caliber = CALIBER_SOL40LONG

	max_ammo = 2

/obj/item/gun/ballistic/three_barrel
	name = "STS-30 三管战术步枪"
	desc = "整合式三管战斗平台，包含双联步枪系统与下挂霰弹模块。"
	desc_controls = "左键: 发射步枪弹 | 右键: 发射霰弹"

	icon = 'icons/obj/weapons/guns/ballistic.dmi'
	icon_state = "dshotgun"

	fire_sound = 'modular_nova/modules/modular_weapons/sounds/rifle_heavy.ogg'

	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

	slot_flags = ITEM_SLOT_BACK

	bolt_type = BOLT_TYPE_NO_BOLT

	internal_magazine = TRUE
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/double_barrel

	var/obj/item/gun/ballistic/shotgun/single/underbarrel

/obj/item/gun/ballistic/three_barrel/give_gun_safeties()
	return

/obj/item/gun/ballistic/three_barrel/Initialize()
	. = ..()
	underbarrel = new /obj/item/gun/ballistic/shotgun/single(src)
	update_appearance()

/obj/item/gun/ballistic/three_barrel/Destroy()
	QDEL_NULL(underbarrel)
	return ..()

/obj/item/gun/ballistic/three_barrel/try_fire_gun(atom/target, mob/living/user, params)
	if (LAZYACCESS(params2list(params), RIGHT_CLICK))
		return underbarrel.try_fire_gun(target, user, params)
	else
		return ..()

/obj/item/gun/ballistic/three_barrel/item_interaction(mob/living/user, obj/item/tool, list/modifiers)
	// 传递霰弹装填请求到子模块
	if (istype(tool, /obj/item/ammo_casing/shotgun) || \
	    istype(tool, /obj/item/ammo_box/magazine/ammo_stack/s12gauge) || \
		istype(tool, /obj/item/ammo_box/advanced/s12gauge))

		testing("Item is a shotgun shell or shell stack or shell box.")

		if (underbarrel.magazine.ammo_count())
			underbarrel.attack_self(user)

		return underbarrel.item_interaction(user, tool, modifiers)
	else
		testing("Item is none of these condition, type is [tool.type].")
		return ..()
