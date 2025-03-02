/mob/living/basic/mlpony
	name = "\improper pony"
	desc = "?"
	icon = 'modular_z121/icons/mob/pony.dmi'
	icon_state = "pony"
	icon_living = "pony"
	icon_dead = "pony"
	gender = FEMALE
	mob_biotypes = MOB_ORGANIC | MOB_BEAST
	speak_emote = list("neighs", "winnies")
	//emote_hear = list("excitedly says")
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	attack_verb_continuous = "bucks"
	attack_verb_simple = "buck"
	attack_sound = 'sound/items/weapons/punch1.ogg'
	attack_vis_effect = ATTACK_EFFECT_KICK
	melee_damage_lower = 0
	melee_damage_upper = 0
	health = 50
	maxHealth = 50
	speed = 0
	faction = list("pony")
	see_in_dark = 5
	gold_core_spawnable = NO_SPAWN
	blood_volume = BLOOD_VOLUME_NORMAL
	ai_controller = /datum/ai_controller/basic_controller/pony
	status_flags = CANPUSH
	basic_mob_flags = DEL_ON_DEATH
	var/unique_tamer = FALSE
	var/datum/weakref/my_owner

/mob/living/basic/mlpony/Initialize(mapload)
	. = ..()

	AddElement(/datum/element/pet_bonus, "whickers.")
	AddElement(/datum/element/ai_retaliate)
	AddElement(/datum/element/ai_flee_while_injured)
	AddElementTrait(TRAIT_WADDLING, INNATE_TRAIT, /datum/element/waddling)
	AddComponent(/datum/component/tameable, food_types = list(/obj/item/food/grown/apple), tame_chance = 25, bonus_tame_chance = 15, unique = unique_tamer)

/mob/living/basic/mlpony/tamed(mob/living/tamer, atom/food)
	can_buckle = TRUE
	buckle_lying = 0
	playsound(src, 'sound/mobs/non-humanoids/pony/snort.ogg', 50)
	AddElement(/datum/element/ridable, /datum/component/riding/creature/pony)
	visible_message(span_notice("[src] snorts happily."))
	new /obj/effect/temp_visual/heart(loc)

	ai_controller.replace_planning_subtrees(list(
		/datum/ai_planning_subtree/find_nearest_thing_which_attacked_me_to_flee,
		/datum/ai_planning_subtree/flee_target,
		/datum/ai_planning_subtree/random_speech/pony/tamed
	))

	if(unique_tamer)
		my_owner = WEAKREF(tamer)
		RegisterSignal(src, COMSIG_MOVABLE_PREBUCKLE, PROC_REF(on_prebuckle))

/mob/living/basic/mlpony/Destroy()
	UnregisterSignal(src, COMSIG_MOVABLE_PREBUCKLE)
	my_owner = null
	return ..()

/mob/living/basic/mlpony/proc/on_prebuckle(mob/source, mob/living/buckler, force, buckle_mob_flags)
	SIGNAL_HANDLER
	var/mob/living/tamer = my_owner?.resolve()
	if(!unique_tamer || (isnull(tamer) && unique_tamer))
		return
	if(buckler != tamer)
		whinny_angrily()
		return COMPONENT_BLOCK_BUCKLE

/mob/living/basic/mlpony/proc/whinny_angrily()
	manual_emote("whinnies ANGRILY!")

	playsound(src, pick(list(
		'sound/mobs/non-humanoids/pony/whinny01.ogg',
		'sound/mobs/non-humanoids/pony/whinny02.ogg',
		'sound/mobs/non-humanoids/pony/whinny03.ogg'
	)), 50)

/mob/living/basic/mlpony/take_damage(damage_amount, damage_type, damage_flag, sound_effect, attack_dir, armour_penetration)
	. = ..()

	if (prob(33))
		whinny_angrily()

/mob/living/basic/mlpony/melee_attack(atom/target, list/modifiers, ignore_cooldown = FALSE)
	. = ..()

	if (!.)
		return

	whinny_angrily()

/datum/ai_controller/basic_controller/pony
	blackboard = list(
		BB_TARGETING_STRATEGY = /datum/targeting_strategy/basic,
	)

	ai_traits = STOP_MOVING_WHEN_PULLED
	ai_movement = /datum/ai_movement/basic_avoidance
	idle_behavior = /datum/idle_behavior/idle_random_walk

	planning_subtrees = list(
		/datum/ai_planning_subtree/find_nearest_thing_which_attacked_me_to_flee,
		/datum/ai_planning_subtree/flee_target,
		/datum/ai_planning_subtree/target_retaliate,
		/datum/ai_planning_subtree/basic_melee_attack_subtree,
		/datum/ai_planning_subtree/random_speech/pony
	)

/mob/living/basic/mlpony/twilight
	name = "Twilight Sparkle"
	real_name = "Twilight Sparkle"
	icon_state = "twilight"
	icon_living = "twilight"

/mob/living/basic/mlpony/pinkie
	name = "Pinkie Pie"
	real_name = "Pinkie Pie"
	icon_state = "pinkie"
	icon_living = "pinkie"

/mob/living/basic/mlpony/rainbow
	name = "Rainbow Dash"
	real_name = "Rainbow Dash"
	icon_state = "rainbow"
	icon_living = "rainbow"

/mob/living/basic/mlpony/fluttershy
	name = "Fluttershy"
	real_name = "Fluttershy"
	icon_state = "fluttershy"
	icon_living = "fluttershy"

/mob/living/basic/mlpony/applejack
	name = "Applejack"
	real_name = "Applejack"
	icon_state = "applejack"
	icon_living = "applejack"

/mob/living/basic/mlpony/luna
	name = "Luna"
	real_name = "Luna"
	icon_state = "luna"
	icon_living = "luna"

/mob/living/basic/mlpony/clownie
	name = "Clownie"
	real_name = "Clownie"
	icon_state = "clownie"
	icon_living = "clownie"

/mob/living/basic/mlpony/tia
	name = "Tia"
	real_name = "Tia"
	icon_state = "tia"
	icon_living = "tia"

/mob/living/basic/mlpony/trixie
	name = "Trixie"
	real_name = "Trixie"
	icon_state = "trixie_a_full"
	icon_living = "trixing_a_full"

/mob/living/basic/mlpony/lyra
	name = "Lyra"
	real_name = "Lyra"
	icon_state = "lyra"
	icon_living = "lyra"

/mob/living/basic/mlpony/vinyl
	name = "Vinyl"
	real_name = "Vinyl"
	icon_state = "vinyl"
	icon_living = "vinyl"

/mob/living/basic/mlpony/rarity
	name = "Rarity"
	real_name = "Rarity"
	icon_state = "rarity"
	icon_living = "rarity"

/mob/living/basic/mlpony/whooves
	name = "Whooves"
	real_name = "Whooves"
	icon_state = "whooves"
	icon_living = "whooves"
	gender = MALE

/mob/living/basic/mlpony/fleur
	name = "Fleur"
	real_name = "Fleur"
	icon_state = "fleur"
	icon_living = "fleur"

/mob/living/basic/mlpony/mac
	name = "Mac"
	real_name = "Mac"
	icon_state = "mac"
	icon_living = "mac"
	gender = MALE

/mob/living/basic/mlpony/wendy
	name = "Wendy"
	real_name = "Wendy"
	icon_state = "wendy"
	icon_living = "wendy"
	desc = "这是服主"
/*
/mob/living/simple_animal/pet/cat/slugcat
	name = "蛞蝓猫"
	desc = "一个奇怪而又可爱的白色生物。它的身体异常灵活。"
	icon = 'modular_z121/icons/mob/pets.dmi'
	icon/held_lh = 'modular_z121/icons/mob/pets_held_lh.dmi'
	icon/held_rh = 'modular_z121/icons/mob/pets_held_rh.dmi'
	icon_state = "catslug"
	icon_living = "catslug"
	icon_dead = "catslug_dead"
	held_state = "slugcat"
	speak_emote = list("purrs", "meows", "blorbles")
	emote_hear = list("meows.", "mews.", "blorbles")
	emote_see = list("shakes its head.", "shivers.", "squishes")
	speak_chance = 1
	turns_per_move = 5
	can_be_held = TRUE
	see_in_dark = 6
	pass_flags = PASSTABLE
	mob_size = MOB_SIZE_SMALL
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	minbodytemp = 200
	maxbodytemp = 400
	butcher_results = list(/obj/item/food/meat/slab = 2)
	unsuitable_atmos_damage = 0.5
	animal_species = /mob/living/simple_animal/pet/slugcat
	childtype = list(/mob/living/simple_animal/pet/slugcat = 1)
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	mobility_flags = MOBILITY_FLAGS_REST_CAPABLE_DEFAULT
	gold_core_spawnable = FRIENDLY_SPAWN
	//collar_type = "cat"
	attack_verb_continuous = "squishes"
	attack_verb_simple = "squish"
	attack_sound = 'sound/effects/attackblob.ogg'
	attack_vis_effect = ATTACK_EFFECT_CLAW

	footstep_type = FOOTSTEP_MOB_CLAW

/mob/living/simple_animal/pet/cat/slugcat/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/pet_bonus, "purrs!")
	add_verb(src, /mob/living/proc/toggle_resting)
	add_cell_sample()
	ADD_TRAIT(src, TRAIT_VENTCRAWLER_ALWAYS, INNATE_TRAIT)

/mob/living/simple_animal/pet/slugcat/add_cell_sample()
	AddElement(/datum/element/swabable, CELL_LINE_TABLE_CAT, CELL_VIRUS_TABLE_GENERIC_MOB, 1, 5)
*/

/mob/living/simple_animal/pet/slugcat
	name = "蛞蝓猫"
	desc = "一只是猫又是蛞蝓的生物"
	icon = 'modular_z121/icons/mob/pets.dmi'
	held_lh = 'modular_z121/icons/mob/pets_held_lh.dmi'
	held_rh = 'modular_z121/icons/mob/pets_held_rh.dmi'
	icon_state = "slugcat"
	icon_living = "slugcat"
	icon_dead = "slugcat_dead"
	held_state = "slugcat"
	emote_see = list("盯着天花板。", "发抖。")
	speak_chance = 1
	turns_per_move = 5
	can_be_held = TRUE
	see_in_dark = 6
	pass_flags = PASSTABLE
	mob_size = MOB_SIZE_SMALL
	mob_biotypes = MOB_ORGANIC|MOB_BEAST
	minbodytemp = 200
	maxbodytemp = 400
	butcher_results = list(/obj/item/food/meat/slab = 2)
	unsuitable_atmos_damage = 0.5
	animal_species = /mob/living/simple_animal/pet/slugcat
	response_help_continuous = "pets"
	response_help_simple = "pet"
	response_disarm_continuous = "gently pushes aside"
	response_disarm_simple = "gently push aside"
	response_harm_continuous = "kicks"
	response_harm_simple = "kick"
	mobility_flags = MOBILITY_FLAGS_REST_CAPABLE_DEFAULT
	gold_core_spawnable = FRIENDLY_SPAWN
	//collar_type = "cat"
	attack_verb_continuous = "squishes"
	attack_verb_simple = "squish"
	attack_sound = 'sound/effects/blob/attackblob.ogg'
	attack_vis_effect = ATTACK_EFFECT_CLAW

	footstep_type = FOOTSTEP_MOB_CLAW
	gold_core_spawnable = FRIENDLY_SPAWN

	attack_vis_effect = ATTACK_EFFECT_SLASH
	obj_damage = 0
	melee_damage_lower = 0
	melee_damage_upper = 0
	var/attacktext = "stabs"
	var/obj/item/spear/weapon

/mob/living/simple_animal/pet/slugcat/Initialize(mapload)
	. = ..()
	AddElement(/datum/element/pet_bonus, "purrs!")
	add_verb(src, /mob/living/proc/toggle_resting)
	add_cell_sample()
	ADD_TRAIT(src, TRAIT_VENTCRAWLER_ALWAYS, INNATE_TRAIT)

/mob/living/simple_animal/pet/slugcat/add_cell_sample()
	AddElement(/datum/element/swabable, CELL_LINE_TABLE_CAT, CELL_VIRUS_TABLE_GENERIC_MOB, 1, 5)

/mob/living/simple_animal/pet/slugcat/update_resting()
	. = ..()
	if(stat == DEAD)
		return
	if (resting)
		icon_state = "[icon_living]_rest"
	else
		icon_state = "[icon_living]"

/mob/living/simple_animal/pet/slugcat/UnarmedAttack(atom/A)
	. = ..()
	if(!isitem(A))
		return

	if(!weapon && istype(A, /obj/item/spear))
		visible_message(span_notice("[src] 拿起了 [A]."), span_notice("你拿起了 [A]."))
		weapon = A
		weapon.forceMove(src)
		melee_damage_lower = weapon.force + weapon.force_wielded
		melee_damage_upper = weapon.force + weapon.force_wielded
		armour_penetration = weapon.armour_penetration
		melee_damage_type = weapon.damtype
		sharpness = weapon.sharpness
		attack_sound = weapon.hitsound
		update_icons()
	else if(!weapon && !istype(A, /obj/item/spear))
		to_chat(src, span_warning("You do not know how to wield the [A]!"))

/mob/living/simple_animal/pet/slugcat/RangedAttack(atom/A, params)
	. = ..()
	if(!weapon)
		return
	visible_message(span_warning("[src] throws the [weapon] at [A]!"), span_warning("You throw the [weapon] at [A]!"))
	melee_damage_lower = initial(melee_damage_lower)
	melee_damage_upper = initial(melee_damage_upper)
	armour_penetration = initial(armour_penetration)
	melee_damage_type = initial(melee_damage_type)
	sharpness = initial(sharpness)
	attack_sound = initial(attack_sound)
	weapon.forceMove(get_turf(src))
	weapon.throw_at(A, weapon.throw_range, weapon.throw_speed, src)
	weapon = null
	update_icons()

/mob/living/simple_animal/pet/slugcat/update_icons()
	. = ..()
	if(stat == DEAD || resting)
		return
	icon_state = weapon ? initial(icon_state) + "_spear" : initial(icon_state)

/mob/living/simple_animal/pet/slugcat/death(gibbed)
	if(weapon)
		weapon.forceMove(get_turf(src))
		weapon = null
	update_icons()
	. = ..()

