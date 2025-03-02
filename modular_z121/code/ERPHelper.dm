/obj/item/organ/external/genital/penis/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/organ/external/genital/testicles/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/organ/external/genital/vagina/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/organ/external/genital/womb/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/organ/external/genital/anus/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/organ/external/genital/breasts/Initialize(mapload)
	.=..()
	qdel(src)



/datum/reagent/drug/crocin
	name = "Crocin"
	description = "Naturally found in the crocus and gardenia flowers, this drug acts as a natural sweetener."
	taste_description = "strawberries"
	color = "#FFADFF"

/obj/structure/bed/bdsm_bed
	name = "bdsm bed"
	desc = "A latex bed with D-rings on the sides. Looks comfortable."
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_structures/bdsm_furniture.dmi'
	icon_state = "bdsm_bed"
	max_integrity = 50

/obj/structure/bed/bdsm_bed/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/bdsm_bed_kit
	name = "bdsm bed construction kit"
	desc = "Construction requires a wrench."
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_structures/bdsm_furniture.dmi'
	throwforce = 0
	icon_state = "bdsm_bed_kit"
	w_class = WEIGHT_CLASS_HUGE

/obj/item/bdsm_bed_kit/Initialize(mapload)
	.=..()
	qdel(src)

/obj/structure/chair/x_stand
	name = "x stand"
	desc = "A stand for buckling people in an X shape."
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_structures/bdsm_furniture.dmi'
	icon_state = "xstand"
	max_buckled_mobs = 1
	max_integrity = 75

/obj/structure/chair/x_stand/Initialize(mapload)
	.=..()
	qdel(src)

/obj/structure/pole
	name = "stripper pole"
	desc = "A pole fastened to the ceiling and floor, used to show of one's goods to company."
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_structures/dancing_pole.dmi'
	icon_state = "pole"
	density = TRUE
	anchored = TRUE
	max_integrity = 75

/obj/structure/pole/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/polepack
	name = "pink stripper pole flatpack"
	desc = "Construction requires a wrench."
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_structures/dancing_pole.dmi'
	throwforce = 0
	icon_state = "pole_base"

/obj/item/polepack/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/storage/box/strippole_kit/Initialize(mapload)
	.=..()
	qdel(src)

/obj/structure/chair/shibari_stand/Initialize(mapload)
	.=..()
	qdel(src)


/obj/structure/chair/milking_machine
	name = "milking machine"
	desc = "A stationary device for milking... things."
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_structures/milking_machine.dmi'
	icon_state = "milking_pink_off"
	max_buckled_mobs = 1
	item_chair = null
	max_integrity = 75

/obj/structure/chair/milking_machine/Initialize(mapload)
	.=..()
	qdel(src)

//PILL
/obj/item/reagent_containers/pill/crocin
	name = "crocin pill (10u)"
	desc = "I've fallen, and I can't get it up!"
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_items/lewd_pills.dmi'
	icon_state = "crocin"
	list_reagents = list(/datum/reagent/water = 1)

/obj/item/reagent_containers/pill/hexacrocin
	name = "hexacrocin pill (10u)"
	desc = "Pill in creepy heart form."
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_items/lewd_pills.dmi'
	icon_state = "hexacrocin"
	list_reagents = list(/datum/reagent/water = 1)

/obj/item/reagent_containers/pill/dopamine
	name = "dopamine pill (5u)"
	desc = "Feelings of orgasm, contained in a pill... Weird."
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_items/lewd_pills.dmi'
	icon_state = "dopamine"
	list_reagents = list(/datum/reagent/water = 1)

/obj/item/reagent_containers/pill/camphor
	name = "camphor pill (10u)"
	desc = "For the early bird."
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_items/lewd_pills.dmi'
	icon_state = "camphor"
	list_reagents = list(/datum/reagent/water = 1)

/obj/item/reagent_containers/pill/pentacamphor
	name = "pentacamphor pill (10u)"
	desc = "The chemical equivalent of horny jail."
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_items/lewd_pills.dmi'
	icon_state = "pentacamphor"
	list_reagents = list(/datum/reagent/water = 1)

/obj/item/reagent_containers/pill/crocin/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/reagent_containers/pill/hexacrocin/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/reagent_containers/pill/dopamine/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/reagent_containers/pill/camphor/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/reagent_containers/pill/pentacamphor/Initialize(mapload)
	.=..()
	qdel(src)

//sextoy
/obj/item/bdsm_candle
	name = "soy candle"
	desc = "A candle with low melting temperature."
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_items/lewd_items.dmi'
	lefthand_file = 'modular_nova/modules/modular_items/lewd_items/icons/mob/lewd_inhands/lewd_inhand_left.dmi'
	righthand_file = 'modular_nova/modules/modular_items/lewd_items/icons/mob/lewd_inhands/lewd_inhand_right.dmi'
	icon_state = "candle"
	inhand_icon_state = "candle"
	w_class = WEIGHT_CLASS_TINY

/obj/item/bdsm_candle/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/serviette
	name = "serviette"
	desc = "To clean all the mess."
	icon_state = "serviette_clean"
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_items/lewd_items.dmi'

/obj/item/serviette/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/serviette_used
	name = "serviette"
	desc = "To clean all the mess."
	icon_state = "serviette_clean"
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_items/lewd_items.dmi'

/obj/item/serviette_used/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/serviette_pack
	name = "pack of serviettes"
	desc = "I wonder why LustWish makes them..."
	icon_state = "serviettepack"
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_items/lewd_items.dmi'

/obj/item/serviette_pack/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/clothing/sextoy/eggvib
	name = "vibrating egg"
	desc = "A simple, vibrating sex toy."
	icon_state = "eggvib"
	inhand_icon_state = "eggvib"
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_items/lewd_items.dmi'
	lefthand_file = 'modular_nova/modules/modular_items/lewd_items/icons/mob/lewd_inhands/lewd_inhand_left.dmi'
	righthand_file = 'modular_nova/modules/modular_items/lewd_items/icons/mob/lewd_inhands/lewd_inhand_right.dmi'

/obj/item/clothing/sextoy/eggvib/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/clothing/sextoy/eggvib/signalvib
	name = "signal vibrating egg"
	desc = "A vibrating sex toy with remote control capability. Use a signaller to turn it on."
	icon_state = "signalvib"
	inhand_icon_state = "signalvib"

/obj/item/clothing/sextoy/eggvib/signalvib/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/clothing/sextoy/buttplug
	name = "buttplug"
	desc = "I'm meant to put that WHERE?!"
	icon_state = "buttplug"
	worn_icon_state = "buttplug"
	worn_icon = 'modular_nova/modules/modular_items/lewd_items/icons/mob/lewd_items/lewd_items.dmi'
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_items/lewd_items.dmi'
	lefthand_file = 'modular_nova/modules/modular_items/lewd_items/icons/mob/lewd_inhands/lewd_inhand_left.dmi'
	righthand_file = 'modular_nova/modules/modular_items/lewd_items/icons/mob/lewd_inhands/lewd_inhand_right.dmi'

/obj/item/clothing/sextoy/buttplug/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/clothing/sextoy/nipple_clamps
	name = "nipple clamps"
	desc = "For causing nipple pain."
	icon_state = "clamps"
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_items/lewd_items.dmi'

/obj/item/clothing/sextoy/nipple_clamps/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/condom_pack
	name = "condom pack"
	desc = "Don't worry, I have protection."
	icon_state = "condom_pack"
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_items/lewd_items.dmi'
	w_class = WEIGHT_CLASS_TINY

/obj/item/condom_pack/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/clothing/sextoy/condom
	name = "condom"
	desc = "I wonder if I can put this over my head..."
	icon_state = "condom"
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_items/lewd_items.dmi'
	w_class = WEIGHT_CLASS_TINY

/obj/item/clothing/sextoy/condom/Initialize(mapload)
	.=..()
	qdel(src)


/obj/item/clothing/sextoy/dildo
	name = "dildo"
	desc = "A large plastic penis, much like the one in your mother's bedside drawer."
	icon_state = "dildo"
	inhand_icon_state = "dildo"
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_items/lewd_items.dmi'
	lefthand_file = 'modular_nova/modules/modular_items/lewd_items/icons/mob/lewd_inhands/lewd_inhand_left.dmi'
	righthand_file = 'modular_nova/modules/modular_items/lewd_items/icons/mob/lewd_inhands/lewd_inhand_right.dmi'

/obj/item/clothing/sextoy/dildo/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/clothing/sextoy/dildo/custom_dildo
	name = "custom dildo"
	desc = "A dildo that can be customized to your specification."
	icon_state = "polydildo"
	inhand_icon_state = "polydildo"
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_items/lewd_items.dmi'
	lefthand_file = 'modular_nova/modules/modular_items/lewd_items/icons/mob/lewd_inhands/lewd_inhand_left.dmi'
	righthand_file = 'modular_nova/modules/modular_items/lewd_items/icons/mob/lewd_inhands/lewd_inhand_right.dmi'

/obj/item/clothing/sextoy/dildo/custom_dildo/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/clothing/sextoy/dildo/double_dildo
	name = "double dildo"
	desc = "You'll have to be a real glizzy gladiator to contend with this."
	icon_state = "dildo_double"
	inhand_icon_state = "dildo_double"
	worn_icon_state = "dildo_side"
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_items/lewd_items.dmi'
	worn_icon = 'modular_nova/modules/modular_items/lewd_items/icons/mob/lewd_items/lewd_items.dmi'
	lefthand_file = 'modular_nova/modules/modular_items/lewd_items/icons/mob/lewd_inhands/lewd_inhand_left.dmi'
	righthand_file = 'modular_nova/modules/modular_items/lewd_items/icons/mob/lewd_inhands/lewd_inhand_right.dmi'
	w_class = WEIGHT_CLASS_TINY

/obj/item/clothing/sextoy/dildo/double_dildo/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/spanking_pad
	name = "spanking pad"
	desc = "A leather pad with a handle."
	icon_state = "spankpad"
	inhand_icon_state = "spankpad"
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_items/lewd_items.dmi'
	lefthand_file = 'modular_nova/modules/modular_items/lewd_items/icons/mob/lewd_inhands/lewd_inhand_left.dmi'
	righthand_file = 'modular_nova/modules/modular_items/lewd_items/icons/mob/lewd_inhands/lewd_inhand_right.dmi'
	w_class = WEIGHT_CLASS_SMALL

/obj/item/spanking_pad/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/clothing/sextoy/vibrator
	name = "vibrator"
	desc = "Woah. What an... Interesting item. I wonder what this red button does..."
	icon_state = "vibrator"
	inhand_icon_state = "vibrator"
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_items/lewd_items.dmi'
	lefthand_file = 'modular_nova/modules/modular_items/lewd_items/icons/mob/lewd_inhands/lewd_inhand_left.dmi'
	righthand_file = 'modular_nova/modules/modular_items/lewd_items/icons/mob/lewd_inhands/lewd_inhand_right.dmi'

/obj/item/clothing/sextoy/vibrator/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/clothing/sextoy/vibroring
	name = "vibrating ring"
	desc = "A ring toy used to keep your erection going strong."
	icon_state = "vibroring"
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_items/lewd_items.dmi'

/obj/item/clothing/sextoy/vibroring/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/clothing/sextoy/magic_wand
	name = "magic wand"
	desc = "Not sure where is magic in this thing, but if you press button - it makes funny vibrations"
	icon_state = "magicwand"
	worn_icon_state = "magicwand"
	inhand_icon_state = "magicwand"
	worn_icon = 'modular_nova/modules/modular_items/lewd_items/icons/mob/lewd_items/lewd_items.dmi'
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_items/lewd_items.dmi'
	lefthand_file = 'modular_nova/modules/modular_items/lewd_items/icons/mob/lewd_inhands/lewd_inhand_left.dmi'
	righthand_file = 'modular_nova/modules/modular_items/lewd_items/icons/mob/lewd_inhands/lewd_inhand_right.dmi'

/obj/item/clothing/sextoy/magic_wand/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/clothing/mask/leatherwhip
	name = "leather whip"
	desc = "A tool used for domination. Hurts in a way you like it."
	icon_state = "leather"
	worn_icon_state = "leather"
	inhand_icon_state = "leather"
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_items/lewd_items.dmi'
	worn_icon = 'modular_nova/modules/modular_items/lewd_items/icons/mob/lewd_clothing/lewd_masks.dmi'
	worn_icon_muzzled = 'modular_nova/master_files/icons/mob/clothing/mask_muzzled.dmi'
	lefthand_file = 'modular_nova/modules/modular_items/lewd_items/icons/mob/lewd_inhands/lewd_inhand_left.dmi'
	righthand_file = 'modular_nova/modules/modular_items/lewd_items/icons/mob/lewd_inhands/lewd_inhand_right.dmi'
	w_class = WEIGHT_CLASS_NORMAL
	hitsound = 'sound/items/weapons/whip.ogg'

/obj/item/clothing/mask/leatherwhip/Initialize(mapload)
	.=..()
	qdel(src)

//CLOTHING
/obj/item/clothing/gloves/ball_mittens
	name = "ball mittens"
	desc = "A nice, comfortable pair of inflatable ball gloves."
	icon_state = "ballmittens"
	inhand_icon_state = "ballmittens"
	icon = 'modular_nova/modules/modular_items/lewd_items/icons/obj/lewd_clothing/lewd_gloves.dmi'
	worn_icon = 'modular_nova/modules/modular_items/lewd_items/icons/mob/lewd_clothing/lewd_gloves.dmi'
	breakouttime = 1 SECONDS

/obj/item/clothing/gloves/ball_mittens/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/clothing/mask/ballgag
	name = "phallic ball gag"
	desc = "Prevents the wearer from speaking, as well as making breathing harder."
	icon_state = "chokegag"

/obj/item/clothing/mask/ballgag/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/clothing/mask/ballgag/choking
	name = "phallic ball gag"
	desc = "Prevents the wearer from speaking, as well as making breathing harder."
	icon_state = "chokegag"

/obj/item/clothing/mask/ballgag/choking/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/tickle_feather
	name = "tickling feather"
	desc = "A rather ticklish feather that can be used in both mirth and malice."
	icon_state = "feather"

/obj/item/tickle_feather/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/kinky_shocker
	name = "kinky shocker"
	desc = "A small toy that can weakly shock someone."
	icon_state = "shocker"

/obj/item/kinky_shocker/Initialize(mapload)
	.=..()
	qdel(src)

/obj/item/electropack/shockcollar
	worn_icon_teshari = 'modular_z121/icons/mob/clothing/lewd_neck_teshari.dmi'

/obj/item/clothing/neck/kink_collar
	worn_icon_teshari = 'modular_z121/icons/mob/clothing/lewd_neck_teshari.dmi'

/obj/item/key/kink_collar
	unique_reskin = list("Cyan" = "collar_key_cyan",
						"Yellow" = "collar_key_yellow",
						"Green" = "collar_key_green",
						"Red" = "collar_key_red",
						"Latex" = "collar_key_latex",
						"Orange" = "collar_key_orange",
						"White" = "collar_key_white",
						"Purple" = "collar_key_purple",
						"Black" = "collar_key_black",
						"Metal" = "collar_key_metal",
						"Black-teal" = "collar_key_tealblack")