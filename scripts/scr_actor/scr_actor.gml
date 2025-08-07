
//////// Functions related to actors, characters like entities and the player


function fn_actor_evCreate()
{
	// Directions
	DIR_LT = 0;
	DIR_RT = 1;
	DIR_UP = 2;
	DIR_DN = 3;
	DIR_AXIS_HOR = 0;
	DIR_AXIS_VER = 1;
	
	dir[DIR_LT] =
	{
		spr : -1,
		key : CONFIG_KEY.LT,
		key_held : false,
		axis : DIR_AXIS_HOR,
		sign : -1
	}
	dir[DIR_RT] =
	{
		spr : -1,
		key : CONFIG_KEY.RT,
		key_held : false,
		axis : DIR_AXIS_HOR,
		sign : 1
	}
	dir[DIR_UP] =
	{
		spr : -1,
		key : CONFIG_KEY.UP,
		key_held : false,
		axis : DIR_AXIS_VER,
		sign : -1
	}
	dir[DIR_DN] =
	{
		spr : -1,
		key : CONFIG_KEY.DN,
		key_held : false,
		axis : DIR_AXIS_VER,
		sign : 1
	}
	
	dirCurr = DIR_DN;
	
	
	
	
	// Movement
	move_act = true; // Determines if the actorcter can move
	move_stg = -1; // ID of the current stage of the movement sequence
	
	
		// Types
	move_type =
	{
		// Walk type
		walk :
		{
			act : false,
			dur : 16, // Duration in frames of the movement sequence
			durCurr : 0,
			
			fstep :
			{
				act : false,
				amtCurr : 0,
				delayCurr : 0,
				snd_asset : -1,
				snd_style : -1
			}
		},
		
		// Roll type (ex.: Kart item)
		roll :
		{
			act : false,
			spdMin : 0.25,
			spdMax : 4,
			accel : 0.1,
			decel : 0.1,
			
			snd_asset : -1,
			snd_style : -1,
			snd_id : -1,
			snd_pchMin : 0.5,
			snd_pchMax : 1.5,
			
			turn_snd :
			{
				asset : -1,
				style : -1
			},
			
			turn_shk :
			{
				act : true,
				dist : 1,
				dur : 8,
				durCurr : 0
			},
			
			hit_snd :
			{
				asset : -1,
				style : -1
			},
			
			hit_shk :
			{
				act : true,
				dist : 1,
				dur : 6,
				durCurr : 0
			}
		}
	}
	move_type.roll.spdCurr = move_type.roll.spdMin;
	
	
		// Modes
	move_mode =
	{
		key : // Key mode
		{
			act : false
		},
		
		rnd : // Random mode, Randomly chooses a direction
		{
			act : false
		},
		
		chase : // Chase mode, chases the specified object
		{
			act : false,
			tgt : -1
		}
	}
	
	
		// Delay (delays the start of the movement sequence)
	move_delay =
	{
		act : false,
		durMin : 30,
		durMax : 240,
		durCurr : 0
	}
		
		// Precise
	move_precise =
	{
		act : false
	}
	
	
		// Chain
	move_chain =
	{
		act : false,
		dist : 48
	}
	
	move_amt = 0;
}
function fn_actor_evStep()
{
	// WHAT THE FUCK IS GOING ON
	
	if (move_act == true)
	{
		// Idle, movement sequence inactive
		if (move_stg == -1)
		{
			var _dirCurr = -1;
			var _dirCurrOld = dirCurr;
			
			
			// Gets direction of the movement sequence
			if (move_delay.act == false) || (move_delay.act == true && move_delay.durCurr <= 0) // Delay (delays the start of the movement sequence)
			{	
				if (move_mode.key.act == true) // Key input mode
				{
					for (var d = 0; d < 4; d++)
					{
						dir[d].key_held = fn_key_held(dir[d].key);
						if (dir[d].key_held == true)
						{
							_dirCurr = d;
							break;
						}
						else
							continue;
					}
				}
				if (move_mode.rnd.act == true) // Random mode
				{
					_dirCurr = choose(DIR_LT, DIR_RT, DIR_UP, DIR_DN);
				}
				if (move_mode.chase.act == true) // Chasing mode
				{
					var _chase_tgt = instance_nearest(x, y, move_mode.chase.tgt);
					if (_chase_tgt != noone && _chase_tgt != id)
					{
						var _chase_tgtSolid = collision_line((x + (sprite_width / 2)), (y + (sprite_height / 4)), (_chase_tgt.x + (_chase_tgt.sprite_width / 2)), (_chase_tgt.y + (_chase_tgt.sprite_height / 4)), obj_solid_parent, false, true);
						if (_chase_tgtSolid == id) || (_chase_tgtSolid == _chase_tgt)
							_chase_tgtSolid = noone;
						if (_chase_tgtSolid == noone)
						{
							var d = point_direction(x, y, _chase_tgt.x, _chase_tgt.y);
							if (d >= 0 && d < 45) || (d >= 315 && d < 360)
								_dirCurr = DIR_RT;
							else if (d >= 45 && d < 135)
								_dirCurr = DIR_UP;
							else if (d >= 135 && d < 225)
								_dirCurr = DIR_LT;
							else if (d >= 225 && d < 315)
								_dirCurr = DIR_DN;
						}
					}
				}
				
				if (move_type.roll.act == true && move_type.roll.spdCurr > move_type.roll.spdMin && _dirCurr == -1)
					_dirCurr = dirCurr;
				
				move_delay.durCurr = (irandom_range(move_delay.durMin, move_delay.durMax) * move_delay.act);
			}
			else if (move_delay.act == true && move_delay.durCurr > 0)
				move_delay.durCurr -= 1;
			
			
			// Direction of the movements sequence was found
			if (_dirCurr != -1)
			{
				dirCurr = _dirCurr;
				var _move_dist = 16;
				
				if (move_type.roll.act == true) // Roll type
				{
					// Resets speed
					if (_dirCurrOld != _dirCurr) || (move_amt <= 0)
						move_type.roll.spdCurr = move_type.roll.spdMin;
					_move_dist = move_type.roll.spdCurr;
					
					// Starts turning animation
					if (_dirCurrOld != _dirCurr)
					{
						// Plays sound
						if (move_type.roll.turn_snd.asset != -1 && move_type.roll.turn_snd.style != -1)
							fn_aud_play(move_type.roll.turn_snd.asset, move_type.roll.turn_snd.style);
						
						// Starts shaking
						if (move_type.roll.turn_shk.act == true)
							move_type.roll.turn_shk.durCurr = move_type.roll.turn_shk.dur;
					}
				}
				
				while (move_precise.act == false) || (move_precise.act == true && _move_dist > 0)
				{
					var _move_xTgt = fn_actor_get_xAhead(id, x, _move_dist);
					var _move_yTgt = fn_actor_get_yAhead(id, y, _move_dist);
					if (place_meeting(_move_xTgt, _move_yTgt, obj_solid_parent) == false)
					{
						if (move_chain.act == false) || (move_chain.act == true && abs(xstart - _move_xTgt) < move_chain.dist && abs(ystart - _move_yTgt) < move_chain.dist)
						{
							move_stg = 0;
							move_xTgt = _move_xTgt;
							move_yTgt = _move_yTgt;
							move_xStart = x;
							move_yStart = y;
							
							x = _move_xTgt;
							y = _move_yTgt;
							
							if (global.dbg_act == true && global.dbg_excessLog == true)
								fn_log($"x = {x} | y = {y} | self_x = {render.x} | self_y = {render.y} | depth = {depth}");
							break;
						}
						else
						{
							move_amt = 0;
							break;
						}
					}
					else
					{
						if (move_precise.act == false)
						{
							move_amt = -1;
							break;
						}
						else if (move_precise.act == true)
						{
							_move_dist -= 0.1;
							if (_move_dist > 0)
								continue;
							else
							{
								if (move_type.roll.act == true && move_amt >= 1) // Roll type
								{
									if (move_type.roll.hit_snd.asset != -1 && move_type.roll.hit_snd.style != -1)
										fn_aud_play(move_type.roll.hit_snd.asset, move_type.roll.hit_snd.style);
						
									if (move_type.roll.hit_shk.act == true)
									{
										var _spdMax = move_type.roll.spdMax;
										var _spdCurr = move_type.roll.spdCurr;
										move_type.roll.hit_shk.durCurr = (move_type.roll.hit_shk.dur * (( _spdMax * (_spdCurr / _spdMax)) / _spdMax));
									}
								}
								
								move_amt = -1;
								break;
							}
						}
					}
				}
			}
			else
				move_amt = 0;
		}
		
		// Moving, movement sequence active
		if (move_stg == 0)
		{
			if (move_type.walk.act == true) // Walk type
			{
				render.x += ((move_xTgt - move_xStart) / move_type.walk.dur);
				render.y += ((move_yTgt - move_yStart) / move_type.walk.dur);
				depth = -render.y;
				
				// Walking animation
				if (move_type.walk.fstep.act == true)
				{
					var _fstep_amt = clamp((round(16 / move_type.walk.dur) + 1), 2, infinity);
					if (move_type.walk.fstep.amtCurr < _fstep_amt)
					{
						if (move_type.walk.fstep.delayCurr <= 0)
						{
							image_index += 1;
							if (move_type.walk.fstep.snd_asset != -1 && image_index % 2 == 1)
								fn_aud_play(move_type.walk.fstep.snd_asset, move_type.walk.fstep.snd_style);
							
							move_type.walk.fstep.amtCurr += 1;
							move_type.walk.fstep.delayCurr = floor(move_type.walk.dur / _fstep_amt);
						}
						else
							move_type.walk.fstep.delayCurr -= 1;
					}
				}
				
				//
				move_type.walk.durCurr += 1;
				if (move_type.walk.durCurr >= move_type.walk.dur)
				{
					render.x = x;
					render.y = y;
					depth = -render.y;
					
					move_stg = -1;
					move_amt = (clamp(move_amt, 0, infinity) + 1);
					move_type.walk.durCurr = 0;
					
					// Walking animation
					if (move_type.walk.act == true && move_type.walk.fstep.act == true)
					{
						if (image_index % 2 == 1)
							image_index += 1;
						move_type.walk.fstep.amtCurr = 0;
						move_type.walk.fstep.delayCurr = 0;
					}
				}
			}
			else if (move_type.roll.act == true) // Rolling type
			{
				render.x = move_xTgt;
				render.y = move_yTgt;
				fn_actor_rm_loop();
				depth = -render.y;
				
				if (dir[dirCurr].key_held == true)
					move_type.roll.spdCurr += move_type.roll.accel;
				else
					move_type.roll.spdCurr -= move_type.roll.decel;
				move_type.roll.spdCurr = clamp(move_type.roll.spdCurr, move_type.roll.spdMin, move_type.roll.spdMax);
				
				move_stg = -1;
				move_amt = (clamp(move_amt, 0, infinity) + 1);
			}
		}
	}
	
	
	sprite_index = dir[dirCurr].spr;
}
function fn_actor_evDraw()
{
	if (global.config_rdcdMot == false)
	{
		if (move_type.roll.turn_shk.act == true && move_type.roll.turn_shk.durCurr > 0)
		{
			render.xOfs += irandom_range(-move_type.roll.turn_shk.dist, move_type.roll.turn_shk.dist);
			render.yOfs += irandom_range(-move_type.roll.turn_shk.dist, move_type.roll.turn_shk.dist);
			move_type.roll.turn_shk.durCurr -= 1;
		}
		if (move_type.roll.hit_shk.act == true && move_type.roll.hit_shk.durCurr > 0)
		{
			render.xOfs += irandom_range(-move_type.roll.hit_shk.dist, move_type.roll.hit_shk.dist);
			render.yOfs += irandom_range(-move_type.roll.hit_shk.dist, move_type.roll.hit_shk.dist);
			move_type.roll.hit_shk.durCurr -= 1;
		}
	}
	
	
	if (global.dbg_act == true && global.dbg_hud_act == true) || (room == rm_dbgwrld)
	{
		draw_set_alpha(0.5);
			
		draw_set_color(c_red);
		draw_rectangle((x - 16), (y - 32), (x + 32), (y + 16), true);
			
		draw_set_color(c_blue);
		draw_rectangle((render.x - 16), (render.y - 32), (render.x + 32), (render.y + 16), true);
		
		if (solid_typeCurr == SOLID_TYPE.PLAYER)
		{
			draw_set_color(c_yellow);
			draw_rectangle(fn_actor_get_xAhead(id, x), fn_actor_get_yAhead(id, y), (fn_actor_get_xAhead(id, x) + 16), (fn_actor_get_yAhead(id, y) - 16), 1);
		}
	}
}
function fn_actor_evClean()
{
	if (move_type.roll.act == true && move_type.roll.snd_id != -1)
		fn_aud_stop(move_type.roll.snd_id);
}


function fn_actor_set_dir(_obj, _dir)
{
	if (fn_obj_exists(_obj) == true)
		_obj.dirCurr = _dir;
}
function fn_actor_set_dir_spr(_obj, _lt_spr, _rt_spr = _lt_spr, _up_spr = _lt_spr, _dn_spr = _lt_spr)
{
	if (fn_obj_exists(_obj) == true)
	{
		_obj.dir[_obj.DIR_LT].spr = _lt_spr;
		_obj.dir[_obj.DIR_RT].spr = _rt_spr;
		_obj.dir[_obj.DIR_UP].spr = _up_spr;
		_obj.dir[_obj.DIR_DN].spr = _dn_spr;
	}
}

function fn_actor_round_x(_obj, _x)
{
	if (fn_obj_exists(_obj) == true)
		return (16 * round(_x / 16));
}
function fn_actor_round_y(_obj, _y)
{
	if (fn_obj_exists(_obj) == true)
		return (16 * round(_y / 16));
}
function fn_actor_get_xAhead(_obj, _x, _dist = 16)
{
	return (_x + ((_dist * _obj.dir[_obj.dirCurr].sign) * (_obj.dir[_obj.dirCurr].axis == _obj.DIR_AXIS_HOR)));
}
function fn_actor_get_yAhead(_obj, _y, _dist = 16)
{
	return (_y + ((_dist * _obj.dir[_obj.dirCurr].sign) * (_obj.dir[_obj.dirCurr].axis == _obj.DIR_AXIS_VER)));
}


function fn_actor_rm_loop() // Room looping system
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
				if (x < 0)
					_xDist = room_width;
				if (x >= room_width)
					_xDist = -room_width;
			}
			else
			{
				if (x <= -16)
					_xDist = (room_width + 16);
				if (x > room_width)
					_xDist = -(room_width + 16);
			}
		}
		if (rmCtrl.loop_yAct == true)
		{
			if (rmCtrl.cam_lock_yAct == false)
			{
				if (y <= 0)
					_yDist = room_height;
				if (y > room_height)
					_yDist = -room_height;
			}
			else
			{
				if (y <= 0)
					_yDist = (room_height + 32);
				if (y > (room_height + 32))
					_yDist = -(room_height + 32);
			}
		}
	}
	
	x += _xDist;
	y += _yDist;
}
