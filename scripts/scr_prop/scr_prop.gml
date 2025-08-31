

function fn_prop_evCreate()
{
	// Main data (presets)
	switch (object_index)
	{
		// Doors
		case obj_prop_macaco_door: // Door of Macacolandia
		case obj_prop_dbgwrld_door: // Door of Debug World
		case obj_prop_condo_apt_bed: // Bed in Eleanor's Apartment
			talk.act = true;
			talk.type.door.act = true;
			talk.type.door.open.snd_asset = snd_prop_talk_door_open;
			talk.type.door.open.snd_style = CONFIG_AUD_STYLE.PROP;
			talk.type.door.close.snd_asset = snd_prop_talk_door_close;
			talk.type.door.close.snd_style = CONFIG_AUD_STYLE.PROP;
			break;
		
		
		// Gift
		case obj_prop_gift:
			talk.act = true;
			talk.type.gift.act = true;
			talk.type.gift.loot_arr = global.player_itm;
			talk.type.gift.loot_idx = PLAYER_ITM.KART;
			
			if (array_get(talk.type.gift.loot_arr, talk.type.gift.loot_idx).unlocked == true)
				image_index = 1;
			break;
		
		
		// Grasses
		case obj_prop_dbgwrld_grass: // Debug World grass
			solid = false;
			break;
	}
	
	
	// Other data (object-specific personalization)
	switch (object_index)
	{
		case obj_prop_condo_apt_bed: // Bed in Eleanor's Apartment
			talk.type.door.open.imgSpd = 0;
			talk.type.door.open.snd_asset = -1;
			talk.type.door.close.snd_asset = -1;
			break;
	}
}
function fn_prop_evStep()
{
	switch (object_index)
	{
		case obj_prop_dbgwrld_door: // Door of Debug World
			if (room == rm_nexus)
			{
				var _alp = clamp((abs(distance_to_object(obj_player)) / 32), 0, 1);
				image_alpha = fn_lerp(image_alpha, (1 - _alp), 0.05);
			}
			break;
	}
}
