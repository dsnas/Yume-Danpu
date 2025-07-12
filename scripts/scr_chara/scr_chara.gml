
//////// Functions related to characters, like entities and the player


function fn_chara_setup_0() // Sets up the main variables of the character
{
	fn_draw_self_setup();
	
	
	// Directions
	DIR_LT = 0; // Index number of each direction the character can look towards
	DIR_RT = 1;
	DIR_UP = 2;
	DIR_DN = 3;
	dir = DIR_DN; // Current direction the character is looking towards
	
	DIR_AXIS_HOR = 0; // ID number of each axis the character can look towards
	DIR_AXIS_VER = 1;
	dir_axis[DIR_LT] = DIR_AXIS_HOR; // Axis of each direction the character can look towards
	dir_axis[DIR_RT] = DIR_AXIS_HOR;
	dir_axis[DIR_UP] = DIR_AXIS_VER;
	dir_axis[DIR_DN] = DIR_AXIS_VER;
	
	dir_amt = 4;
	for (var d = 0; d < dir_amt; d++)
		dir_spr[d] = spr_player_dn; // The character's sprite asset of each direction the character can look towards
	
	
	// Movement sequence
	move_act = true;
	move_stg = -1; // ID of the current stage of the movement sequence
	if (fn_obj_exists(obj_rmTrans) == true && obj_rmTrans.destroy == false) // Freezes the character if the room transition sequence is active
		move_stg = -2;
	move_dur = 15; // Time in frames the character will take to walk the distance
	move_dist = 16; // Distance the character will move
	move_durCurr = 0;
	
		// Delay (customizable)
	move_dly_act = false; // Determines if the character's movement will be delayed
	move_dly_durMin = 0;
	move_dly_durMax = 240;
	move_dly_dur = 0;
	
		// Types (customizable)
	MOVE_TYPE_MANUAL = 0; // Manual, moves only after receiving a key input (ex.: the player)
	MOVE_TYPE_AUTO = 1; // Automatic, moves to a random direction (ex.: entities)
	move_type = -1;
	
			// Automatic type
	move_auto_chaseTgt = -1; // Index of the object the character will chase (-1 == no one)
	
		// Directions
	move_dir_spdMul[DIR_LT] = -1;
	move_dir_spdMul[DIR_RT] = 1;
	move_dir_spdMul[DIR_UP] = -1;
	move_dir_spdMul[DIR_DN] = 1;
	
	move_dir_key[DIR_LT] = CONFIG_KEY.LT;
	move_dir_key[DIR_RT] = CONFIG_KEY.RT;
	move_dir_key[DIR_UP] = CONFIG_KEY.UP;
	move_dir_key[DIR_DN] = CONFIG_KEY.DN;
	
	for (var d = 0; d < dir_amt; d++)
	{
		move_dir_pos_x[d] = 0;
		move_dir_pos_y[d] = 0;
		move_dir_pos_free[d] = true;
	}
	
		// Walking animation
	move_walk_act = true; // Determines if the character will animate as walking
	move_walk_snd_asset = -1; // ID of the asset of the character's walking sound
	move_walk_snd_volType = -1;
	
		// Chain
	move_chain_act = false; // Determines if the character can NOT move too far from their starting position
	move_chain_dist = 48;
	
		// "Zoom"
	move_zoom_act = false; // Determines if the character will "zoom" when moving
	move_zoom_durMin = 30;
	move_zoom_durMax = 5;
	move_zoom_time = 90;
	move_zoom_timeCurr = 0;
	move_zoom_dirOld = -1;
	
			// Sound
	move_zoom_snd_asset = -1;
	move_zoom_snd_volType = -1;
	move_zoom_snd_pitMin = 0.75;
	move_zoom_snd_pitMax = 1.25;
	move_zoom_snd_id = -1;
	
		// Presets
	MOVE_PRESET_PLAYER = "player"; // Player
	MOVE_PRESET_ENTITY_PEACE = "entity_peace"; // Peaceful entity
	MOVE_PRESET_ENTITY_HOSTL = "entity_hostl"; // Hostile entity
	move_preset = MOVE_PRESET_ENTITY_PEACE;
	
	
	// Cutscenes
	cutsc_act = false;
}
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
		move_walk_snd_volType = CONFIG_VOLTYPE.PLAYER;
	}
	if (move_preset == MOVE_PRESET_ENTITY_PEACE) || (move_preset == MOVE_PRESET_ENTITY_HOSTL) // Entity preset
	{
		move_type = MOVE_TYPE_AUTO;
		move_dur = 30;
		
		if (move_preset == MOVE_PRESET_ENTITY_PEACE)
		{
			move_dly_act = true;
			move_chain_act = true;
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
		// "Zoom" (Kart)
		if (move_zoom_act == true)
		{
			// Sound
			if (move_zoom_snd_asset != -1)
			{
				if (move_zoom_snd_id == -1)
					move_zoom_snd_id = fn_aud_play(move_zoom_snd_asset, move_zoom_snd_volType, , , , true);
				var _zoom_snd_pitch = move_zoom_snd_pitMin + ((move_zoom_timeCurr / move_zoom_time) * (move_zoom_snd_pitMax - move_zoom_snd_pitMin));
				fn_aud_pitch(move_zoom_snd_id, _zoom_snd_pitch);
			}
			
			
			
			var _key_hold = false;
			for (var d = 0; d < dir_amt; d++)
			{
				if (fn_config_key_hold(move_dir_key[d]) == true)
				{
					_key_hold = true;
					break;
				}
				else
					continue;
			}
			
			if (move_dir_pos_free[dir] == false && move_zoom_timeCurr > 0)
			{
				move_zoom_timeCurr = 0;
				fn_aud_play(snd_itm_kart_break, CONFIG_VOLTYPE.PLAYER);
			}
			
			if (_key_hold == false)
			{
				if (move_zoom_timeCurr > 0)
					move_zoom_timeCurr -= 1;
			}
			else if (_key_hold == true && move_stg > -1)
			{
				if (move_zoom_timeCurr < move_zoom_time)
					move_zoom_timeCurr += 1;
			}
			
			if (move_stg == -1)
			{
				if (move_zoom_dirOld != dir)
				{
					if (move_zoom_dirOld != -1 && move_zoom_timeCurr > 0)
					{
						if (move_zoom_timeCurr >= move_zoom_time)
							fn_aud_play(snd_itm_kart_turn, CONFIG_VOLTYPE.PLAYER);
						move_zoom_timeCurr /= 1.5;
					}
					move_zoom_dirOld = dir;
				}
				
				move_dur = move_zoom_durMin - ((move_zoom_durMin - move_zoom_durMax) * (move_zoom_timeCurr / move_zoom_time));
			}
		}
		
		
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
						if (fn_config_key_hold(move_dir_key[d]) == true)
						{
							_dir = d;
							break;
						}
						else
							continue;
					}					
					
					if (_dir == -1)
					{
						if (move_zoom_act == true && move_dur < move_zoom_durMin)
							_dir = dir;
					}
				}
				else if (move_type == MOVE_TYPE_AUTO) // Auto type
				{
					_dir = choose(DIR_LT, DIR_RT, DIR_UP, DIR_DN);
					if (move_auto_chaseTgt != -1)
					{
						var d = point_direction(x, y, move_auto_chaseTgt.x, move_auto_chaseTgt.y);
						if (d >= 0 && d < 45) || (d >= 315 && d < 360)
							_dir = DIR_RT;
						else if (d >= 45 && d < 135)
							_dir = DIR_UP;
						else if (d >= 135 && d < 225)
							_dir = DIR_LT;
						else if (d >= 225 && d < 315)
							_dir = DIR_DN;
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
					move_dir_pos_free[dir] = true;
					
					// Checks for collision
					if (instance_place(move_dir_pos_x[dir], move_dir_pos_y[dir], obj_player) == noone && instance_place(move_dir_pos_x[dir], move_dir_pos_y[dir], obj_solid_parent) == noone)
					{
						// Checks if the character would move too far from their starting position
						if (move_chain_act == true)
						{
							var _move_chain_xDiff = abs(xstart - move_dir_pos_x[dir]);
							var _move_chain_yDiff = abs(ystart - move_dir_pos_y[dir]);
							
							if (global.dbg_act == true && global.dbg_excessLog == true)
								fn_log($"move_chain_xDiff = {_move_chain_xDiff} | move_chain_yDiff = {_move_chain_yDiff}");
						}
						if (move_chain_act == false)
						|| (move_chain_act == true && _move_chain_xDiff < move_chain_dist && _move_chain_yDiff < move_chain_dist)
						{
							x = move_dir_pos_x[dir];
							y = move_dir_pos_y[dir];
							move_stg = 0;
						}
						else
							move_dir_pos_free[dir] = false;
					}
					else
						move_dir_pos_free[dir] = false;
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

/* Zoom
if (move_zoom_act == true)
		{
			if (move_stg > -1)
			{
				if (move_zoom_time < move_zoom_timeMax)
					move_zoom_time += 1;
			}
			else if (move_stg == -1)
			{
				if (move_zoom_time > 0)
					move_zoom_time -= 1;
				
				move_dur = move_zoom_durMin - ((move_zoom_durMin - move_zoom_durMax) * (move_zoom_time / move_zoom_timeMax));
			}
		}

if (_dir == -1 && move_zoom_act == true && move_dur < move_zoom_durMin)
					{
						_dir = dir;
					}






var _zoom = false;
for (var d = 0; d < dir_amt; d++)
{
	if (fn_config_key_hold(move_dir_key[d]) == true)
	{
		_zoom = true;
		break;
	}
	else
		continue;
}
			
if (_zoom == false)
{
	if (move_dur > 0)
		move_dur -= 0.01;
}
else if (_zoom == true)
{
	if (move_dur < 
}
*/


/*
function fn_chara_move() // The character's movement sequence
{
	
		
		// Manual type  →  Autowalk
		if (move_manual_atwlk_act == true)
		{
			for (var d = 0; d < 4; d++)
			{
				if (fn_config_key_hold(move_dir_key[d]) == true)
					move_manual_atwlk_lastDir = d;
			}
		}
	}
}










// Autowalk
				if (move_manual_atwlk_act == true && _move_dir == -1)
				{
					_move_dir = move_dir;
					if (move_manual_atwlk_lastDir != -1)
						_move_dir = move_manual_atwlk_lastDir;
					move_manual_atwlk_lastDir = -1;
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
