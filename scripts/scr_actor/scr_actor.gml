
//////// Functions related to actors (characters like entities and the player)


function fn_actor_evCreate() // Create Event determined by the actor's object index
{
	// Main data (presets)
	switch (object_index)
	{
		// Player
		case obj_player:
			dir[DIR_LT].spr = spr_player_dir_lt;
			dir[DIR_RT].spr = spr_player_dir_rt;
			dir[DIR_UP].spr = spr_player_dir_up;
			dir[DIR_DN].spr = spr_player_dir_dn;
			myself.draw.act = true;	
			talk.act = true;
			talk.type.trig.act = true;
			move.precise = false;
			move.mode.manual.act = true;
			move.type.walk.act = true;
			move.type.walk.fstep.snd_asset = snd_player_fstep;
			move.type.walk.fstep.snd_style = CONFIG_AUD_STYLE.PLAYER;
			move.type.roll.act = false;
			
			if (global.player_effCurr == -1 && global.player_itmCurr == -1)
			{
				if (itm_old == PLAYER_ITM.KART)
				{
					x = fn_actor_xRound(id, x);
					y = fn_actor_xRound(id, y);
					myself.x = x;
					myself.y = y;
				}
			}
			else if (global.player_itmCurr == PLAYER_ITM.KART)
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
			noise.aud.style = CONFIG_AUD_STYLE.ENTITY;
			move.mode.auto.act = true;
			talk.type.bell.aud_style = CONFIG_AUD_STYLE.ENTITY;
			move.type.walk.act = true;
			move.type.walk.dur = 32;
			move.wait.act = true;
			move.chain.act = true;
			break;
		
		
		// Evil/Hostile entities
		case obj_actor_dbgwrld_blood: // Debug World blood monkey
			noise.aud.style = CONFIG_AUD_STYLE.ENTITY;
			noise.aud.asset = snd_prop_noise_weird;
			move.mode.auto.chase_act = true;
			move.mode.auto.chase_tgt = obj_player;
			move.type.walk.act = true;
			move.type.walk.dur = 32;
			break;
	}
	
	
	// Other data (per-object personalization)
	switch (object_index)
	{
		case obj_actor_macaco_monkey: // Macacolandia monkey citizen
			myself.imgSpd = (random_range(0.5, 1.5) / 30);
			talk.act = true;
			talk.type.bell.act = true;
			talk.type.bell.aud_asset[0] = snd_entity_macaco_monkey_0;
			talk.type.bell.aud_asset[1] = snd_entity_macaco_monkey_1;
			talk.type.bell.aud_asset[2] = snd_entity_macaco_monkey_2;
			talk.type.bell.aud_asset[3] = snd_entity_macaco_monkey_3;
			talk.type.bell.aud_asset[4] = snd_entity_macaco_monkey_4;
			talk.type.bell.aud_asset[5] = snd_entity_macaco_monkey_5;
			talk.type.bell.aud_asset[6] = snd_entity_macaco_monkey_6;
			break;
		
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
			case obj_entity_macaco_monkey: // Macacolandia monkey citizen
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




// I am not insane. I am not in pain. I am not Shane. Have you seen the walls? Have you seen the balls? Have you seen the dolls? The dog is barking for food. The dog is barking for good. The dog is barking for wood. There is no one here. There is no one near. There is no fun fear.
