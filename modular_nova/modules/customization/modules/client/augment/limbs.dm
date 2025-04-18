/datum/augment_item/limb
	category = AUGMENT_CATEGORY_LIMBS
	allowed_biotypes = MOB_ORGANIC|MOB_ROBOTIC
	///Hardcoded styles that can be chosen from and apply to limb, if it's true
	var/uses_robotic_styles = TRUE
	///Should we draw these greyscale?
	var/uses_greyscale = FALSE
	///Used for legs - if it has a digitigrade sprite variant, set to TRUE.
	var/supports_digitigrade = FALSE

/datum/augment_item/limb/apply(mob/living/carbon/human/augmented, character_setup = FALSE, datum/preferences/prefs)
	if(character_setup)
		//Cheaply "faking" the appearance of the prosthetic. Species code sets this back if it doesnt exist anymore
		var/obj/item/bodypart/new_limb = path
		var/body_zone = initial(new_limb.body_zone)
		var/obj/item/bodypart/old_limb = augmented.get_bodypart(body_zone)

		if(old_limb.limb_id != BODYPART_ID_DIGITIGRADE || supports_digitigrade == FALSE) //Retain digitigrade status
			old_limb.limb_id = initial(new_limb.limb_id)
			old_limb.base_limb_id = initial(new_limb.limb_id)
		old_limb.is_dimorphic = initial(new_limb.is_dimorphic)
		if(istype(old_limb, /obj/item/bodypart/head))
			var/obj/item/bodypart/head/old_head = old_limb
			var/obj/item/bodypart/head/new_head = new_limb
			old_head.eyes_icon = new_head.eyes_icon

		if(uses_robotic_styles && prefs.augment_limb_styles[slot])
			var/chosen_style = GLOB.robotic_styles_list[prefs.augment_limb_styles[slot]]
			old_limb.set_icon_static(chosen_style)
			old_limb.current_style = prefs.augment_limb_styles[slot]
		else
			if(!uses_greyscale)
				old_limb.set_icon_static(initial(new_limb.icon))
			else
				old_limb.set_icon_greyscale(UNLINT(initial(new_limb.icon_greyscale))) // stupid var_protected memes
		old_limb.should_draw_greyscale = uses_greyscale

		return body_zone
	else
		var/obj/item/bodypart/new_limb = new path(augmented)
		var/obj/item/bodypart/old_limb = augmented.get_bodypart(new_limb.body_zone)
		if(uses_robotic_styles && prefs.augment_limb_styles[slot])
			var/chosen_style = GLOB.robotic_styles_list[prefs.augment_limb_styles[slot]]
			new_limb.set_icon_static(chosen_style)
			new_limb.current_style = prefs.augment_limb_styles[slot]
		if(supports_digitigrade == TRUE && old_limb.limb_id == BODYPART_ID_DIGITIGRADE)
			new_limb.limb_id = BODYPART_ID_DIGITIGRADE
			new_limb.base_limb_id = BODYPART_ID_DIGITIGRADE
			new_limb.bodyshape = old_limb.bodyshape

		new_limb.replace_limb(augmented, special = TRUE)
		qdel(old_limb)

//HEADS
/datum/augment_item/limb/head
	slot = AUGMENT_SLOT_HEAD

/datum/augment_item/limb/head/cyborg
	name = "Cyborg head"
	path = /obj/item/bodypart/head/robot/weak

//CHESTS
/datum/augment_item/limb/chest
	slot = AUGMENT_SLOT_CHEST

/datum/augment_item/limb/chest/cyborg
	name = "Cyborg chest"
	path = /obj/item/bodypart/chest/robot/weak

//LEFT ARMS
/datum/augment_item/limb/l_arm
	slot = AUGMENT_SLOT_L_ARM

/datum/augment_item/limb/l_arm/prosthetic
	name = "Prosthetic left arm"
	path = /obj/item/bodypart/arm/left/robot/surplus
	cost = -1

/datum/augment_item/limb/l_arm/cyborg
	name = "Cyborg left arm"
	path = /obj/item/bodypart/arm/left/robot/weak

/datum/augment_item/limb/l_arm/plasmaman
	name = "Plasmaman left arm"
	path = /obj/item/bodypart/arm/left/plasmaman
	uses_robotic_styles = FALSE

/datum/augment_item/limb/l_arm/peg
	name = "Left peg arm"
	path = /obj/item/bodypart/arm/left/ghetto
	cost = -2
	uses_robotic_styles = FALSE

/datum/augment_item/limb/l_arm/self_destruct
	name = "No Left Arm"
	path = /obj/item/bodypart/arm/left/self_destruct
	cost = -3
	uses_robotic_styles = FALSE

//RIGHT ARMS
/datum/augment_item/limb/r_arm
	slot = AUGMENT_SLOT_R_ARM

/datum/augment_item/limb/r_arm/prosthetic
	name = "Prosthetic right arm"
	path = /obj/item/bodypart/arm/right/robot/surplus
	cost = -1

/datum/augment_item/limb/r_arm/cyborg
	name = "Cyborg right arm"
	path = /obj/item/bodypart/arm/right/robot/weak

/datum/augment_item/limb/r_arm/plasmaman
	name = "Plasmaman right arm"
	path = /obj/item/bodypart/arm/right/plasmaman
	uses_robotic_styles = FALSE

/datum/augment_item/limb/r_arm/peg
	name = "Right peg arm"
	path = /obj/item/bodypart/arm/right/ghetto
	cost = -2
	uses_robotic_styles = FALSE

/datum/augment_item/limb/r_arm/self_destruct
	name = "No Right Arm"
	path = /obj/item/bodypart/arm/right/self_destruct
	cost = -3
	uses_robotic_styles = FALSE

//LEFT LEGS
/datum/augment_item/limb/l_leg
	slot = AUGMENT_SLOT_L_LEG

/datum/augment_item/limb/l_leg/prosthetic
	name = "Prosthetic left leg"
	path = /obj/item/bodypart/leg/left/robot/surplus
	cost = -1

/datum/augment_item/limb/l_leg/cyborg
	name = "Cyborg left leg"
	path = /obj/item/bodypart/leg/left/robot/weak

/datum/augment_item/limb/l_leg/plasmaman
	name = "Plasmaman left leg"
	path = /obj/item/bodypart/leg/left/plasmaman
	uses_robotic_styles = FALSE

/datum/augment_item/limb/l_leg/peg
	name = "Left peg leg"
	path = /obj/item/bodypart/leg/left/ghetto
	cost = -2

/datum/augment_item/limb/l_leg/self_destruct
	name = "No Left Leg"
	path = /obj/item/bodypart/leg/left/self_destruct
	cost = -3
	uses_robotic_styles = FALSE

//RIGHT LEGS
/datum/augment_item/limb/r_leg
	slot = AUGMENT_SLOT_R_LEG

/datum/augment_item/limb/r_leg/prosthetic
	name = "Prosthetic right leg"
	path = /obj/item/bodypart/leg/right/robot/surplus
	cost = -1

/datum/augment_item/limb/r_leg/cyborg
	name = "Cyborg right leg"
	path = /obj/item/bodypart/leg/right/robot/weak

/datum/augment_item/limb/r_leg/plasmaman
	name = "Plasmaman right leg"
	path = /obj/item/bodypart/leg/right/plasmaman
	uses_robotic_styles = FALSE

/datum/augment_item/limb/r_leg/peg
	name = "Right peg leg"
	path = /obj/item/bodypart/leg/right/ghetto
	cost = -2

/datum/augment_item/limb/r_leg/self_destruct
	name = "No Right Leg"
	path = /obj/item/bodypart/leg/right/self_destruct
	cost = -3
	uses_robotic_styles = FALSE
