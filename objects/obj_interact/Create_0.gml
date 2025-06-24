
event_inherited();
image_alpha = 0;
if (room == rm_dbgwrld)
	image_alpha = 1;
solid_type = SOLID_TYPE_INTERACT;


// Interaction sequence
	// ID numbers of the types of interaction sequence
PET_TYPE_MEOW = 0; // Audio response type
PET_TYPE_DOOR = 1; // Room transition type
pet_type = PET_TYPE_MEOW; // Type of the interaction sequence (-1 == none)

pet_stg = -1; // Current stage of the interaction sequence (-1 == inactive, 0+ active)
pet_durMax = 30; // Duration of the interaction sequence, how much time the entity and the player will be frozen
pet_dur = 0;

	// Audio response type
pet_meow_amtMax = 10;
for (var a = 0; a < pet_meow_amtMax; a++)
{
	pet_meow_aud[a] = -1;
	pet_meow_aud_volIdx[a] = CONFIG_VOL_IDX.INTERACT;
}
pet_meow_amt = 0;
pet_meow_idx = -1;

	// Room transition type
pet_door_tgt = -1;
pet_door_type = global.rmTrans_type.fade;
pet_door_player_x = undefined;
pet_door_player_y = undefined;
pet_door_player_dir = undefined;


fn_interact_getId();
fn_interact_evCreate();
