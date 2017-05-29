var/global/list/musictile_notes = list(
	"Ab1" = 'sound/instruments/piano/Ab1.ogg', \
	"Ab2" = 'sound/instruments/piano/Ab2.ogg', \
	"Ab3" = 'sound/instruments/piano/Ab3.ogg', \
	"Ab4" = 'sound/instruments/piano/Ab4.ogg', \
	"Ab5" = 'sound/instruments/piano/Ab5.ogg', \
	"Ab6" = 'sound/instruments/piano/Ab6.ogg', \
	"Ab7" = 'sound/instruments/piano/Ab7.ogg', \
	"Ab8" = 'sound/instruments/piano/Ab8.ogg', \
	)

#define MUSICTILE_OPTION_CUSTOM "Custom"

/obj/item/stack/tile/musictile
	name = "light tile"
	singular_name = "light floor tile"
	desc = "A floor tile made out of glass. Use a multitool on it to change its color."
	icon_state = "light_tile_broken"
	w_class = W_CLASS_MEDIUM
	force = 3.0
	throwforce = 5.0
	throw_speed = 5
	throw_range = 20
	flags = FPRINT
	siemens_coefficient = 1
	max_amount = 60
	attack_verb = list("bashes", "batters", "bludgeons", "thrashes", "smashes")
	material = "glass"
	var/on = 1
	var/color_r = 255
	var/color_g = 255
	var/color_b = 255
	var/image/color_overlay
	var/choice = "Ab1"

/obj/item/stack/tile/musictile/attackby(var/obj/item/O as obj, var/mob/user as mob)
	if(istype(O,/obj/item/device/multitool))
		var/list/choice_list = musictile_notes
		choice = input(user,"Select a colour to set [src] to.","[src]") in choice_list
	return ..()


/obj/item/stack/tile/musictile/attack_self(mob/user as mob)
	playsound(src,musictile_notes[choice],40,1)