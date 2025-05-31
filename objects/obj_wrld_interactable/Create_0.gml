
event_inherited();

image_alpha = 0;




draw_x = x; // (self-drawing info)
draw_y = y;
draw_xSc = 1;
draw_ySc = 1;
draw_ang = 0;


poke_stg = -1; /* (interaction stage)
 -2 = frozen, cannot be poked or interacted with;
 -1 = idle, can be poked or interacted with;
  0 = has been poked, is in interaction sequence;
*/

poke_dur = 0;
poke_durMax = 30;


chirp_amt = 0; // (has been poked and interaction sequence has started, plays audio as answer)
chirp_amtMax = 10;
for (var i = 0; i < chirp_amtMax; i++)
{
	chirp_aud[i] = -1;
	chirp_aud_volIdx[i] = SETT_VOL.PROP;
}
chirp_idx = -1;


isNpc = false;




fn_wrld_interactable_id() // retrieves the ID of the interactable, which determines its behavior and appearance
fn_wrld_interactable_create() // create event based on the interactable's ID
