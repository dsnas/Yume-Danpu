
// Room transition sequence determined by its type
if (type == TYPE_FADE) || (type == TYPE_DOORNORMAL) // Fade type, normal door type
{
	// Fade type, normal door type
	if (delay_dur <= 0)
	{
		var _fade_alpTgt = 1;
		if (stg == 1)
			_fade_alpTgt = 0;
		fade_alp = fn_lerp(fade_alp, _fade_alpTgt, fade_alpSpd);
		
		var _slack = 0.05;
		if (stg == 0 && fade_alp >= (_fade_alpTgt - _slack))
		{
			room_goto(end_rm);
			stg = 1;
			delay_dur = delay_durMax;
			
			fade_alp = _fade_alpTgt;
			if (type == TYPE_DOORNORMAL)
				doorNormal_stg = 1;
		}
		else if (stg == 1 && fade_alp <= _slack)
		{
			fade_alp = _fade_alpTgt;
			destroy = true;
		}
	}
	else
		delay_dur -= 1;
	
	
	// Normal door type
	if (type == TYPE_DOORNORMAL)
	{
		if (fn_obj_exists(start_obj_id) == true)
		{
			if (start_obj.image_index < 2)
				start_obj.image_index += 0.4;
		}
			
		if (doorNormal_stg == 0)
		{
			fn_aud_play(snd_rmTrans_door_0, CONFIG_AUD_STYLE.INTERACT);
			doorNormal_stg = -1;
		}
		else if (doorNormal_stg == 1 && delay_dur <= (delay_durMax / 4))
		{
			fn_aud_play(snd_rmTrans_door_1, CONFIG_AUD_STYLE.INTERACT);
			doorNormal_stg = -1;
		}
	}
}


// Changes the player's data
if (room == end_rm && end_player_changed == false && fn_obj_exists(obj_player) == true)
{
	if (end_player_x != 0)
	{
		with (obj_player)
		{
			x = other.end_player_x;
			self_x = x;
		}
	}
	if (end_player_y != 0)
	{
		with (obj_player)
		{
			y = other.end_player_y;
			self_y = y;
		}
	}
	if (end_player_dir != -1)
		obj_player.dir = end_player_dir;
	fn_obj_depth(obj_player);
	
	end_player_changed = true;
}


// Unfreezes the characters and destroys the sequence
if (destroy == true)
{
	if (fn_obj_exists(obj_player) == true && obj_player.move_stg == -2 && obj_player.cutsc_act == false)
		obj_player.move_stg = -1;
	for (var e = 0; e < instance_number(obj_entity); e++)
	{
		var i = instance_find(obj_entity, e);
		if (i.move_stg == -2)
			i.move_stg = -1;
	}
	
	fn_obj_destroy();
}
