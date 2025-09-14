
fn_prop_evStep();




// Talk (interaction sequence)
if (talk.act == true && talk.stg > -1)
{
	// Bell type (starts playing an audio)
	if (talk.type.bell.act == true)
	{
		var _bell = talk.type.bell;
		
		if (talk.stg == 0)
		{
			if (_bell.aud_idx == -1)
				_bell.aud_idx = irandom_range(0, (array_length(_bell.aud_asset) - 1));
			fn_aud_play(_bell.aud_asset[_bell.aud_idx], _bell.aud_style);
			_bell.aud_idx = -1;
			
			talk.stg = 1;
			_bell.dur_curr = 0;
		}
		if (talk.stg == 1)
		{
			_bell.dur_curr += 1;
			if (_bell.dur_curr >= _bell.dur)
			{
				talk.stg = -1;
				if (myself.type == "actor")
					move.stg = -1;
				
				if (fn_obj_exists(obj_player) == true)
					obj_player.move.stg = -1;
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
			fn_fader_obj_create();
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
		talk.stg = -1;
		var _gift = talk.type.gift;
		if (_gift.content_idx != -1 && _gift.content[_gift.content_idx] != -1 && _gift.content[_gift.content_idx].unlocked == false)
		{
			var _content = _gift.content[_gift.content_idx];
			if (array_contains(global.player.eff, _content) == true)
			{
				
			}
			else if (array_contains(global.player.itm, _content) == true)
				fn_player_itm_unlock(array_get_index(global.player.itm, _content));
			else if (array_contains(global.player.thm, _content) == true)
			{
				
			}
			
			image_index = 1;
		}
		else
			obj_player.move.stg = -1;
	}
}


// Talk trigger
if (talkTrig.act == true && fn_key_pressed(talkTrig.key) == true && talk.stg == -1 && move.stg == -1)
{
	var _tgt = instance_place(fn_actor_xAhead(id, x, dir_curr, 16), fn_actor_yAhead(id, y, dir_curr, 16), obj_prop_parent);
	if (_tgt != noone && _tgt.talk.act == true && _tgt.talk.stg == -1)
	{
		if (_tgt.myself.type == "prop") || (_tgt.myself.type == "actor" && _tgt.move.stg <= -1)
		{
			if (_tgt.talk.freezeTrig == true)
				move.stg = -2;
			
			_tgt.talk.stg = 0;
			if (_tgt.myself.type == "actor")
				_tgt.move.stg = -2;
		}
	}
}




// Noise (audio that can only be heard if the player is near the object)
if (noise.act == true && noise.aud.asset == -1 && noise.aud.style == -1)
{
	if (noise.stg == -1 && ((noise.wait.act == false) || (noise.wait.act == true && noise.wait.dur_curr <= 0)))
	{
		if (noise.wait.act == true)
			noise.wait.dur_curr = irandom_range(noise.wait.dur_min, noise.wait.dur_max);
		
		noise.aud.id = fn_aud_play(noise.aud.asset, noise.aud.style, 0, , , noise.aud.loops);
	}
	else if (noise.stg == -1 && noise.wait.act == true && noise.wait.dur_curr >= 0)
		noise.wait.dur_curr -= 1;
	
	if (noise.stg == 0)
	{
		if (audio_is_playing(noise.aud.id) == true)
		{
			noise.aud.vol = lerp(noise.aud.vol, (1 - (clamp(distance_to_object(obj_player), 0, noise.distMin) / noise.distMin)), 0.05);
			fn_aud_vol(noise.aud.asset, noise.aud.id, noise.aud.style, noise.aud.vol);
		}
		else
		{
			noise.stg = -1;
			noise.aud.id = -1;
		}
	}
}
