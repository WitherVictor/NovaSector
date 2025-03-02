/datum/emote/living/cough/get_sound(mob/living/user)
	if(isteshari(user))
		return 'modular_z121/sound/emotes/tesharicough.ogg'
	..(user)

/datum/emote/living/sneeze/get_sound(mob/living/user)
	if(isteshari(user))
		return 'modular_z121/sound/emotes/tesharisneeze.ogg'
	..(user)

/datum/laugh_type/teshari_alt
	name = "Teshari laugh"
	male_laughsounds = list('modular_z121/sound/emotes/tesharilaugh.ogg')
	female_laughsounds = null

/datum/scream_type/teshari_alt
	name = "Teshari scream"
	male_screamsounds = list('modular_z121/sound/emotes/teshariscream.ogg')
	female_screamsounds = null