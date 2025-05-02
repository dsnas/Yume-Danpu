
image_speed = 0;
image_index = 0;
image_alpha = 1;

fn_import();



draw_x = x;
draw_y = y;
draw_xSc = 1;
draw_ySc = 1;
draw_ang = 0;



FAC_LEFT = 0; // fac (facing)
FAC_RIGHT = 1;
FAC_UP = 2;
FAC_DOWN = 3;
fac = FAC_DOWN;

fac_inp[FAC_LEFT]		= 0;
fac_inp[FAC_RIGHT]		= 0;
fac_inp[FAC_UP]			= 0;
fac_inp[FAC_DOWN]		= 0;

fac_spr[FAC_LEFT]		= spr_wrld_chara_left;
fac_spr[FAC_RIGHT]		= spr_wrld_chara_right;
fac_spr[FAC_UP]			= spr_wrld_chara_up;
fac_spr[FAC_DOWN]		= spr_wrld_chara_down;

FAC_ORIENT_HOR = 0;
FAC_ORIENT_VER = 1;
fac_orient[FAC_LEFT]	= FAC_ORIENT_HOR;
fac_orient[FAC_RIGHT]	= FAC_ORIENT_HOR;
fac_orient[FAC_UP]		= FAC_ORIENT_VER;
fac_orient[FAC_DOWN]	= FAC_ORIENT_VER;

sprite_index = fac_spr[fac];
depth = -bbox_bottom;



move_stage = -1; // move (movement)

move_spd = 1;
move_time = 0;
move_maxTime = 16;
move_spdMul[FAC_LEFT]	= -1;
move_spdMul[FAC_RIGHT]	= 1;
move_spdMul[FAC_UP]		= -1;
move_spdMul[FAC_DOWN]	= 1;
move_xTgt = 0;
move_yTgt = 0;

/* move_stage
	-2	=	frozen, can't move due to event/menu;
	-1	=	idle;
	0	=	movement;
*/



cam = view_camera[0]; // cam (camera)
cam_act = true;
cam_x = 0;
cam_y = 0;
cam_w = 320;
cam_h = 240;
cam_clamp = false;



dbg = true;

fn_create(obj_menu_inv, 0, 0);

// dear diary, i've had one of those bad dreams again
