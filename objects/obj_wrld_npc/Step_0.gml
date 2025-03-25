
event_user(0);



if (move_stage == -1) // delay to start moving
{
	move_delay = irandom_range(move_minDelay, move_maxDelay);
	move_stage = -0.5;
}
if (move_stage == -0.5)
{
	if (move_delay <= 0)
		move_stage = 0;
	else
		move_delay -= 1;
}
if (move_stage == 0) // start movement
{
	move_xStart = x;
	move_yStart = y;
	move_xTarget = move_xStart;
	move_yTarget = move_yStart;
	
	var i = 0; // so the game doesn't freeze if a position isn't found
	while (i < 25) // get target position and check if it's empty
	{
		fac = irandom_range(FAC_LEFT, FAC_DOWN);
		
		move_xTarget = (x + (move_spd * move_maxTime * fac_spdMul[fac]) * (fac_orient[fac] == FAC_ORIENT_HOR));
		move_yTarget = (y + (move_spd * move_maxTime * fac_spdMul[fac]) * (fac_orient[fac] == FAC_ORIENT_VER));
		
		if (instance_place(move_xTarget, move_yTarget, obj_wrld_chara) == noone
		&&	instance_place(move_xTarget, move_yTarget, obj_wrld_coll_parent) == noone)
		{
			move_stage = 1;
			break;
		}
		else
		{
			i += 1;
			continue;
		}
	}
	
	// can the player share a position with the npc if they move at the same exact moment? yes. does it really matter? nah, the player can just leave.
	// i may fix this eventually, it's not that hard
}
if (move_stage == 1) // movement
{
	var _spd = (move_spd * fac_spdMul[fac]);
	x += (_spd * (fac_orient[fac] == FAC_ORIENT_HOR));
	y += (_spd * (fac_orient[fac] == FAC_ORIENT_VER));
	depth = -bbox_bottom;
	
	move_time += 1;
	if (move_time >= move_maxTime)
	{
		move_stage = -1;
		move_time = 0;
	}
}



if (int_stage == 0)
{
	fn_audio_play(snd_hulapoca, false, VOL_CREATURES, 0.5, 0);
	int_stage = 1;
}
if (int_stage == 1)
{
	if (int_delay >= 30)
	{
		move_stage = -1;
		int_stage = -1;
		int_delay = 0;
		wrld_chara.move_stage = -1;
	}
	else
		int_delay += 1;
}



sprite_index = fac_spr[fac];



// i'd say that i'm doing this for my (boy)wife and children, but i don't have either of those
