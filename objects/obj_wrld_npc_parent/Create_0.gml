/// @descr start NPC

event_inherited();
image_alpha = 1;
int_isNpc = true;



draw_x = x; // draw self
draw_y = y;
draw_xSc = 1;
draw_ySc = 1;
draw_ang = 0;



FAC_LEFT = 0; // fac (facing)
FAC_RIGHT = 1;
FAC_UP = 2;
FAC_DOWN = 3;
fac = irandom_range(FAC_LEFT, FAC_DOWN);

fac_spr[FAC_LEFT]	= -1;
fac_spr[FAC_RIGHT]	= -1;
fac_spr[FAC_UP]		= -1;
fac_spr[FAC_DOWN]	= -1;

FAC_ORIENT_HOR = 0;
FAC_ORIENT_VER = 1;
fac_orient[FAC_LEFT]	= FAC_ORIENT_HOR;
fac_orient[FAC_RIGHT]	= FAC_ORIENT_HOR;
fac_orient[FAC_UP]		= FAC_ORIENT_VER;
fac_orient[FAC_DOWN]	= FAC_ORIENT_VER;



move_stage = -1; // move (movement)
move_delay = 0;
move_minDelay = 30;
move_maxDelay = 180;
move_delayed = true;

move_spd = 0.5;
move_time = 0;
move_maxTime = 32;
move_spdMul[FAC_LEFT]	= -1;
move_spdMul[FAC_RIGHT]	= 1;
move_spdMul[FAC_UP]		= -1;
move_spdMul[FAC_DOWN]	= 1;
move_maxDist = 48;
move_xTgt = 0;
move_yTgt = 0;

move_chaseChara = false;

/* move_stage
	-2	=	frozen, can't move due to idk;
	-1	=	idle;
	0+	=	movement;
*/



int_snd_amt = 10; // int (interaction)
for (var i = 0; i < int_snd_amt; i++)
{
	int_snd[i] = -1;
	int_snd_gainLvl[i] = 1;
}
int_snd_pos = -1;



dbg = true;



event_user(0);
sprite_index = fac_spr[fac];
depth = -bbox_bottom;

// HUA-LATUCA-PAYA!!!! HO-POPAPO-TUYA!!!!!!! AAAAAAAAAAAAAARRRRRRRGHHHHHHH!!!!!!!!!!!
