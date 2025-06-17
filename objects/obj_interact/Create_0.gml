
event_inherited();
image_alpha = 0;
solid_type = SOLID_TYPE_INTERACT;


// Interaction sequence
PET_TYPE_MEOW = 0;			// ID numbers of the types of interaction sequence
pet_type = PET_TYPE_MEOW;	// Type of the interaction sequence (-1 == none)

pet_stg = -1;		// Current stage of the interaction sequence (-1 == inactive, 0+ active)
pet_durMax = 30;	// Duration of the interaction sequence, how much time the entity and the player will be frozen
pet_dur = 0;

	// Audio response type
pet_meow_amtMax = 10;
for (var a = 0; a < pet_meow_amtMax; a++)
{
	pet_meow_aud[a] = -1;
	pet_meow_aud_volIdx[a] = VOL_IDX.INTERACT;
}
pet_meow_amt = 0;
pet_meow_idx = -1;


fn_interact_getId();
fn_interact_evCreate();
