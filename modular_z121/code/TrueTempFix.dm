//Change Pod back to Bed
/obj/machinery/stasissleeper/Initialize()
	var/obj/machinery/stasissleeper/A = new /obj/machinery/stasis(src.loc)
	A.setDir(dir)
	new /obj/machinery/stasis
	qdel(src)
/*
//CHANGE STOMACH PUMP TO USE DRILL
/datum/surgery_step/stomach_pump
	name = "洗胃(使用钻类工具或血液过滤器)"
	implements = list(
		TOOL_DRILL = 100,
		/obj/item/blood_filter = 100,
		/obj/item/screwdriver/power = 80,
		/obj/item/pickaxe/drill = 60,
		TOOL_SCREWDRIVER = 25,
		/obj/item/kitchen/spoon = 20)
	time = 20
	accept_hand = FALSE
	repeatable = TRUE

/obj/item/reagent_containers/food/drinks/drinkingglass/shotglass/update_overlays()
	//. = ..()
	if(icon_state != "[base_icon_state]clear")
		return

	var/mutable_appearance/shot_overlay = mutable_appearance(icon, "shotglassoverlay")
	shot_overlay.color = mix_color_from_reagents(reagents.reagent_list)
	. += shot_overlay
*/
/*
/datum/techweb_node/bluespace_travel
	design_ids = list(
		"bluespace_pod",
		"launchpad",
		"launchpad_console",
		"quantumpad",
		"tele_hub",
		"tele_station",
		"teleconsole",
	)

/datum/techweb_node/micro_bluespace
	design_ids = list(
		"bluespace_matter_bin",
		"bluespacebodybag",
		"femto_mani",
		"quantum_keycard",
		"swapper",
		"triphasic_scanning",
		"wormholeprojector",
	)
*/
/obj/item/organ/genital/penis/Initialize()
	qdel(src)

/obj/item/organ/genital/testicles/Initialize()
	qdel(src)

/obj/item/organ/genital/vagina/Initialize()
	qdel(src)

/obj/item/organ/genital/womb/Initialize()
	qdel(src)
/*
/datum/map_template/ruin/space/skyrat/interdynefob
	name = "DS-2"
	id = "interdynefob"
	description = "If DS-1 was so good..."
	suffix = "interdynefob.dmm"
	always_place = FALSE
*/

//动能爪伤害削弱
/obj/item/kinetic_crusher/claw
	backstab_bonus = 75
/*
/datum/voucher_set/crusher_kit
	name = "Crusher Kit"
	description = "包含一个动能粉碎器兑换券和一个迷你灭火器.动能粉碎器是一种多功能近战采矿工具,既能采矿,也能与当地动物作战,除了最熟练和有自杀倾向的矿工以外的人很难有效使用它."
	icon = 'icons/obj/mining.dmi'
	icon_state = "crusher"
	set_items = list(
		/obj/item/extinguisher/mini,
		/obj/item/fivecrusher_voucher,
		)

/obj/item/fivecrusher_voucher
	name = "5号粉碎器兑换券"
	desc = "用于兑换5种粉碎器中的一种,在矿工装备贩卖机中使用."
	icon = 'icons/obj/mining.dmi'
	icon_state = "mining_voucher"
	w_class = WEIGHT_CLASS_TINY

//Code to redeem new items at the mining vendor using the suit voucher
//More items can be added in the lists and in the if statement.
/obj/machinery/computer/order_console/mining/proc/redeem_fivecrusher_voucher(/obj/item/fivecrusher_voucher/voucher, mob/redeemer)
	var/items = list(
		"原型+酷炫眼镜" = image(icon = 'icons/obj/mining.dmi', icon_state = "crusher"),
		"砍刀" = image(icon = 'modular_nova/modules/mining_crushers/icons/items_and_weapons.dmi', icon_state = "PKMachete"),
        "长矛" = image(icon = 'modular_nova/modules/mining_crushers/icons/items_and_weapons.dmi', icon_state = "PKSpear"),
        "大锤" = image(icon = 'modular_nova/modules/mining_crushers/icons/items_and_weapons.dmi', icon_state = "PKHammer"),
        "爪子" = image(icon = 'modular_nova/modules/mining_crushers/icons/items_and_weapons.dmi', icon_state = "PKClaw"),
	)

	var/selection = show_radial_menu(redeemer, src, items, require_near = TRUE, tooltips = TRUE)
	if(!selection || !Adjacent(redeemer) || QDELETED(voucher) || voucher.loc != redeemer)
		return
	var/drop_location = drop_location()
	switch(selection)
		if("原型+酷炫眼镜" )
			new /obj/item/kinetic_crusher(drop_location)
			new /obj/item/clothing/glasses/meson/gar(drop_location)
		if("砍刀")
			new /obj/item/kinetic_crusher/machete(drop_location)
		if("长矛")
			new /obj/item/kinetic_crusher/spear(drop_location)
		if("大锤")
			new /obj/item/kinetic_crusher/hammer(drop_location)
		if("爪子")
			new /obj/item/kinetic_crusher/claw(drop_location)

	SSblackbox.record_feedback("tally", "crusher_voucher_redeemed", 1, selection)
	qdel(voucher)
*/

/datum/config_entry/string/wikiurl
	default = "https://spacestation13cn.miraheze.org/wiki/%E9%A6%96%E9%A1%B5"

/datum/config_entry/string/forumurl
	default = "http://tgstation13.org/phpBB/index.php"

/datum/config_entry/string/rulesurl
	default = "https://spacestation13cn.miraheze.org/wiki/%E6%9C%8D%E5%8A%A1%E5%99%A8%E8%A7%84%E5%88%99"

/datum/config_entry/string/githuburl
	default = "https://www.github.com/tgstation/tgstation"