
fn_import();



fn_wrld_chara_fac();
fac = FAC_DOWN;



depth = -bbox_bottom;
sprite_index = fac_spr[fac];
image_speed = 0;
image_index = 0;



move_stage = -1;
/*
	-2 = can't move due to event/cutscene;
	-1 = idle;
	 0 = moving;
*/

move_spd = 1;
move_time = 0;
move_timeMax = 16;



cam = view_camera[0];
cam_act = true;
cam_clamp = false;
cam_x = 0;
cam_y = 0;
cam_w = 320;
cam_h = 240;











