
fn_actor_evStep();


event_inherited();


// Movement
if (move.act == true)
{
	// WHAT THE FUCK IS GOING ON
	// This must be one of the most painful pieces of code I have ever written.
	// May God have mercy on my soul.
	
	
	// Idle (movement sequence is inactive, waiting/preparing for movement)
	if (move.stg == -1 && ((move.wait.act == false) || (move.wait.act == true && move.wait.durCurr <= 0)))
	{
		move.wait.durCurr = irandom_range(move.wait.durMin, move.wait.durMax);
		var _dir_new = -1;
		
		
		if (move.mode.manual.act == true)
		{
			for (var d = 0; d < 4; d++)
			{
				move.mode.manual.held = fn_key_held(dir[d].key);
				
				if (move.mode.manual.held == true)
				{
					_dir_new = d;
					break;
				}
				else
					continue;
			}
		}
		else if (move.mode.auto.act == true)
		{
			_dir_new = irandom(3);
		}
		
		
		if (_dir_new != -1)
		{
			dir_curr = _dir_new;
			var _move_dist = 0;
			var _move_precise = false;
			
			
			if (move.type.walk.act == true)
			{
				_move_dist = move.type.walk.dist;
				_move_precise = move.type.walk.precise;
			}
			else if (move.type.roll.act == true)
			{
				if (move.type.roll.dist == 0)
				{
					if (move.mode.manual.act == true)
						move.type.roll.dist = move.type.roll.distMin;
					else if (move.mode.auto.act == true)
						move.type.roll.dist = move.type.roll.distMax;
				}
				_move_dist = move.type.roll.dist;
				_move_precise = move.type.roll.precise;
			}
			
			
			while (_move_dist > 0)
			{
				var _move_tgtX = fn_actor_xAhead(id, x, dir_curr, _move_dist);
				var _move_tgtY = fn_actor_yAhead(id, y, dir_curr, _move_dist);
				var _move_tgtObj = instance_place(_move_tgtX, _move_tgtY, obj_prop_parent);
				
				if ((_move_tgtObj == noone) || (_move_tgtObj != noone && _move_tgtObj.solid == false)) && ((move.chain.act == false) || (move.chain.act == true && abs(xstart - _move_tgtX) < move.chain.dist && abs(ystart - _move_tgtY) < move.chain.dist))
				{
					move.stg = 0;
					move.amt = (clamp(move.amt, 0, infinity) + 1);
					move.tgtX = _move_tgtX;
					move.tgtY = _move_tgtY;
					move.startX = x;
					move.startY = y;
					
					x = move.tgtX;
					y = move.tgtY;
					
					if (global.dbg_act == true && global.dbg_excessLog == true)
						fn_log($"x = {x} | y = {y} | self_x = {myself.x} | self_y = {myself.y} | depth = {depth}");
					break;
				}
				else
				{
					if (_move_precise == false)
					{
						move.amt = -1;
						break;
					}
					else
					{
						_move_dist -= 0.5;
						if (_move_dist > 0)
						{
							continue;
						}
						else
						{
							move.amt = -1;
							break;
						}
					}
				}
			}
		}
	}
	else if (move.stg == -1 && move.wait.act == true && move.wait.durCurr > 0)
		move.wait.durCurr -= 1;
	
	
	// Moving (movement sequence is active)
	if (move.stg == 0)
	{
		if (move.type.walk.act == true)
		{
			myself.x += ((move.tgtX - move.startX) / move.type.walk.dur);
			myself.y += ((move.tgtY - move.startY) / move.type.walk.dur);
			
			
			// Walking animation
			if (move.type.walk.fstep.act == true)
			{
				var _fstep_amt = clamp( (round(16 / move.type.walk.dur) + 1), 2, infinity );
				if (move.type.walk.fstep.amtCurr < _fstep_amt)
				{
					if (move.type.walk.fstep.wait_durCurr <= 0)
					{
						image_index += 1;
						if (image_index % 2 == 1 && move.type.walk.fstep.snd_asset != -1 && move.type.walk.fstep.snd_style != -1)
							fn_aud_play(move.type.walk.fstep.snd_asset, move.type.walk.fstep.snd_style);
						
						move.type.walk.fstep.amtCurr += 1;
						move.type.walk.fstep.wait_durCurr = floor(move.type.walk.dur / _fstep_amt);
					}
					else
						move.type.walk.fstep.wait_durCurr -= 1;
				}
			}
			
			
			move.type.walk.durCurr += 1;
			if (move.type.walk.durCurr >= move.type.walk.dur)
			{
				myself.x = x;
				myself.y = y;
				
				move.stg = -1;
				move.type.walk.durCurr = 0;
				
				
				// Walking animation
				if (move.type.walk.fstep.act == true)
				{
					if (image_index % 2 == 1)
						image_index += 1;
					move.type.walk.fstep.amtCurr = 0;
					move.type.walk.fstep.wait_durCurr = 0;
				}
			}
		}
		else if (move.type.roll.act == true)
		{
			myself.x = move.tgtX;
			myself.y = move.tgtY;
			
			move.stg = -1;
			if (move.mode.manual.act == true)
			{
				if (move.mode.manual.held == true)
					move.type.roll.dist += move.type.roll.distAccel;
				else
					move.type.roll.dist -= move.type.roll.distDecel;
				move.type.roll.dist = clamp(move.type.roll.dist, move.type.roll.distMin, move.type.roll.distMax);
			}
		}
		
		depth = -myself.y;
	}
}

sprite_index = dir[dir_curr].spr;
