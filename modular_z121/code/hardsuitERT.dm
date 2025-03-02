/obj/item/clothing/head/helmet/space/hardsuit/ert/rider
	name = "emergency response unit helmet"
	desc = "Rider command helmet for the ERT. This one is more armored than its standard version."
	icon = 'modular_z121/icons/obj/clothing/ertsuiticon.dmi'
	worn_icon = 'modular_z121/icons/mob/clothing/humanerthead.dmi'
	icon_state = "hardsuit0-ert_commander"
	hardsuit_type = "ert_commander"

/obj/item/clothing/suit/space/hardsuit/ert/rider
	name = "emergency response team suit"
	desc = "Rider command suit for the ERT. This one is more armored than its standard version."
	icon = 'modular_z121/icons/obj/clothing/ertsuiticon.dmi'
	worn_icon = 'modular_z121/icons/mob/clothing/humanertsuit.dmi'
	icon_state = "ert_command"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/rider

	//ERT Security
/obj/item/clothing/head/helmet/space/hardsuit/ert/rider/sec
	desc = "Rider security helmet for the ERT. This one is more armored than its standard version."
	icon_state = "hardsuit0-ert_security"
	hardsuit_type = "ert_security"

/obj/item/clothing/suit/space/hardsuit/ert/rider/sec
	desc = "Rider security suit for the ERT. This one is more armored than its standard version."
	icon_state = "ert_security"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/rider/sec

	//ERT Engineering
/obj/item/clothing/head/helmet/space/hardsuit/ert/rider/engi
	desc = "Rider engineer helmet for the ERT. This one is more armored than its standard version."
	icon_state = "hardsuit0-ert_engineer"
	hardsuit_type = "ert_engineert"

/obj/item/clothing/suit/space/hardsuit/ert/rider/engi
	desc = "Rider engineer suit for the ERT. This one is more armored than its standard version."
	icon_state = "ert_engineer"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/rider/engi

	//ERT Medical
/obj/item/clothing/head/helmet/space/hardsuit/ert/rider/med
	desc = "Rider medical helmet for the ERT. This one is more armored than its standard version."
	icon_state = "hardsuit0-ert_medical"
	hardsuit_type = "ert_medical"

/obj/item/clothing/suit/space/hardsuit/ert/rider/med
	desc = "Rider medical suit for the ERT. This one is more armored than its standard version."
	icon_state = "ert_medical"
	helmettype = /obj/item/clothing/head/helmet/space/hardsuit/ert/rider/med



/obj/item/clothing/head/helmet/space/hardsuit/ert
	//. = ..()
	icon = 'modular_nova/master_files/icons/obj/clothing/hats.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/head.dmi'
	icon_state = "hardsuit0-ert_commander-alert"
	inhand_icon_state = "hardsuit0-ert_commander-alert"
	hardsuit_type = "ert_commander-alert"

/obj/item/clothing/suit/space/hardsuit/ert
	//. = ..()
	icon = 'modular_nova/master_files/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_nova/master_files/icons/mob/clothing/suit.dmi'
	icon_state = "ert_command-alert"
	inhand_icon_state = "ert_command-alert"

/obj/item/clothing/head/helmet/space/hardsuit/ert/sec/Initialize()
	. = ..()
	icon_state = "hardsuit0-ert_security-alert"
	inhand_icon_state = "hardsuit0-ert_security-alert"
	hardsuit_type = "ert_security-alert"

/obj/item/clothing/suit/space/hardsuit/ert/sec/Initialize()
	. = ..()
	icon_state = "ert_security-alert"
	inhand_icon_state = "ert_security-alert"

/obj/item/clothing/head/helmet/space/hardsuit/ert/engi/Initialize()
	. = ..()
	icon_state = "hardsuit0-ert_engineer-alert"
	inhand_icon_state = "hardsuit0-ert_engineer-alert"
	hardsuit_type = "ert_engineer-alert"

/obj/item/clothing/suit/space/hardsuit/ert/engi/Initialize()
	. = ..()
	icon_state = "ert_engineer-alert"
	inhand_icon_state = "ert_engineer-alert"

/obj/item/clothing/head/helmet/space/hardsuit/ert/med/Initialize()
	. = ..()
	icon_state = "hardsuit0-ert_medical-alert"
	inhand_icon_state = "hardsuit0-ert_medical-alert"
	hardsuit_type = "ert_medical-alert"

/obj/item/clothing/suit/space/hardsuit/ert/med/Initialize()
	. = ..()
	icon_state = "ert_medical-alert"
	inhand_icon_state = "ert_medical-alert"

/datum/outfit/centcom/ert/commander/rider
	suit = /obj/item/clothing/suit/space/hardsuit/ert/rider

/datum/outfit/centcom/ert/security/rider
	suit = /obj/item/clothing/suit/space/hardsuit/ert/rider/sec

/datum/outfit/centcom/ert/medic/rider
	suit = /obj/item/clothing/suit/space/hardsuit/ert/rider/med

/datum/outfit/centcom/ert/engineer/rider
	suit = /obj/item/clothing/suit/space/hardsuit/ert/rider/engi

/datum/antagonist/ert/security/rider
	outfit = /datum/outfit/centcom/ert/security/rider

/datum/antagonist/ert/engineer/rider
	outfit = /datum/outfit/centcom/ert/engineer/rider

/datum/antagonist/ert/medic/rider
	outfit = /datum/outfit/centcom/ert/medic/rider

/datum/antagonist/ert/commander/rider
	outfit = /datum/outfit/centcom/ert/commander/rider

/datum/ert/red/rider
	leader_role = /datum/antagonist/ert/commander/rider
	roles = list(/datum/antagonist/ert/security/rider, /datum/antagonist/ert/medic/rider, /datum/antagonist/ert/engineer/rider)
	code = "Blue"