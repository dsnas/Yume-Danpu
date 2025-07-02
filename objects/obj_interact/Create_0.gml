
event_inherited();
image_alpha = 0;
if (room == rm_dbgwrld)
	image_alpha = 1;
solid_type = solid_type_interact;


// Stages and delay
interact_stg = -1; // ID number of the current stage (-1 == inactive, 0+ active)

interact_delay_dur = 0;
interact_delay_durMax = 0;


// Types, which determine the interaction sequence's behavior
interact_type = -1; // ID number of the current type (-1 == none)

	// Audio type, plays an audio as response
interact_type_meow = 0; // ID number of the audio type
interact_meow_asset[0] = -1;
interact_meow_volType = CONFIG_VOLTYPE.INTERACT;
interact_meow_idx = 0;
interact_meow_amt = 0;

	// Portal type, starts a room transition sequence as response
interact_type_portal = 1;



fn_interact_getId();
fn_interact_evCreate();