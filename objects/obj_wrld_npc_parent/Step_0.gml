/// @descr movement

if (move_stage == -1) // prepare and start delay
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

if (move_stage == 0) // start movement
{
	for (var i = 0; i < 25; i++)
	{
		if (move_chaseChara == false) // moving normally, get random direction
			fac = irandom_range(FAC_LEFT, FAC_DOWN);
		else if (move_chaseChara == true) // chasing player, get most logical direction
		{
			var _dir = point_direction(x, y, wrld_chara.x, wrld_chara.y);
			if (_dir >= 0 && _dir < 45) || (_dir >= 315 && _dir < 360)
				fac = FAC_RIGHT;
			else if (_dir >= 45 && _dir < 135)
				fac = FAC_UP;
			else if (_dir >= 135 && _dir < 225)
				fac = FAC_LEFT;
			else if (_dir >= 225 && _dir < 315)
				fac = FAC_DOWN;
		}
		
		var _xTgt = (x + (move_spd * move_maxTime * move_spdMul[fac]) * (fac_orient[fac] == FAC_ORIENT_HOR)); // get target position
		var _yTgt = (y + (move_spd * move_maxTime * move_spdMul[fac]) * (fac_orient[fac] == FAC_ORIENT_VER));
		
		if (instance_place(_xTgt, _yTgt, obj_wrld_chara) == noone
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
	
	move_time = 0;
	move_stage = 2;
}
if (move_stage == 2) // movement
{
	draw_x += ((move_spd * move_spdMul[fac]) * (fac_orient[fac] == FAC_ORIENT_HOR)); // move to target position
	draw_y += ((move_spd * move_spdMul[fac]) * (fac_orient[fac] == FAC_ORIENT_VER));
	
	depth = -draw_y;
	
	move_time += 1;
	if (move_time >= move_maxTime)
	{
		draw_x = x;
		draw_y = y;
		move_stage = -1;
	}
}
