/obj/item/disk/bitrunning/item/guns
	name = "比特运行装备：枪械"
	desc = "一张包含源各种测试枪械的代码的软盘，内部存有各种枪械"
	selectable_items = list(
		/obj/item/storage/toolbox/guncase/sofap,
		/obj/item/storage/toolbox/guncase/tac9,
		/obj/item/storage/toolbox/guncase/bfr500,
		/obj/item/storage/toolbox/guncase/ostrza,
		/obj/item/storage/toolbox/guncase/europa,
		/obj/item/storage/toolbox/guncase/aa12,
		/obj/item/gun/energy/photon_sniper,
	)

//	SOFAP
/obj/item/storage/toolbox/guncase/sofap
	name = "SOFAP 枪箱"
	weapon_to_spawn = /obj/item/gun/ballistic/automatic/pistol/sofap/stendo
	extra_to_spawn = /obj/item/ammo_box/magazine/c35sol_pistol/stendo

//	变长弹匣
/obj/item/gun/ballistic/automatic/pistol/sofap/stendo
	spawn_magazine_type = /obj/item/ammo_box/magazine/c35sol_pistol/stendo

//	TAC-9
/obj/item/storage/toolbox/guncase/tac9
	name = "TAC-9 枪箱"
	weapon_to_spawn = /obj/item/gun/ballistic/automatic/pistol/tac9
	extra_to_spawn = /obj/item/ammo_box/magazine/tac9

//	BER-500
/obj/item/storage/toolbox/guncase/bfr500
	name = "BER-500 枪箱"
	weapon_to_spawn = /obj/item/gun/ballistic/revolver/single
	extra_to_spawn = /obj/item/ammo_box/speedloader/bfr500

//	Ostrza
/obj/item/storage/toolbox/guncase/ostrza
	name = "Ostrza 枪箱"
	weapon_to_spawn = /obj/item/gun/ballistic/automatic/ostrza
	extra_to_spawn = /obj/item/ammo_box/magazine/lanca

//	Europa
/obj/item/storage/toolbox/guncase/europa
	name = "Europa 枪箱"
	weapon_to_spawn = /obj/item/gun/ballistic/automatic/europa
	extra_to_spawn = /obj/item/ammo_box/magazine/europa

//	Solstice
/obj/item/storage/toolbox/guncase/solstice
	name = "Solstice 枪箱"
	weapon_to_spawn = /obj/item/gun/ballistic/rifle/solstice
	extra_to_spawn = /obj/item/ammo_box/magazine/lanca

//	AA12
/obj/item/storage/toolbox/guncase/aa12
	name = "AA12 枪箱"
	weapon_to_spawn = /obj/item/gun/ballistic/shotgun/aa12/buckshot
	extra_to_spawn = /obj/item/ammo_box/magazine/aa12/drum/buckshot

//	初始弹匣变为杀伤
/obj/item/gun/ballistic/shotgun/aa12/buckshot
	spawn_magazine_type = /obj/item/ammo_box/magazine/aa12/drum/buckshot

/obj/item/ammo_box/magazine/aa12/drum/buckshot
	ammo_type = /obj/item/ammo_casing/shotgun/buckshot

