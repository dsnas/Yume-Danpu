
//////// Functions related to interactable objects


function fn_interact_getId() // Retrieves the ID of the interactable, which determines its behavior and appearance
{
	interact_id = "";
	
	// Door of Macacolandia
	if (object_index == obj_interact_macaco_door)
		interact_id = "door_macaco";
	
	// Debug World
	if (room == rm_dbgwrld)
		interact_id = "dbgwrld";
}

function fn_interact_evCreate() // Create Event determined by the interactable's ID
{
	// Doors
	if (string_starts_with(interact_id, "door_") == true)
	{
		image_alpha = 1;
		interact_type = interact_type_portal;
	}
	
	// Debug World
	if (interact_id == "dbgwrld")
	{
		interact_type = interact_type_meow;
		interact_meow_asset[0] = snd_hulapoca;
		interact_meow_asset[1] = snd_penyplocde;
	}
}
function fn_interact_evStep() // Step Event determined by the NPC's ID
{
	// Door of Macacolandia
	if (string_starts_with(interact_id, "door_") == true)
		fn_interact_seq();
	
	// Debug World
	if (interact_id == "dbgwrld")
	{
		if (interact_stg == 0)
			interact_meow_idx = choose(0, 1);
		fn_interact_seq();
	}
}


function fn_interact_seq() // Interaction sequence
{
	// Audio type
	if (interact_type == interact_type_meow)
	{
		// Starts playing the audio
		if (interact_stg == 0)
		{
			fn_aud_play(interact_meow_asset[interact_meow_idx], interact_meow_volType);	
			interact_delay_dur = interact_delay_durMax;
			interact_stg = 1;
		}
		
		// Delays the unfreezing of the interactable and the player
		if (interact_stg == 1)
		{
			interact_delay_dur -= 1;
			if (interact_delay_dur <= 0)
			{
				obj_player.move_stg = -1;
				
				interact_stg = -1;
				if (solid_type == solid_type_entity)
				{
					move_stg = -1;
					moveDelay_stg = -1;
				}
			}
		}
	}
	
	// Room transition type
	else if (interact_type == interact_type_portal)
	{
		if (interact_stg == 0)
		{
			fn_rmTrans_start();
			interact_stg = -1;
		}
	}
}


function fn_interact_meow_addAsset(_asset_nameWithoutIdx)
{
	for (var i = 0; i < 35; i++)
	{
		var _asset = asset_get_index($"{_asset_nameWithoutIdx}{i}");
		if (_asset != undefined)
		{
			interact_meow_asset[i] = _asset;
			continue;
		}
		else
		{
			interact_meow_amt = array_length(interact_meow_asset);
			break;
		}
	}
}
