//  内置单发霰弹枪弹匣
/obj/item/ammo_box/magazine/internal/shot/single
	name = "单发内置霰弹枪弹匣"

	ammo_type = /obj/item/ammo_casing/shotgun/buckshot
	caliber = CALIBER_SHOTGUN

	max_ammo = 1

//  单发霰弹枪
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

//  移除单发霰弹枪的保险，之后可能单独拆分出来
/obj/item/gun/ballistic/shotgun/single/give_gun_safeties()
	return

//  双发步枪弹内置弹匣
/obj/item/ammo_box/magazine/internal/double_barrel
	name = "双管步枪内置弹匣"

	ammo_type = /obj/item/ammo_casing/c40sol
	caliber = CALIBER_SOL40LONG

	max_ammo = 2

//  三管枪
/obj/item/gun/ballistic/three_barrel
	name = "STS-30 三管战术步枪"
	desc = "整合式三管战斗平台，包含 .40 Long Sol 口径的双联步枪系统与下挂霰弹模块。"
	desc_controls = "左键: 发射步枪弹 | 右键: 发射霰弹"

	icon = 'modular_z121/icons/obj/guns/three_barrel.dmi'
	icon_state = "three_barrel"

	fire_sound = 'modular_nova/modules/modular_weapons/sounds/rifle_heavy.ogg'

	w_class = WEIGHT_CLASS_BULKY
	weapon_weight = WEAPON_HEAVY

	slot_flags = ITEM_SLOT_BACK

	bolt_type = BOLT_TYPE_NO_BOLT

	internal_magazine = TRUE
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/double_barrel

	//  下挂单发霰弹枪
	var/obj/item/gun/ballistic/shotgun/single/underbarrel

//  移除保险
/obj/item/gun/ballistic/three_barrel/give_gun_safeties()
	return

//  初始化时创建一个新的单发霰弹枪
/obj/item/gun/ballistic/three_barrel/Initialize()
	. = ..()
	underbarrel = new /obj/item/gun/ballistic/shotgun/single(src)
	update_appearance()

//  移除时删除单发霰弹枪
/obj/item/gun/ballistic/three_barrel/Destroy()
	QDEL_NULL(underbarrel)
	return ..()

//  右键发射下挂霰弹枪
/obj/item/gun/ballistic/three_barrel/try_fire_gun(atom/target, mob/living/user, params)
	if (LAZYACCESS(params2list(params), RIGHT_CLICK))
		return underbarrel.try_fire_gun(target, user, params)
	else
		return ..()

//  使用霰弹子弹，霰弹子弹堆，霰弹弹药盒装填时，为下挂枪管装填子弹
/obj/item/gun/ballistic/three_barrel/item_interaction(mob/living/user, obj/item/tool, list/modifiers)
	// 传递霰弹装填请求到子模块
	if (istype(tool, /obj/item/ammo_casing/shotgun) || \
	    istype(tool, /obj/item/ammo_box/magazine/ammo_stack/s12gauge) || \
		istype(tool, /obj/item/ammo_box/advanced/s12gauge))

		testing("Item is a shotgun shell or shell stack or shell box.")

		//  如果弹匣内有子弹，则将其弹出
		if (underbarrel.magazine.ammo_count())
			underbarrel.attack_self(user)

		//  转发给霰弹枪的交互来装填弹匣
		return underbarrel.item_interaction(user, tool, modifiers)
	else
		testing("Item is none of these condition, type is [tool.type].")
		return ..()
