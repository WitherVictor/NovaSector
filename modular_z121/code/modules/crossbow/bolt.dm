/obj/projectile/bullet/rebar/bolt
	name = "钢制弩箭"

	icon = 'modular_z121/icons/obj/guns/projectiles.dmi'
	icon_state = "steel_bolt"

	//  买的东西还有概率断肢显得太弱智了
	dismemberment = 0

/obj/item/ammo_casing/rebar/bolt
	name = "钢制弩箭"
	desc = "由碳钢铸造的弩箭，可以重复使用。适用于隐蔽作战，在太空内也能保持有效杀伤。"

	icon = 'modular_z121/icons/obj/guns/ammo.dmi'
	icon_state = "steel_bolt"
	base_icon_state = "steel_bolt"

	projectile_type = /obj/projectile/bullet/rebar/bolt
