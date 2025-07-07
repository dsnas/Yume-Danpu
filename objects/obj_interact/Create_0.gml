
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

	// Meow type, plays an audio as response
INTERACT_TYPE_MEOW = 0; // ID number of the type
interact_meow_asset[0] = -1;
interact_meow_volType = CONFIG_VOLTYPE.INTERACT;
interact_meow_idx = 0;
interact_meow_len = 0;

	// Portal type, starts a room transition sequence as response
INTERACT_TYPE_RMTRANS = 1; // ID number of the type

	// Loot type, unlocks an effect, item or theme as response
INTERACT_TYPE_LOOT = 2; // ID number of the type
interact_loot_id = -1;
interact_loot_piece = -1;



fn_interact_getId();
fn_interact_evCreate();