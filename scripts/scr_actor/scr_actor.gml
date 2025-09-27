
//////// Functions related to actors (characters like entities and the player)


function fn_actor_evCreate() // Create Event determined by the actor's object index
{
	// Main data (presets)
	switch (object_index)
	{
		// Good/Peaceful entities
		case obj_actor_macaco_monkey: // Macacolandia monkey citizen
			talk.type.bell.aud_style = CONFIG_AUD_STYLE.ACTOR;
			noise.aud.style = CONFIG_AUD_STYLE.ACTOR;
			move.wait.act = true;
			move.mode.auto.act = true;
			move.type.walk.act = true;
			move.type.walk.dur = 32;
			move.chain.act = true;
		break;
		
		
		// Evil/Hostile entities
		case obj_actor_dbgwrld_blood: // Debug World blood monkey
			noise.aud.style = CONFIG_AUD_STYLE.ACTOR;
			noise.aud.asset = snd_prop_noise_weird;
			move.mode.auto.act = true;
			move.mode.auto.chase_act = true;
			move.mode.auto.chase_tgt = obj_player;
			move.type.walk.act = true;
			move.type.walk.dur = 24;
		break;
	}
	
	
	// Other data (object-specific personalization)
	switch (object_index)
	{
		// Player
		case obj_player:
			myself.draw.act = true;
			talkTrig.act = true;
			dir[DIR_LT].spr = spr_player_dir_lt;
			dir[DIR_RT].spr = spr_player_dir_rt;
			dir[DIR_UP].spr = spr_player_dir_up;
			dir[DIR_DN].spr = spr_player_dir_dn;
			move.precise = false;
			move.mode.manual.act = true;
			move.type.walk.act = true;
			move.type.walk.fstep.act = true;
			move.type.walk.fstep.snd_asset = snd_player_fstep;
			move.type.walk.fstep.snd_style = CONFIG_AUD_STYLE.PLAYER;
			move.type.roll.act = false;
			
			if (global.player.eff_curr == -1 && global.player.itm_curr == -1)
			{
				if (itm_old == PLAYER_ITM.KART)
				{
					x = fn_actor_xRound(id, x);
					y = fn_actor_xRound(id, y);
					myself.x = x;
					myself.y = y;
				}
			}
			else if (global.player.itm_curr == PLAYER_ITM.KART)
			{
				myself.draw.act = false;
				move.precise = false;
				move.type.walk.act = false;
				move.type.roll.act = true;
				move.type.roll.snd_asset = snd_player_itm_kart;
				move.type.roll.snd_style = CONFIG_AUD_STYLE.PLAYER;
				move.type.roll.turn.snd_asset = snd_player_itm_kart_turn;
				move.type.roll.turn.snd_style = CONFIG_AUD_STYLE.PLAYER;
				move.type.roll.hit.snd_asset = snd_player_itm_kart_hit;
				move.type.roll.hit.snd_style = CONFIG_AUD_STYLE.PLAYER;
			}
		break;
		
		
		// Good/Peaceful entities
		case obj_actor_macaco_monkey: // Macacolandia monkey citizen
			myself.imgSpd = (random_range(0.5, 1.5) / 30);
			talk.act = true;
			talk.type.bell.act = true;
			for (var a = 0; a < 7; a++)
				talk.type.bell.aud_asset[a] = asset_get_index($"snd_actor_macaco_monkey_{a}");
		break;
		
		
		// Evil/Hostile entities
		case obj_actor_dbgwrld_blood: // Debug World blood monkey
			myself.imgSpd = (random_range(0.5, 1.5) / 30);
		break;
	}
}
function fn_actor_evStep() // Step Event determined by the actor's object index
{
	if (talk.type.bell.act == true && talk.stg == 0)
	{
		switch (object_index)
		{
			case obj_actor_macaco_monkey: // Macacolandia monkey citizen
				talk.type.bell.aud_idx = irandom_range(0, 4);
				if (irandom_range(1, 100) <= 5)
					talk.type.bell.aud_idx = irandom_range(5, 6);
				break;
		}
	}
}


function fn_actor_dir(_obj, _dir)
{
	if (fn_obj_exists(_obj) == true)
		_obj.dir_curr = _dir;
}
function fn_actor_dir_spr(_obj, _lt_spr, _rt_spr = _lt_spr, _up_spr = _lt_spr, _dn_spr = _lt_spr)
{
	if (fn_obj_exists(_obj) == true)
	{
		_obj.dir[_obj.DIR_LT].spr = _lt_spr;
		_obj.dir[_obj.DIR_RT].spr = _rt_spr;
		_obj.dir[_obj.DIR_UP].spr = _up_spr;
		_obj.dir[_obj.DIR_DN].spr = _dn_spr;
	}
}


function fn_actor_xRound(_obj, _x)
{
	if (fn_obj_exists(_obj) == true)
		return (16 * round(_x / 16));
	else
		return 0;
}
function fn_actor_yRound(_obj, _y)
{
	if (fn_obj_exists(_obj) == true)
		return (16 * round(_y / 16));
	else
		return 0;
}
function fn_actor_xAhead(_obj, _x, _dir, _dist)
{
	if (fn_obj_exists(_obj) == true)
		return (_x + ((_dist * _obj.dir[_dir].sign) * (_obj.dir[_dir].axis == _obj.DIR_AXIS_HOR)));
	else
		return 0;
}
function fn_actor_yAhead(_obj, _y, _dir, _dist)
{
	if (fn_obj_exists(_obj) == true)
		return (_y + ((_dist * _obj.dir[_dir].sign) * (_obj.dir[_dir].axis == _obj.DIR_AXIS_VER)));
	else
		return 0;
}


function fn_actor_stage_loop()
{
	var _xDist = 0;
	var _yDist = 0;
	
	var _stg = obj_stage;
	if (fn_obj_exists(_stg) == true)
	{
		if (_stg.loop.xAct == true)
		{
			if (_stg.cam.lock.x == undefined)
			{
				if (x < 0)
					_xDist = room_width;
				if (x >= room_width)
					_xDist = -room_width;
			}
			else
			{
				if (x < -16)
					_xDist = (room_width + 16);
				if (x > room_width)
					_xDist = -(room_width + 16);
			}
		}
		if (_stg.loop.yAct == true)
		{
			if (_stg.cam.lock.y == undefined)
			{
				if (y <= 0)
					_yDist = room_height;
				if (y > room_height)
					_yDist = -room_height;
			}
			else
			{
				if (y < 0)
					_yDist = (room_height + 32);
				if (y > (room_height + 32))
					_yDist = -(room_height + 32);
			}
		}
	}
	
	x += _xDist;
	y += _yDist;
	myself.x += _xDist;
	myself.y += _yDist;
}




// I am not insane. I am not in pain. I am not Shane. Have you seen the walls? Have you seen the balls? Have you seen the dolls? The dog is barking for food. The dog is barking for good. The dog is barking for wood. There is no one here. There is no one near. There is no fun fear.
