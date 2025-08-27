

function fn_prop_evCreate()
{
	switch (object_index)
	{
		// Gift
		case obj_prop_gift:
			talk.act = true;
			talk.type.gift.act = true;
			talk.type.gift.loot_arr = global.player_itm;
			talk.type.gift.loot_idx = PLAYER_ITM.KART;
			
			if (array_get(talk.type.gift.loot_arr, talk.type.gift.loot_idx).unlocked == true)
				image_index = 1;
			break;
		
		
		// Doors
		case obj_prop_macaco_door: // Door of Macacolandia
		case obj_prop_dbgwrld_door: // Door of Debug World
			talk.act = true;
			talk.type.door.act = true;
			break;
		
		
		// Grasses
		case obj_prop_dbgwrld_grass: // Debug World grass
			solid = false;
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


function fn_prop_talk_type_bell_aud_asset(_asset_nameWithoutIdx)
{
	for (var a = 0; a < 35; a++)
	{
		var _asset = asset_get_index($"{_asset_nameWithoutIdx}{a}");
		if (_asset != undefined)
		{
			talk_type.bell.aud_asset[a] = _asset;
			continue;
		}
		else
			break;
	}
}