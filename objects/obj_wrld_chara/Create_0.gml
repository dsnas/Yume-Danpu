
fn_import();
image_speed = 0;
image_index = 0;

event_user(0);
fac = FAC_DOWN;
sprite_index = fac_spr[fac];
depth = -bbox_bottom;

move_stage = -1; /*
	-2	=	can't move due to event/cutscene/menu;
	-1	=	idle;
	0	=	movement;
*/
move_spd = 1;
move_time = 0;
move_maxTime = 16;

cam = view_camera[0];
cam_act = true;
cam_clamp = false;
cam_x = 0;
cam_y = 0;
cam_w = 320;
cam_h = 240;



// dear diary, i've had one of those bad dreams again
