
event_inherited();
isNpc = true;



image_speed = 0;
image_index = 0;

event_user(0);
fac = FAC_DOWN;

move_stage = -1; /*
	-2	=	can't move due to i don't know;
	-1	=	idle;
	0+	=	movement;
*/
move_delay = 0;
move_minDelay = 30;
move_maxDelay = 180;
move_delayed = true;

move_xStart = 0;
move_yStart = 0;
move_xTarget = 0;
move_yTarget = 0;
move_maxDist = 64;

move_spd = 0.5;
move_time = 0;
move_maxTime = 32;

move_chaseChara = false;



if (wrld == rm_wrld_debug) // debug
{
	if (x == 240 && y == 112)
	{
		move_delayed = false;
		move_maxDist = 99999999999999999999;
		move_spd = 0.5;
		move_time = 0;
		move_maxTime = 32;
		move_chaseChara = true;
		image_index = 1;
	}
}



depth = -bbox_bottom;



// these programming moments usually are pretty lonely but the great and only Kitboga is always here to fill my mind
