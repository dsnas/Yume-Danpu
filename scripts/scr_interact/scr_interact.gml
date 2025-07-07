
//////// Functions related to interactable objects


function fn_interact_getId() // Retrieves the ID of the interactable, which determines its behavior and appearance
{
	interact_id = "";
	
	// Door of Macacolandia
	if (object_index == obj_interact_macaco_door)
		interact_id = "door_macaco";
	
	// Door of Debug World
	else if (object_index == obj_interact_dgwrld_door)
		interact_id = "door_dbgwrld";
	
	// Gift
	else if (object_index == obj_interact_gift)
	{
		// Axenis
		interact_id = "gift_axe";
	}
	
	// Debug World
	else if (room == rm_dbgwrld)
		interact_id = "dbgwrld";
}

function fn_interact_evCreate() // Create Event determined by the interactable's ID
{
	// Doors
	if (string_starts_with(interact_id, "door_") == true)
	{
		image_alpha = 1;
		interact_type = INTERACT_TYPE_RMTRANS;
		
		// Door of Debug World
		if (object_index == obj_interact_dgwrld_door)
		{
			if (room == rm_nexus)
				image_alpha = 0;
		}
	}
	
	// Gifts
	else if (string_starts_with(interact_id, "gift_") == true)
	{
		image_alpha = 1;
		interact_type = INTERACT_TYPE_LOOT;
		
		// Axenis
		interact_loot_id = LOOT.ITM;
		interact_loot_piece = ITM.DBG_AXE;
		
		// All
		if (global.itm_unlocked[interact_loot_piece] == true)
			image_index = 1;
	}
	
	// Debug World
	else if (interact_id == "dbgwrld")
	{
		interact_type = INTERACT_TYPE_MEOW;
		interact_meow_asset[0] = snd_hulapoca;
		interact_meow_asset[1] = snd_penyplocde;
	}
}
function fn_interact_evStep() // Step Event determined by the NPC's ID
{
	// Doors
	if (string_starts_with(interact_id, "door_") == true)
	{
		fn_interact_seq();
		
		// Door of Debug World
		if (object_index == obj_interact_dgwrld_door && room == rm_nexus)
		{
			var _secret_dist = abs(distance_to_object(obj_player));
			var _secret_distMin = 32;
			var _secret_alpAmt = (_secret_dist / _secret_distMin);
			_secret_alpAmt = clamp(_secret_alpAmt, 0, 1);
			var _secret_alpSpd = 0.05;
			image_alpha = lerp(image_alpha, (1 - _secret_alpAmt), _secret_alpSpd);
		}
	}
	
	// Gifts
	else if (string_starts_with(interact_id, "gift_") == true)
	{
		if (interact_stg == 0)
			image_index = 1;
		fn_interact_seq();
	}
	
	// Debug World
	else if (interact_id == "dbgwrld")
	{
		if (interact_stg == 0)
			interact_meow_idx = choose(0, 1);
		fn_interact_seq();
	}
}


function fn_interact_seq() // Interaction sequence
{
	// Meow type
	if (interact_type == INTERACT_TYPE_MEOW)
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
			else
				interact_delay_dur -= 1;
		}
	}
	
	// Portal type
	else if (interact_type == INTERACT_TYPE_RMTRANS)
	{
		if (interact_stg == 0)
		{
			fn_rmTrans_start();
			interact_stg = -1;
		}
	}
	
	// Loot type
	else if (interact_type == INTERACT_TYPE_LOOT)
	{
		if (interact_stg == 0)
		{
			var l = interact_loot_id;
			var p = interact_loot_piece;
			
			if (l == LOOT.EFF && global.eff_unlocked[p] == false)
			|| (l == LOOT.ITM && global.itm_unlocked[p] == false)
			|| (l == LOOT.THM && global.thm_unlocked[p] == false)
				fn_loot_unlock(l, p);
			else if (fn_obj_exists(obj_player) == true)
				obj_player.move_stg = -1;
			
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
