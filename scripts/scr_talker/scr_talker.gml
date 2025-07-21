
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
			if (room == rm_dbgwrld)
				talker_id = "bell_dbgwrld";
			break;
	}
}
function fn_talker_evCreate() // Create Event determined by the interactable's ID
{
	talk_stg = -1; // ID number of the current stage of the interaction sequence (-1 == inactive, 0+ active)
	talk_dur = 0;
	talk_durCurr = 0;
	
	// Interaction sequence types
	talk_type = -1; // ID number of the type
	
		// Bell type, starts playing a sound
	TALK_TYPE_BELL = 0;
	talk_bell = 0;
	talk_bell_asset[0] = -1;
	talk_bell_style = CONFIG_AUD_STYLE.INTERACT;
	if (string_starts_with(talker_id, "bell") == true)
		talk_type = TALK_TYPE_BELL;
	
		// Door type, starts a room transition
	TALK_TYPE_DOOR = 1;
	if (string_starts_with(talker_id, "door") == true)
	{
		image_alpha = 1;
		talk_type = TALK_TYPE_DOOR;
	}
	
		// Gift type, unlocks an effect, item or a theme
	TALK_TYPE_GIFT = 2;
	talk_gift = -1;
	talk_gift_arr = -1;
	if (string_starts_with(talker_id, "gift") == true)
	{
		image_alpha = 1;
		if (string_starts_with(talker_id, "gift_itm") == true)
			talk_gift_arr = global.player_itm;
	}
	
	
	
	
	// Retrieve custom data determined by the ID of the interactable
	if (talker_id == "door_dbgwrld" && room == rm_dbgwrld) // Door of Debug World
		image_alpha = 0;
	if (talker_id == "bell_dbgwrld")
	{
		talk_bell_asset[0] = snd_hulapoca;
		talk_bell_asset[1] = snd_penyplocde;
	}
	if (talker_id == "gift_itm_kart") // Kart Gift
		talk_gift = PLAYER_ITM.KART;
}
function fn_talker_evStep() // Step Event determined by the NPC's ID
{
	// Retrieve custom data determined by the ID of the interactable
	if (talker_id == "door_dbgwrld" && room == rm_dbgwrld) // Door of Debug World
	{
		var _alpDist = 32;
		var _alp = clamp((abs(distance_to_object(obj_player)) / _alpDist), 0, 1);
		var _alpSpd = 0.05;
		image_alpha = lerp(image_alpha, (1 - _alp), _alpSpd);
	}
	
	
	
	
	// Interaction sequence determined by its type
	if (talk_type == TALK_TYPE_BELL) // Bell type
	{
		if (talk_stg == 0) // Starts playing the audio
		{
			fn_aud_play(talk_bell_asset[talk_bell], talk_bell_style);	
			talk_durCurr = talk_dur;
			talk_stg = 1;
		}
		else if (talk_stg == 1) // Delays the unfreezing of the interactable and the player
		{
			talk_durCurr -= 1;
			if (talk_durCurr <= 0)
			{
				if (fn_obj_exists(obj_player) == true)
					obj_player.move_stg = -1;
				
				talk_stg = -1;
				if (solid_type == solid_type_entity)
					move_stg = -1;
			}
		}
	}
	else if (talk_type = TALK_TYPE_DOOR) // Door type
	{
		if (talk_stg == 0)
		{
			fn_rmTrans_start();
			talk_stg = -1;
		}
	}
	else if (talk_type == TALK_TYPE_GIFT) // Gift type
	{
		var _talk_gift_unlocked = struct_get(array_get(talk_gift_arr, talk_gift), "unlocked");
		
		if (talk_stg == 0)
		{
			if (talk_gift != -1 && talk_gift_arr != -1 && _talk_gift_unlocked == false)
			{
				_talk_gift_unlocked = true;
				switch (talk_gift_arr)
				{
					case global.player_eff:
						fn_player_eff_unlock(talk_gift);
						break;
					case global.player_itm:
						fn_player_itm_unlock(talk_gift);
						break;
					case global.player_thm:
						fn_player_thm_unlock(talk_gift)
						break;
				}
			}
			else
			{
				if (fn_obj_exists(obj_player) == true)
					obj_player.move_stg = -1;
			}
			
			talk_stg = -1;
		}
		
		image_index = 0;
		if (_talk_gift_unlocked == true)
			image_index = 1;
	}
}
