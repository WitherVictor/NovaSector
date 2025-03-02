/*
/datum/techweb_node/savannah_ivanov
	id = "mecha_savannah_ivanov"
	display_name = "EXOSUIT: Savannah-Ivanov"
	description = "Savannah-Ivanov exosuit designs"
	prereq_ids = list("adv_mecha", "weaponry", "exp_tools")
	design_ids = list(
		"savannah_ivanov_armor",
		"savannah_ivanov_chassis",
		"savannah_ivanov_head",
		"savannah_ivanov_left_arm",
		"savannah_ivanov_left_leg",
		"savannah_ivanov_main",
		"savannah_ivanov_peri",
		"savannah_ivanov_right_arm",
		"savannah_ivanov_right_leg",
		"savannah_ivanov_targ",
		"savannah_ivanov_torso",
	)
	research_costs = list(TECHWEB_POINT_TYPE_GENERIC = 2500)
*/
/obj/item/gun/ballistic/shotgun/automatic/combat/compact
	name = "warden's combat shotgun"
	desc = "A modified version of the semi-automatic combat shotgun with a collapsible stock and a safety that prevents firing while folded. For close encounters."
	icon = 'modular_z121/icons/obj/guns/40x32guns.dmi'
	icon_state = "riotshotgun"
	lefthand_file = 'icons/mob/inhands/weapons/64x_guns_left.dmi'
	righthand_file = 'icons/mob/inhands/weapons/64x_guns_right.dmi'
	inhand_icon_state = "shotgun_combat"
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	worn_icon = 'modular_z121/icons/mob/guns/guns_back.dmi'
	worn_icon_state = "ccshotgun"
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/shot/com
	w_class = WEIGHT_CLASS_BULKY
	var/stock = FALSE
	var/extend_sound = 'sound/items/weapons/batonextend.ogg'
	spread = 0
	can_be_sawn_off = FALSE
	unique_reskin = list("1Default" = "riotshotgun",
						"2cshotgun" = "cshotgun",
						"3cshotgun_slick" = "cshotgun_slick",
						"4riotshotgun_old" = "riotshotgun_old",
						"5riotshotgun_wood" = "riotshotgun_wood"
						)

/obj/item/gun/ballistic/shotgun/automatic/combat/compact/click_alt(mob/user)
	if(unique_reskin && !current_skin && user.can_perform_action(src))
		reskin_obj(user)
		return
	toggle_stock(user)
	. = ..()

/obj/item/gun/ballistic/shotgun/automatic/combat/compact/examine(mob/user)
	. = ..()
	. += "<span class='notice'>Alt-click to toggle the stock.</span>"

/obj/item/gun/ballistic/shotgun/automatic/combat/compact/proc/toggle_stock(mob/living/user)
	stock = !stock
	if(stock)
		w_class = WEIGHT_CLASS_BULKY
		weapon_weight = WEAPON_HEAVY
		to_chat(user, "You unfold the stock.")
		spread = 0
	else
		w_class = WEIGHT_CLASS_NORMAL
		weapon_weight = WEAPON_MEDIUM
		to_chat(user, "You fold the stock.")
		spread = 8
	playsound(src.loc, extend_sound, 50, 1)
	update_icon()

/obj/item/gun/ballistic/shotgun/automatic/combat/compact/update_icon_state()
	icon_state = "[current_skin ? unique_reskin[current_skin] : "cshotgun"][stock ? "" : "c"]"
/*
/obj/item/gun/ballistic/shotgun/automatic/combat/compact/afterattack(atom/target, mob/living/user, flag, params)
	if(!stock)
		shoot_with_empty_chamber(user)
		to_chat(user, "<span class='warning'>[src] won't fire with a folded stock!</span>")
	else
		. = ..()
		update_icon()
*/
/obj/structure/closet/secure_closet/warden/PopulateContents()
	. = ..()
	new /obj/item/gun/ballistic/shotgun/automatic/combat/compact(src)
/*
/obj/structure/closet/secure_closet/chief_medical/PopulateContents()
	. = ..()
	new /obj/item/surgical_processor/surgical_drapes(src)
*/
/*
//Armadyne oldarm Return
/datum/gun_company/oldarms
	name = "Armadyne Oldarms"
	illegal = TRUE
	can_roundstart_pick = FALSE
	company_flag = COMPANY_OLDARMS
	cost_change_lower = -2500
	cost_change_upper = 13000
	cost = 10000
	magazine_cost_mult = 2.5

#define ARMAMENT_CATEGORY_OLDARMS "Armadyne Oldarms"

/datum/armament_entry/cargo_gun/oldarms
	category = ARMAMENT_CATEGORY_OLDARMS
	company_bitflag = COMPANY_OLDARMS

/datum/armament_entry/cargo_gun/oldarms/pistol
	subcategory = ARMAMENT_SUBCATEGORY_PISTOL

/datum/armament_entry/cargo_gun/oldarms/pistol/luger
	item_type = /obj/item/gun/ballistic/automatic/pistol/luger
	lower_cost = CARGO_CRATE_VALUE * 7
	upper_cost = CARGO_CRATE_VALUE * 9

/datum/armament_entry/cargo_gun/oldarms/smg
	subcategory = ARMAMENT_SUBCATEGORY_SUBMACHINEGUN
	restricted = TRUE

/datum/armament_entry/cargo_gun/oldarms/smg/mp40
	item_type = /obj/item/gun/ballistic/automatic/mp40
	lower_cost = CARGO_CRATE_VALUE * 20
	upper_cost = CARGO_CRATE_VALUE * 24
	interest_required = HIGH_INTEREST

/datum/armament_entry/cargo_gun/oldarms/smg/uzi
	item_type = /obj/item/gun/ballistic/automatic/mini_uzi
	lower_cost = CARGO_CRATE_VALUE * 16
	upper_cost = CARGO_CRATE_VALUE * 20
	interest_required = PASSED_INTEREST

/datum/armament_entry/cargo_gun/oldarms/smg/pps
	item_type = /obj/item/gun/ballistic/automatic/pps
	lower_cost = CARGO_CRATE_VALUE * 15
	upper_cost = CARGO_CRATE_VALUE * 19
	interest_required = PASSED_INTEREST


/datum/armament_entry/cargo_gun/oldarms/rifle
	subcategory = ARMAMENT_SUBCATEGORY_ASSAULTRIFLE
	interest_required = HIGH_INTEREST
	restricted = TRUE

/datum/armament_entry/cargo_gun/oldarms/rifle/m16/oldarms
	item_type = /obj/item/gun/ballistic/automatic/m16/oldarms
	lower_cost = CARGO_CRATE_VALUE * 20
	upper_cost = CARGO_CRATE_VALUE * 24
	interest_required = HIGH_INTEREST

/datum/armament_entry/cargo_gun/oldarms/rifle/vintorez
	item_type = /obj/item/gun/ballistic/automatic/vintorez
	lower_cost = CARGO_CRATE_VALUE * 12
	upper_cost = CARGO_CRATE_VALUE * 18
*/

/datum/mutation/human/hulk
	disabled = FALSE

//SYNDICATE ITEM
/datum/uplink_item/device_tools/briefcase_launchpad
	name = "Briefcase Launchpad"
	desc = "A briefcase containing a launchpad, a device able to teleport items and people to and from targets up to eight tiles away from the briefcase. \
			Also includes a remote control, disguised as an ordinary folder. Touch the briefcase with the remote to link it."
	surplus = 0
	item = /obj/item/storage/briefcase/launchpad
	cost = 6

/datum/uplink_item/device_tools/syndicate_teleporter
	name = "Experimental Syndicate Teleporter"
	desc = "A handheld device that teleports the user 4-8 meters forward. \
			Beware, teleporting into a wall will trigger a parallel emergency teleport; \
			however if that fails, you may need to be stitched back together. \
			Comes with 4 charges, recharges randomly. Warranty null and void if exposed to an electromagnetic pulse."
	item = /obj/item/storage/box/syndie_kit/syndicate_teleporter
	cost = 8

/datum/uplink_item/device_tools/suspiciousphone
	name = "Protocol CRAB-17 Phone"
	desc = "The Protocol CRAB-17 Phone, a phone borrowed from an unknown third party, it can be used to crash the space market, funneling the losses of the crew to your bank account.\
	The crew can move their funds to a new banking site though, unless they HODL, in which case they deserve it."
	item = /obj/item/suspiciousphone
	restricted = TRUE
	cost = 7
	limited_stock = 1

//MirrorFix
/*
/obj/structure/mirror/attack_hand(mob/living/carbon/human/user)
	. = ..()

	if(. || !ishuman(user) || broken)
		return TRUE

	if(!user.can_perform_action(src, FORBID_TELEKINESIS_REACH) && !magical_mirror)
		return TRUE //no tele-grooming (if nonmagical)

	return display_radial_menu(user)
*/
/obj/item/hhmirror/attack_self(mob/user)
	. = ..()
	if(.)
		return
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
			//see code/modules/mob/dead/new_player/preferences.dm at approx line 545 for comments!
			//this is largely copypasted from there.

			//handle facial hair (if necessary)
		if(H.gender != FEMALE)
			var/new_style = input(user, "Select a facial hair style", "Grooming")  as null|anything in SSaccessories.facial_hairstyles_list
			if(!user.can_perform_action(src, FORBID_TELEKINESIS_REACH))
				return	//no tele-grooming
			if(new_style)
				H.facial_hairstyle = new_style
		else
			H.facial_hairstyle = "Shaved"

			//handle normal hair
		var/new_style = input(user, "Select a hair style", "Grooming")  as null|anything in SSaccessories.hairstyles_list
		if(!user.can_perform_action(src, FORBID_TELEKINESIS_REACH))
			return	//no tele-grooming
		if(new_style)
			H.hairstyle = new_style

		H.update_hair()

#define TRAIT_GIFTED "gifted"

/datum/quirk/gifted
	name = "Gifted"
	desc = "You were born a bit lucky, intelligent, or something in between. You're able to do a little more."
	icon = FA_ICON_DOVE
	quirk_flags = QUIRK_HUMAN_ONLY|QUIRK_HIDE_FROM_SCAN
	value = -6
	mob_trait = TRAIT_GIFTED
	gain_text = span_danger("You feel like you're just a little bit more flexible.")
	lose_text = span_notice("You feel a little less flexible.")
	medical_record_text = "Patient has a history of uncanny fortune."
	hardcore_value = 0
	hidden_quirk = FALSE
/*
/datum/quirk/oversized
	allow_for_donator = TRUE
*/
/datum/quirk/equipping/entombed
	veteran_only = FALSE

/datum/quirk/item_quirk/underworld_connections
	veteran_only = FALSE

/datum/quirk/system_shock
	hidden_quirk = FALSE

/*
//Fluffy
/datum/quirk/gifted
	hidden_quirk = FALSE
*/
//颅骨开裂
/datum/wound_pregen_data/cranial_fissure
	weight = 5

/datum/job/clown
	veteran_only = FALSE

/datum/job/mime
	veteran_only = FALSE


//StupidTech
/datum/techweb_node/adv_vision
	prereq_ids = list(TECHWEB_NODE_COMBAT_IMPLANTS)