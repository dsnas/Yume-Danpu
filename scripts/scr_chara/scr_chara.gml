

function fn_chara_setup(_chara_preset = "")
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
		axis : DIR_AXIS_HOR,
		sign : -1
	}
	dir[DIR_RT] =
	{
		spr : -1,
		key : CONFIG_KEY.RT,
		axis : DIR_AXIS_HOR,
		sign : 1
	}
	dir[DIR_UP] =
	{
		spr : -1,
		key : CONFIG_KEY.UP,
		axis : DIR_AXIS_VER,
		sign : -1
	}
	dir[DIR_DN] =
	{
		spr : -1,
		key : CONFIG_KEY.DN,
		axis : DIR_AXIS_VER,
		sign : 1
	}
	
	dirCurr = DIR_DN;
	
	
	
	
	// Movement
	move_act = true; // Determines if the character can move
	move_stg = -1; // ID of the current stage of the movement sequence
	
	move_dur = 16; // Duration in frames of the movement sequence
	move_durCurr = 0;
	
	
		// Types
	move_type =
	{
		// Walking type
		walk :
		{
			act : false,
			
			fstep :
			{
				act : true,
				amtCurr : 0,
				delayCurr : 0,
				snd_asset : -1,
				snd_style : -1
			}
		},
		
		// Rolling type
		roll :
		{
			act : false
		}
	}
	
	
		// Modes
	move_mode =
	{
		// Manual mode
		manual :
		{
			act : false
		},
		
		// Automatic mode, randomly chooses a direction
		auto :
		{
			act : false,
			
			chase :
			{
				act : false,
				tgt : -1
			}
		}
	}
	
	
		// Delay
	move_delay =
	{
		act : false,
		durMin : 30,
		durMax : 240,
		durCurr : 0
	}
	
	
		// Chain
	move_chain =
	{
		act : false,
		dist : 48
	}
	
	move_amt = 0;
	
	
	
	
	// Presets
	if (_chara_preset == "player")
	{		
		dir[DIR_LT].spr = spr_player_dir_lt;
		dir[DIR_RT].spr = spr_player_dir_rt;
		dir[DIR_UP].spr = spr_player_dir_up;
		dir[DIR_DN].spr = spr_player_dir_dn;
		
		move_type.walk.act = true;
		move_type.walk.fstep.snd_asset = snd_player_fstep;
		move_type.walk.fstep.snd_style = CONFIG_AUD_STYLE.PLAYER;
		
		move_mode.manual.act = true;
	}
	else if (string_starts_with(_chara_preset, "entity") == true)
	{
		noise.aud_style = CONFIG_AUD_STYLE.MUS;
		
		move_dur = 32;
		move_type.walk.act = true;
		move_mode.auto.act = true;
		
		if (_chara_preset == "entity_good")
		{
			dir[DIR_LT].spr = spr_entity_good;
			
			move_delay.act = true;
			move_chain.act = true;
		}
		else if (_chara_preset == "entity_evil")
		{
			noise.act = true;
			noise.aud_asset = snd_entity_evil_noise;
			
			dir[DIR_LT].spr = spr_entity_evil;
			
			move_mode.auto.chase.act = true;
			move_mode.auto.chase.tgt = obj_player;
		}
		
		dir[DIR_RT].spr = dir[DIR_LT].spr;
		dir[DIR_UP].spr = dir[DIR_LT].spr;
		dir[DIR_DN].spr = dir[DIR_LT].spr;
	}
}

function fn_chara_dir(_obj, _dir)
{
	if (_obj != -1 && fn_obj_exists(_obj) == true)
		_obj.dirCurr = _dir;
}

function fn_chara_move()
{
	// Movement sequence
	if (move_act == true)
	{
		if (move_stg == -1)
		{
			var _dir = -1;
		
		
			if (move_delay.act == false) || (move_delay.act == true && move_delay.durCurr <= 0)
			{
				if (move_delay.act == true)
					move_delay.durCurr = irandom_range(move_delay.durMin, move_delay.durMax);
			
				if (move_mode.manual.act == true) // Manual mode
				{
					for (var d = 0; d < 4; d++)
					{
						if (fn_key_held(dir[d].key) == true)
						{
							_dir = d;
							break;
						}
						else
							continue;
					}
				}
				else if (move_mode.auto.act == true) // Automatic mode
				{
					_dir = choose(DIR_LT, DIR_RT, DIR_UP, DIR_DN);
				
					if (move_mode.auto.chase.act == true)
					{
						var _chase_tgt = instance_nearest(x, y, move_mode.auto.chase.tgt);
						if (_chase_tgt != noone && _chase_tgt != id)
						{
							var _chase_tgtBrr = collision_line((x + (sprite_width / 2)), (y + (sprite_height / 4)), (_chase_tgt.x + (_chase_tgt.sprite_width / 2)), (_chase_tgt.y + (_chase_tgt.sprite_height / 4)), obj_solid_parent, false, true);
							if (_chase_tgtBrr == id) || (_chase_tgtBrr == _chase_tgt)
								_chase_tgtBrr = noone;
							if (_chase_tgtBrr == noone)
							{
								var d = point_direction(x, y, _chase_tgt.x, _chase_tgt.y);
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
					}
				}
			}
			else
				move_delay.durCurr -= 1;
		
		
			if (_dir != -1)
			{
				fn_chara_dir(id, _dir);
				
				var _move_xTgt = fn_chara_get_xAhead(id);
				var _move_yTgt = fn_chara_get_yAhead(id);
				move_xDist = (_move_xTgt - x);
				move_yDist = (_move_yTgt - y);
				if (place_meeting(_move_xTgt, _move_yTgt, obj_solid_parent) == false)
				{
					if (move_chain.act == false) || (move_chain.act == true && abs(xstart - _move_xTgt) < move_chain.dist && abs(ystart - _move_yTgt) < move_chain.dist)
					{
						x = _move_xTgt;
						y = _move_yTgt;
					
						move_durCurr = 0;
						move_stg = 0;
					}
				}
			}
			else
				move_amt = 0;
		}
		if (move_stg == 0)
		{
			move_durCurr += 1;
			
			self_x += (move_xDist / move_dur);
			self_y += (move_yDist / move_dur);
			depth = -self_y;
		
			if (move_type.walk.act == true && move_type.walk.fstep.act == true)
			{
				var _fstep_amt = clamp((round(16 / move_dur) + 1), 2, infinity);
				if (move_type.walk.fstep.amtCurr < _fstep_amt)
				{
					if (move_type.walk.fstep.delayCurr <= 0)
					{
						image_index += 1;
						if (move_type.walk.fstep.snd_asset != -1 && image_index % 2 == 1)
							fn_aud_play(move_type.walk.fstep.snd_asset, move_type.walk.fstep.snd_style);
					
						move_type.walk.fstep.amtCurr += 1;
						move_type.walk.fstep.delayCurr = floor(move_dur / _fstep_amt);
					}
					else
						move_type.walk.fstep.delayCurr -= 1;
				}
			}
		
			if (move_durCurr >= move_dur)
			{
				self_x = x;
				self_y = y;
				depth = -y;
				
				move_stg = -1;
				move_amt += 1;
				
				if (move_type.walk.act == true && move_type.walk.fstep.act == true)
				{
					if (image_index % 2 == 1)
						image_index += 1;
					move_type.walk.fstep.amtCurr = 0;
					move_type.walk.fstep.delayCurr = 0;
				}
				
				if (global.dbg_act == true && global.dbg_excessLog == true)
					fn_log($"x = {x} | y = {y} | depth = {depth} | self_x = {self_x} | self_y = {self_y}");
			}
		}
	}
	
	
	sprite_index = dir[dirCurr].spr;
}


function fn_chara_get_xAhead(_obj)
{
	return (_obj.x + ((16 * _obj.dir[_obj.dirCurr].sign) * (_obj.dir[_obj.dirCurr].axis == _obj.DIR_AXIS_HOR)));
}
function fn_chara_get_yAhead(_obj)
{
	return (_obj.y + ((16 * _obj.dir[_obj.dirCurr].sign) * (_obj.dir[_obj.dirCurr].axis == _obj.DIR_AXIS_VER)));
}



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
