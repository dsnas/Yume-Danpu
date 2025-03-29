/// @descr start NPC

event_inherited();
npc = true;

image_speed = 0;
image_index = 0;
alarm[0] = 1;



FAC_LEFT = 0;
FAC_RIGHT = 1;
FAC_UP = 2;
FAC_DOWN = 3;
fac = FAC_DOWN;

fac_spr[FAC_LEFT]	= spr_wrld_npc;
fac_spr[FAC_RIGHT]	= fac_spr[FAC_LEFT];
fac_spr[FAC_UP]		= fac_spr[FAC_LEFT];
fac_spr[FAC_DOWN]	= fac_spr[FAC_LEFT];

fac_spdMul[FAC_LEFT]	= -1;
fac_spdMul[FAC_RIGHT]	= 1;
fac_spdMul[FAC_UP]		= -1;
fac_spdMul[FAC_DOWN]	= 1;

FAC_ORIENT_HOR = 0;
FAC_ORIENT_VER = 1;

fac_orient[FAC_LEFT]	= FAC_ORIENT_HOR;
fac_orient[FAC_RIGHT]	= FAC_ORIENT_HOR;
fac_orient[FAC_UP]		= FAC_ORIENT_VER;
fac_orient[FAC_DOWN]	= FAC_ORIENT_VER;



move_stage = -1; /*
	-2	=	frozen, can't move due to idk;
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
move_maxDist = 48;

move_spd = 0.5;
move_time = 0;
move_maxTime = 32;

move_chaseChara = false;
