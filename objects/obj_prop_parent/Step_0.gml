
fn_prop_evStep();




// Talk (interaction sequence)
if (talk.act == true)
{
	// Bell type (starts playing an audio)
	if (talk.type.bell.act == true)
	{
		if (talk.stg == 0)
		{
			if (talk.type.bell.aud_idx == -1)
				talk.bell.aud_idx = irandom_range(0, (array_length(talk.bell.aud_asset) - 1));
			fn_aud_play(talk.type.bell.aud_asset[talk.type.bell.aud_idx], talk.type.bell.aud_style);
			talk.type.bell.aud_idx = -1;
			
			talk.stg = 1;
			talk.durCurr = 0;
		}
		if (talk.stg == 1)
		{
			talk.durCurr += 1;
			if (talk.durCurr >= talk.dur)
			{
				if (fn_obj_exists(obj_player) == true)
					obj_player.move_stg = -1;
				
				talk.stg = -1;
				if (solid_typeCurr == SOLID_TYPE.ENTITY)
					move_stg = -1;
			}
		}
	}
	
	
	// Door type (starts a room transition)
	else if (talk.type.door.act == true)
	{
		var _door = talk.type.door;
		if (talk.stg == 0)
		{			
			if (_door.open.snd_asset != -1 && _door.open.snd_style != -1)
				fn_aud_play(_door.open.snd_asset, _door.open.snd_style);
			fn_fader_start();
			talk.stg = 1;
		}
		else if (talk.stg == 1)
		{
			if (_door.open.imgSpd > 0 && (image_index + _door.open.imgSpd) < image_number)
				image_index += _door.open.imgSpd;
		}
	}
	
	
	// Gift type (unlocks an effect, item or a theme)
	else if (talk.type.gift.act == true)
	{
		if (talk.stg == 0)
		{
			var _loot_arr = talk.type.gift.loot_arr;
			var _loot_idx = talk.type.gift.loot_idx;
			
			if (_loot_idx != -1 && _loot_arr != -1 && array_get(_loot_arr, _loot_idx).unlocked == false)
			{
				image_index = 1;
				switch (_loot_arr)
				{
					case global.player_eff:
						fn_player_eff_unlock(_loot_idx);
						break;
					case global.player_itm:
						fn_player_itm_unlock(_loot_idx);
						break;
					case global.player_thm:
						fn_player_thm_unlock(_loot_idx)
						break;
				}
			}
			else
			{
				if (fn_obj_exists(obj_player) == true)
					obj_player.move_stg = -1;
			}
			
			talk.stg = -1;
		}
	}
	
	
	// Trigger type (starts other objects' interaction sequences)
	else if (talk.type.trig.act == true)
	{
		if (talk.stg == -1 && fn_key_pressed(talk.type.trig.key) == true && ((myself.type == "prop") || (myself.type == "actor" && move.stg == -1)))
		{
			var _obj = instance_place(fn_actor_xAhead(id, x, dir_curr, 16), fn_actor_yAhead(id, y, dir_curr, 16), obj_prop_parent);
			if (_obj != noone && _obj.talk.act == true && _obj.talk.stg == -1 && ((_obj.myself.type == "prop") || (_obj.myself.type == "actor" && move.stg == -1)))
			{
				move.stg = -2;
				
				with (_obj)
				{
					talk.stg = 0;
					if (myself.type == "actor")
						move.stg = -2;
				}
			}
		}
	}
}




// Noise (audio that can only be heard if the player is near the object)
if (noise.act == true && noise.aud.asset == -1 && noise.aud.style == -1)
{
	if (noise.aud.id == -1)
	{
		if (noise.wait.act == false) || (noise.wait.act == true && noise.wait.durCurr <= 0)
		{
			if (noise.wait.act == true)
				noise.wait.durCurr = irandom_range(noise.wait.durMin, noise.wait.durMax);
			noise.aud.id = fn_aud_play(noise.aud.asset, noise.aud.style, 0, , , noise.aud.loops);
		}
		else
			noise.wait.durCurr -= 1;
	}
	else
	{
		if (audio_is_playing(noise.aud.id) == true)
		{
			var _aud_volTgt = (1 - (clamp(distance_to_object(obj_player), 0, noise.distMin) / noise.distMin));
			var _aud_volSpd = 0.05;
			noise.aud.vol = lerp(noise.aud.vol, _aud_volTgt, _aud_volSpd);
			fn_aud_vol(noise.aud.asset, noise.aud.id, noise.aud.style, noise.aud.vol);
		}
		else
			noise.aud.id = -1;
	}
}
