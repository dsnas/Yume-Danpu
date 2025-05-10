/// @descr start NPC

event_inherited();
image_alpha = 1;
int_isNpc = true;



draw_x = x; // draw self
draw_y = y;
draw_xSc = 1;
draw_ySc = 1;
draw_ang = 0;



FAC_LT = 0; // fac (facing)
FAC_RT = 1;
FAC_UP = 2;
FAC_DN = 3;
fac = irandom_range(FAC_LT, FAC_DN);

fac_spr[FAC_LT]	= -1;
fac_spr[FAC_RT]	= -1;
fac_spr[FAC_UP]		= -1;
fac_spr[FAC_DN]	= -1;

FAC_ORIENT_HOR = 0;
FAC_ORIENT_VER = 1;
fac_orient[FAC_LT]	= FAC_ORIENT_HOR;
fac_orient[FAC_RT]	= FAC_ORIENT_HOR;
fac_orient[FAC_UP]		= FAC_ORIENT_VER;
fac_orient[FAC_DN]	= FAC_ORIENT_VER;



move_stage = -1; // move (movement)
move_delay = 0;
move_minDelay = 0;
move_maxDelay = 240;
move_delayed = true;

move_spd = 0.5;
move_time = 0;
move_maxTime = 32;
move_spdMul[FAC_LT]	= -1;
move_spdMul[FAC_RT]	= 1;
move_spdMul[FAC_UP]		= -1;
move_spdMul[FAC_DN]	= 1;
move_distMaxed = true;
move_distMax = 48;
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
	int_snd_time[i] = 0;
}
int_snd_pos = -1;



dbg = true;



event_user(0);
sprite_index = fac_spr[fac];
depth = -bbox_bottom;

// HUA-LATUCA-PAYA!!!! HO-POPAPO-TUYA!!!!!!! AAAAAAAAAAAAAARRRRRRRGHHHHHHH!!!!!!!!!!!
