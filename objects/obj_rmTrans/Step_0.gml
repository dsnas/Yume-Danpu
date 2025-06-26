
// Room transition sequence determined by its type
if (type == type_fade) // Fade type
|| (type == type_doorNormal) // Normal door type
{
	if (delay_dur <= 0)
	{
		if (type == type_doorNormal)
		{
			if (doorNormal_stg == 0) || (doorNormal_stg == 1)
			{
				if (start_obj.image_index < 2)
					start_obj.image_index += 1;
				if (doorNormal_stg == 0)
					fn_aud_play(snd_rmTrans_door_0, CONFIG_VOLTYPE.INTERACT);
				doorNormal_stg = 1;
			}
			else if (doorNormal_stg == 2)
			{
				fn_aud_play(snd_rmTrans_door_1, CONFIG_VOLTYPE.INTERACT);
				doorNormal_stg = 3;
			}
		}
		
		
		var _fade_alpTgt = 1;
		if (stg == 1)
			_fade_alpTgt = 0;
		fade_alp = lerp(fade_alp, _fade_alpTgt, fade_alpSpd);
		
		var _slack = 0.05;
		if (stg == 0 && fade_alp >= (_fade_alpTgt - _slack))
		|| (stg == 1 && fade_alp <= _slack)
		{
			fade_alp = _fade_alpTgt;
			
			if (stg == 0)
			{
				stg = 1;
				delay_dur = delay_durMax;
				room_goto(end_rm);
				
				if (type == type_doorNormal)
					doorNormal_stg = 2;
			}
			else if (stg == 1)
				destroy = true;
		}
	}
	else
		delay_dur -= 1;
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
		obj_player.move_dir = end_player_dir;
	
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
