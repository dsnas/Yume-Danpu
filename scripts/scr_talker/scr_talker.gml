
//////// Functions related to interactable objects


function fn_talker_getId() // Retrieves the ID of the interactable, which determines its behavior and appearance
{
	talker_id = "";
	
	switch (object_index)
	{
		case obj_talker_macaco_door: // Door of Macacolandia
			talker_id = "door_macaco";
			break;
		case obj_talker_dbgwrld_door: // Door of Debug World
			talker_id = "door_dbgwrld";
			break;
		case obj_talker_gift: // Kart Gift
			talker_id = "gift_itm_kart";
			break;
		
		default:
			if (room == rm_dbgwrld) || (room == rm_nexus)
				talker_id = "bell_dbgwrld";
			break;
	}
}
function fn_talker_evCreate() // Create Event determined by the interactable's ID
{
	talk_act = true; // Determines if the object can be interacted with
	talk_stg = -1; // ID number of the current stage of the interaction sequence (-1 == inactive, 0+ active)
	talk_dur = 0;
	talk_durCurr = 0;
	
	talk_type =
	{
		// Bell type, starts playing a sound
		bell :
		{
			act : false,
			aud_asset : [snd_hulapoca, snd_penyplocde, snd_ponkawonka],
			aud_style : CONFIG_AUD_STYLE.TALKER,
			aud_idx : -1
		},
		
		
		// Door type, starts a room transition
		door :
		{
			act : false
		},
		
		
		// Gift type, unlocks an effect, item or a theme
		gift :
		{
			act : false,
			content_index : -1,
			content_array : -1
		}
	}
	
	
	
	
	if (string_starts_with(talker_id, "bell") == true)
	{
		talk_type.bell.act = true;
	}
	else if (string_starts_with(talker_id, "door") == true)
		talk_type.door.act = true;
	else if (string_starts_with(talker_id, "gift") == true)
	{
		talk_type.gift.act = true;
		
		if (string_starts_with(talker_id, "gift_eff") == true)
			talk_type.gift.content_array = global.player_eff;
		else if (string_starts_with(talker_id, "gift_itm") == true)
			talk_type.gift.content_array = global.player_itm;
		else if (string_starts_with(talker_id, "gift_thm") == true)
			talk_type.gift.content_array = global.player_thm;
	}
	
	
	if (talker_id == "door_dbgwrld" && room == rm_dbgwrld) // Door of Debug World
		
	if (talker_id == "gift_itm_kart") // Kart Gift
		talk_type.gift.content_index = PLAYER_ITM.KART;
}
function fn_talker_evStep() // Step Event determined by the NPC's ID
{
	if (talker_id == "door_dbgwrld" && room == rm_dbgwrld) // Door of Debug World
	{
		var _alp = clamp((abs(distance_to_object(obj_player)) / 32), 0, 1);
		image_alpha = fn_lerp(image_alpha, (1 - _alp), 0.05);
	}
	
	
	
	
	// Interaction sequence determined by its type
	if (talk_type.bell.act == true) // Bell type
	{
		if (talk_stg == 0)
		{
			if (talk_type.bell.aud_idx == -1)
				talk_type.bell.aud_idx = irandom_range(0, (array_length(talk_type.bell.aud_asset) - 1));
			fn_aud_play(talk_type.bell.aud_asset[talk_type.bell.aud_idx], talk_type.bell.aud_style);
			talk_type.bell.aud_idx = -1;
			
			talk_stg = 1;
			talk_durCurr = 0;
		}
		else if (talk_stg == 1)
		{
			talk_durCurr += 1;
			if (talk_durCurr >= talk_dur)
			{
				if (fn_obj_exists(obj_player) == true)
					obj_player.move_stg = -1;
				
				talk_stg = -1;
				
				if (solid_typeCurr == SOLID_TYPE.ENTITY)
					move_stg = -1;
			}
		}
	}
	else if (talk_type.door.act == true) // Door type
	{
		if (talk_stg == 0)
		{
			fn_rmTrans_start();
			talk_stg = 1;
		}
	}
	else if (talk_type.gift.act == true) // Gift type
	{
		if (talk_stg == 0)
		{
			var _content_array = talk_type.gift.content_array;
			var _content_index = talk_type.gift.content_index;
			
			if (_content_index != -1 && _content_array != -1 && struct_get(array_get(_content_array, _content_index), "unlocked") == false)
			{
				image_index = 1;
				switch (_content_array)
				{
					case global.player_eff:
						fn_player_eff_unlock(_content_index);
						break;
					case global.player_itm:
						fn_player_itm_unlock(_content_index);
						break;
					case global.player_thm:
						fn_player_thm_unlock(_content_index)
						break;
				}
			}
			else
			{
				if (fn_obj_exists(obj_player) == true)
					obj_player.move_stg = -1;
			}
		}
	}
}
