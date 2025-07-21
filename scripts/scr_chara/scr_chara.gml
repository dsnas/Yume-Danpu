



function fn_chara_setup()
{
	fn_draw_self_setup();
	
	
	// Directions
	DIR_LT = 0;
	DIR_RT = 1;
	DIR_UP = 2;
	DIR_DN = 3;
	dir = DIR_DN;
	
	dir_spr[DIR_LT] = -1;
	dir_spr[DIR_RT] = -1;
	dir_spr[DIR_UP] = -1;
	dir_spr[DIR_DN] = -1;
	
	dir_key[DIR_LT] = CONFIG_KEY.LT;
	dir_key[DIR_RT] = CONFIG_KEY.RT;
	dir_key[DIR_UP] = CONFIG_KEY.UP;
	dir_key[DIR_DN] = CONFIG_KEY.DN;
	
	DIR_AXIS_HOR = 0;
	DIR_AXIS_VER = 1;
	dir_axis[DIR_LT] = DIR_AXIS_HOR;
	dir_axis[DIR_RT] = DIR_AXIS_HOR;
	dir_axis[DIR_UP] = DIR_AXIS_VER;
	dir_axis[DIR_DN] = DIR_AXIS_VER;
	
	dir_sign[DIR_LT] = -1;
	dir_sign[DIR_RT] = 1;
	dir_sign[DIR_UP] = -1;
	dir_sign[DIR_DN] = 1;
	
	
	// Movement
	move_stg = -1;
	move_dist = 16;
	move_dur = 16;
	move_durCurr = 0;
	
	move_delay_act = false;
	move_delay_durMin = 30;
	move_delay_durMax = 240;
	move_delay_durCurr = irandom_range(move_delay_durMin, move_delay_durMax);
	
	MOVE_TYPE_MANUAL = 0;
	MOVE_TYPE_AUTO = 1;
	move_type = -1;
	
	move_chain_act = false;
	move_chain_dist = 48;
	
	move_walk_act = true;
	move_walk_snd_asset = -1;
	move_walk_snd_volType = -1;
	move_walk_amtCurr = 0;
	move_walk_delay_durCurr = 0;
	
		// Presets
	MOVE_PRESET_PLAYER = 0;
	MOVE_PRESET_ENTITY = 1;
	move_preset = -1;
	
	
	// Cutscenes
	cutsc_act = false;
}
function fn_chara_move()
{
	if (move_stg == -1)
	{
		var _dir = -1;
		
		if (move_delay_act == false) || (move_delay_act == true && move_delay_durCurr <= 0)
		{
			if (move_type == MOVE_TYPE_MANUAL)
			{
				for (var d = 0; d < 4; d++)
				{
					if (fn_key_held(dir_key[d]) == true)
						_dir = d;
				}
			}
			else if (move_type == MOVE_TYPE_AUTO)
				_dir = choose(DIR_LT, DIR_RT, DIR_UP, DIR_DN);
			
			if (move_delay_act == true)
				move_delay_durCurr = irandom_range(move_delay_durMin, move_delay_durMax);
		}
		else
			move_delay_durCurr -= 1;
		
		if (_dir != -1)
		{
			dir = _dir;
			sprite_index = dir_spr[dir];
			
			var _move_xTgt = (x + ( (move_dist * dir_sign[dir]) * (dir_axis[dir] == DIR_AXIS_HOR) ) );
			var _move_yTgt = (y + ( (move_dist * dir_sign[dir]) * (dir_axis[dir] == DIR_AXIS_VER) ) );
			if (place_meeting(_move_xTgt, _move_yTgt, obj_solid_parent) == false)
			{
				if (move_chain_act == false) || (move_chain_act == true && abs(xstart - _move_xTgt) < move_chain_dist && abs(ystart - _move_yTgt) < move_chain_dist)
				{
					x = _move_xTgt;
					y = _move_yTgt;
					
					move_stg = 0;
					move_durCurr = 0;
				}
			}
		}
	}
	
	if (move_stg == 0)
	{
		var _move_spd = (move_dist / move_dur);
		self_x += (_move_spd * dir_sign[dir]) * (dir_axis[dir] == DIR_AXIS_HOR);
		self_y += (_move_spd * dir_sign[dir]) * (dir_axis[dir] == DIR_AXIS_VER);
		depth = -self_y;
		
		if (move_walk_act == true && move_walk_amtCurr < move_walk_amt)
		{
			if (move_walk_delay_durCurr <= 0)
			{
				image_index += 1;
				if (move_walk_snd_asset != -1 && image_index % 2 == 1)
					fn_aud_play(move_walk_snd_asset, move_walk_snd_volType);
				move_walk_amtCurr += 1;
				move_walk_delay_durCurr = move_walk_delay_dur;
			}
			else
				move_walk_delay_durCurr -= 1;
		}
		fn_log($"delay_dur = {move_walk_delay_dur} | amt = {move_walk_amt}");
		
		move_durCurr += 1;
		if (move_durCurr >= move_dur)
		{
			if (image_index % 2 == 1)
				image_index += 1;
			self_x = x;
			self_y = y;
			
			move_stg = -1;
			if (move_walk_act == true)
			{
				move_walk_amtCurr = 0;
				move_walk_delay_durCurr = 0;
			}
		}
	}
}


function fn_chara_move_preset()
{
	switch (move_preset)
	{
		// Player preset
		case MOVE_PRESET_PLAYER:
		
			dir_spr[DIR_LT] = spr_player_lt;
			dir_spr[DIR_RT] = spr_player_rt;
			dir_spr[DIR_UP] = spr_player_up;
			dir_spr[DIR_DN] = spr_player_dn;
			
			move_type = MOVE_TYPE_MANUAL;
			
			move_walk_snd_asset = snd_player_fstep;
			move_walk_snd_volType = CONFIG_AUD_STYLE.PLAYER;
			
			break;
		
		
		// Entity preset
		case MOVE_PRESET_ENTITY:
			
			break;
	}
	
	move_walk_amt = clamp((round(move_dist / move_dur) + 1), 2, infinity);
	move_walk_delay_dur = floor(move_dur / move_walk_amt);
}

















/*

function fn_chara_setup_1()
{
	// Directions
	sprite_index = dir_spr[dir];
	
	
	// Movement
		// Presets
	if (move_preset == MOVE_PRESET_PLAYER) // Player preset
	{
		dir_spr[DIR_LT] = spr_player_lt;
		dir_spr[DIR_RT] = spr_player_rt;
		dir_spr[DIR_UP] = spr_player_up;
		dir_spr[DIR_DN] = spr_player_dn;
		
		move_type = MOVE_TYPE_MANUAL;
		
		move_walk_snd_asset = snd_player_fstep;
		move_walk_snd_volType = CONFIG_AUD_STYLE.PLAYER;
	}
	if (move_preset == MOVE_PRESET_ENTITY_SLOW) || (move_preset == MOVE_PRESET_ENTITY_FAST) // Entity preset
	{
		move_type = MOVE_TYPE_AUTO;
		
		if (move_preset == MOVE_PRESET_ENTITY_SLOW)
		{
			move_dur = 30;
			move_dly_act = true;
			move_chain_act = true;
		}
		else if (move_preset == MOVE_PRESET_ENTITY_FAST)
		{
			
		}
	}
	
		// Walking animation
	move_walk_amt = ceil(move_dist / move_dur);
	move_walk_amtCurr = 0;
	move_walk_dly_dur = floor(move_dur / move_walk_amt);
	move_walk_dly_durCurr = 0;
}


function fn_chara_move()
{
	if (move_act == true)
	{
		dirOld = dir;
		
		
		// Idle, inactive movement sequence
		if (move_stg == -1)
		{
			if (move_dly_act == false) || (move_dly_act == true && move_dly_dur <= 0)
			{
				move_dly_dur = irandom_range(move_dly_durMin, move_dly_durMax);
				
				
				// Retrieves the direction the character will move towards
				var _dir = -1;
				if (move_type == MOVE_TYPE_MANUAL) // Manual type
				{
					for (var d = 0; d < dir_amt; d++)
					{
						move_dir_key_inp[d] = fn_key_held(move_dir_key[d]);
						if (move_dir_key_inp[d] == true)
						{
							_dir = d;
							break;
						}
						else
							continue;
					}
				}
				else if (move_type == MOVE_TYPE_AUTO) // Automatic type
				{
					_dir = choose(DIR_LT, DIR_RT, DIR_UP, DIR_DN);
					
					// Chasing
					if (move_auto_chase != -1)
					{
						var d = point_direction(x, y, move_auto_chase.x, move_auto_chase.y);
						if (d >= 0 && d < 45) || (d >= 315 && d < 360)
							_dir = DIR_RT;
						else if (d >= 45 && d < 135)
							_dir = DIR_UP;
						else if (d >= 135 && d < 225)
							_dir = DIR_LT;
						else if (d >= 225 && d < 315)
							_dir = DIR_DN;
					}
					
					// Fleeing
					else if (move_auto_flee != -1 && distance_to_object(move_auto_flee) < move_auto_fleeDist)
					{
						var d = point_direction(x, y, move_auto_flee.x, move_auto_flee.y);
						if (d >= 0 && d < 45) || (d >= 315 && d < 360)
							_dir = DIR_LT;
						else if (d >= 45 && d < 135)
							_dir = DIR_DN;
						else if (d >= 135 && d < 225)
							_dir = DIR_RT;
						else if (d >= 225 && d < 315)
							_dir = DIR_UP;
					}
				}
				
				
				// Calculates movement target position and checks for collision
				if (_dir != -1)
				{
					dir = _dir;
					sprite_index = dir_spr[dir];
					
					// Calculates target position of the movement
					move_dir_pos_x[dir] = (x + (move_dist * move_dir_spdMul[dir]) * (dir_axis[dir] == DIR_AXIS_HOR));
					move_dir_pos_y[dir] = (y + (move_dist * move_dir_spdMul[dir]) * (dir_axis[dir] == DIR_AXIS_VER));
					
					// Checks for collision
					if (instance_place(move_dir_pos_x[dir], move_dir_pos_y[dir], obj_player) == noone && instance_place(move_dir_pos_x[dir], move_dir_pos_y[dir], obj_solid_parent) == noone)
					{
						// Checks if the character would move too far from their starting position
						if (move_chain_act == false)
						|| (move_chain_act == true && abs(xstart - move_dir_pos_x[dir]) < move_chain_dist && abs(ystart - move_dir_pos_y[dir]) < move_chain_dist)
						{
							// Starts the movement sequence
							x = move_dir_pos_x[dir];
							y = move_dir_pos_y[dir];
							move_stg = 0;
						}
					}
					else
					{
						
					}
					
					move_stgOld = move_stg;
				}
			}
			else if (move_dly_act == true)
				move_dly_dur -= 1;
		}
		
		
		// Moving, active movement sequence
		if (move_stg == 0) // Moves
		{
			self_x += (((move_dist / move_dur) * move_dir_spdMul[dir]) * (dir_axis[dir] == DIR_AXIS_HOR));
			self_y += (((move_dist / move_dur) * move_dir_spdMul[dir]) * (dir_axis[dir] == DIR_AXIS_VER));
			fn_chara_rm_loop();
			depth = -self_y;
			
			
			// Walking animation
			if (move_walk_act == true)
			{
				if (move_walk_dly_durCurr <= 0)
				{
					if (move_walk_amtCurr < move_walk_amt)
					{
						image_index += 1;
						move_walk_amtCurr += 1;
						if (move_walk_snd_asset != -1 && image_index % 2 == 1)
							fn_aud_play(move_walk_snd_asset, move_walk_snd_volType);
					}
					move_walk_dly_durCurr = move_walk_dly_dur;
				}
				else
					move_walk_dly_durCurr -= 1;
			}
			
			
			move_durCurr += 1;
			if (move_durCurr >= move_dur)
			{
				depth = -y;
				if (image_index % 2 == 1)
					image_index += 1;
				self_x = x;
				self_y = y;
				
				move_stgOld = move_stg;
				move_stg = -1;
				move_durCurr = 0;
				if (move_walk_act == true)
				{
					move_walk_amtCurr = 0;
					move_walk_dly_durCurr = 0;
				}
				
				if (global.dbg_act == true && global.dbg_excessLog == true)
					fn_log($"x = {x} | self_x = {self_x} | y = {y} | self_y = {self_y} | depth = {depth}");
			}
		}
	}
}
*/






function fn_chara_rm_loop() // Room looping system
{
	var _xDist = 0;
	var _yDist = 0;
	
	rmCtrl = obj_rmCtrl;
	if (fn_obj_exists(rmCtrl) == true)
	{
		if (rmCtrl.loop_xAct == true)
		{
			if (rmCtrl.cam_lock_xAct == false)
			{
				if (self_x < 0)
					_xDist = room_width;
				if (self_x >= room_width)
					_xDist = -room_width;
			}
			else
			{
				if (self_x <= -16)
					_xDist = (room_width + 16);
				if (self_x > room_width)
					_xDist = -(room_width + 16);
			}
		}
		if (rmCtrl.loop_yAct == true)
		{
			if (rmCtrl.cam_lock_yAct == false)
			{
				if (self_y <= 0)
					_yDist = room_height;
				if (self_y > room_height)
					_yDist = -room_height;
			}
			else
			{
				if (self_y <= 0)
					_yDist = (room_height + 32);
				if (self_y > (room_height + 32))
					_yDist = -(room_height + 32);
			}
		}
	}
	
	
	x += _xDist;
	y += _yDist;
	self_x += _xDist;
	self_y += _yDist;
}
