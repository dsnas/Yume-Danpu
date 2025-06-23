
//////// Functions related to interactable objects


function fn_interact_getId() // Fetches the ID of the interactable, which determines its behavior and appearance
{
	interact_id = "";
	
	if (room == rm_dbgwrld)
		interact_id = "dbgwrld";
}

function fn_interact_evCreate() // Create Event determined by the interactable's ID
{
	// Debug
	if (interact_id == "dbgwrld")
	{
		pet_type = PET_TYPE_MEOW;
		pet_meow_aud[0] = snd_hulapoca;
		pet_meow_aud[1] = snd_penyplocde;
	}
}
function fn_interact_evStep() // Step Event determined by the NPC's ID
{
	// Debug
	if (interact_id == "dbgwrld")
	{
		if (pet_stg == 0)
			pet_meow_idx = choose(0, 1);
		
		fn_interact_pet();
	}
}


function fn_interact_pet() // Interaction sequence
{
	// Checks the type of the interaction sequence
	if (pet_type == 0) // Audio response type
	{
		// Starts playing the audio
		if (pet_stg == 0)
		{
			fn_aud_play(pet_meow_aud[pet_meow_idx], pet_meow_aud_volIdx[pet_meow_idx]);	
		
			pet_dur = pet_durMax;
			pet_stg = 1;
		}
		
		// Delays the unfreezing of the interactable and the player
		if (pet_stg == 1)
		{
			pet_dur -= 1;
			if (pet_dur <= 0)
			{
				obj_player.move_stg = -1;
				
				pet_stg = -1;
				if (solid_type == SOLID_TYPE_ENTITY)
				{
					move_stg = -1;
					moveDelay_stg = -1;
				}
			}
		}
	}
}

function fn_interact_pet_meow_aud_add(_aud_nameWithoutIdx) // Adds the 
{
	for (var a = 0; a < pet_meow_amtMax; a++)
	{
		var _meow_aud = asset_get_index(string(_aud_nameWithoutIdx) + string(a));
		if (_meow_aud != -1)
		{
			pet_meow_aud[a] = _meow_aud;
			continue;
		}
		else if (_meow_aud == -1)
		{
			pet_meow_amt = a;
			break;
		}
	}
}
