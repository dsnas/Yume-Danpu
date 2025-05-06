/// @descr (child) move

if (move_stage == -1) // starts delay before moving
{
	move_delay = (irandom_range(move_minDelay, move_maxDelay) * move_delayed);
	move_stage = -0.5;
}

if (move_stage == -0.5) // delay
{
	if (move_delay <= 0)
		move_stage = 0;
	else
		move_delay -= 1;
}

if (move_stage == 0) // starts movement sequence
{
	for (var i = 0; i < 25; i++) // attempt movement multiple times before canceling
	{
		if (move_chaseChara == false) // moving normally, get random direction
		{
			fac = irandom_range(FAC_LT, FAC_DN);
		}
		else if (move_chaseChara == true) // chasing player, get most logical direction
		{
			var pd = point_direction(x, y, wrld_chara.x, wrld_chara.y);
			
			if (pd >= 0 && pd < 45) || (pd >= 315 && pd < 360)
				fac = FAC_RT;
			else if (pd >= 45 && pd < 135)
				fac = FAC_UP;
			else if (pd >= 135 && pd < 225)
				fac = FAC_LT;
			else if (pd >= 225 && pd < 315)
				fac = FAC_DN;
		}
		
		var _xTgt = (x + (move_spd * move_maxTime * move_spdMul[fac]) * (fac_orient[fac] == FAC_ORIENT_HOR)); // get target position
		var _yTgt = (y + (move_spd * move_maxTime * move_spdMul[fac]) * (fac_orient[fac] == FAC_ORIENT_VER));
		
		if (instance_place(_xTgt, _yTgt, obj_wrld_chara) == noone // check for collision
		&&  instance_place(_xTgt, _yTgt, obj_wrld_coll_parent) == noone
		&&  abs(xstart - _xTgt) < move_maxDist // make sure the NPC won't go too far from its starting position
		&&  abs(ystart - _yTgt) < move_maxDist)
		{
			move_stage = 1;
			move_xTgt = _xTgt;
			move_yTgt = _yTgt;
			
			break;
		}
		else
			continue;
	}
}

if (move_stage == 1) // prepare for movement
{
	x = move_xTgt;
	y = move_yTgt;
	depth = -move_yTgt;
	
	move_time = 0;
	move_stage = 2;
}

if (move_stage == 2) // move
{
	draw_x += ((move_spd * move_spdMul[fac]) * (fac_orient[fac] == FAC_ORIENT_HOR)); // move to target position
	draw_y += ((move_spd * move_spdMul[fac]) * (fac_orient[fac] == FAC_ORIENT_VER));
	
	move_time += 1;
	if (move_time >= move_maxTime)
	{
		draw_x = x;
		draw_y = y;
		move_stage = -1;
	}
	
	if (distance_to_object(wrld_chara) <= 8)
	{
		fn_dbg("!!!!!!!!!");
		depth = -draw_y;
	}
}

sprite_index = fac_spr[fac];
