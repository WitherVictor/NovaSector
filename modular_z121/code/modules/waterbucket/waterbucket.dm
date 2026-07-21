/obj/item/water_bucket
    name = "water bucket"
    desc = "A bucket that can be watered, which relies on three water recycler to absorb water from the air."
    icon = 'modular_z121/icons/obj/waterbucket.dmi'
    icon_state = "waterbucket_off"
    lefthand_file = 'modular_z121/icons/mob/waterbucket_lefthand.dmi'
    righthand_file = 'modular_z121/icons/mob/waterbucket_righthand.dmi'
    inhand_icon_state = "inhand_off"
    w_class = WEIGHT_CLASS_NORMAL
    var/open = FALSE
    var/water_amount = 5
    var/sprinkle_interval = 0.5 SECONDS
    var/last_sprinkle = 0

/obj/item/water_bucket/Initialize(mapload)
    . = ..()
    create_reagents(1000)
    reagents.add_reagent(/datum/reagent/water, 1000)
    START_PROCESSING(SSobj, src)

/obj/item/water_bucket/Destroy()
    STOP_PROCESSING(SSobj, src)
    if(isliving(loc))
        var/mob/living/carrier = loc
        UnregisterSignal(carrier, COMSIG_MOVABLE_MOVED)
    QDEL_NULL(reagents)
    return ..()

/obj/item/water_bucket/proc/toggle_sprinkle(mob/user)
    open = !open
    to_chat(user, span_notice("You [open ? "enable" : "disable"] auto-sprinkle."))
    if(open && isliving(loc))
        RegisterSignal(loc, COMSIG_MOVABLE_MOVED, PROC_REF(on_carrier_move))
    else if(!open && isliving(loc))
        UnregisterSignal(loc, COMSIG_MOVABLE_MOVED)
    update_appearance()

/obj/item/water_bucket/attack_self(mob/living/user)
    toggle_sprinkle(user)

/obj/item/water_bucket/update_icon_state()
    if(open)
        icon_state = "waterbucket_on"
        inhand_icon_state = "inhand_on"
    else
        icon_state = "waterbucket_off"
        inhand_icon_state = "inhand_off"
    return ..()

/obj/item/water_bucket/equipped(mob/user, slot)
    . = ..()
    if(open && isliving(user))
        RegisterSignal(user, COMSIG_MOVABLE_MOVED, PROC_REF(on_carrier_move))

/obj/item/water_bucket/dropped(mob/user)
    . = ..()
    if(open && isliving(user))
        UnregisterSignal(user, COMSIG_MOVABLE_MOVED)
    if(!open)
        return
    if(!reagents || reagents.total_volume < water_amount)
        return
    var/turf/T = get_turf(src)
    if(!T)
        return
    reagents.expose(T, TOUCH, water_amount)
    reagents.add_reagent(/datum/reagent/water, water_amount)

/obj/item/water_bucket/proc/on_carrier_move()
    SIGNAL_HANDLER
    if(!open)
        return
    if(!reagents || reagents.total_volume < water_amount)
        return
    var/turf/T = get_turf(src)
    if(!T)
        return
    reagents.expose(T, TOUCH, water_amount)
    reagents.add_reagent(/datum/reagent/water, water_amount)

/obj/item/water_bucket/Moved(atom/old_loc, movement_dir, forced, list/old_locs, momentum_change = TRUE)
    . = ..()
    if(!open)
        return
    if(!reagents || reagents.total_volume < water_amount)
        return
    var/turf/T = get_turf(src)
    if(!T)
        return
    reagents.expose(T, TOUCH, water_amount)
    reagents.add_reagent(/datum/reagent/water, water_amount)

/obj/item/water_bucket/process(seconds_per_tick)
    if(!open)
        return
    if(world.time < last_sprinkle + sprinkle_interval)
        return
    var/turf/T = get_turf(src)
    if(!T)
        return
    if(!reagents || reagents.total_volume < water_amount)
        return
    reagents.expose(T, TOUCH, water_amount)
    reagents.add_reagent(/datum/reagent/water, water_amount)
    last_sprinkle = world.time