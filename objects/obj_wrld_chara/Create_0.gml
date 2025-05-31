
image_speed = 0;
image_index = 0;
image_alpha = 1;

fn_import();




draw_x = x; // (self-drawing info)
draw_y = y;
draw_xSc = 1;
draw_ySc = 1;
draw_ang = 0;


MOVE_RT = 0; // (right)			// (directions)
MOVE_LT = 1; // (left)
MOVE_UP = 2; // (up)
MOVE_DN = 3; // (down)
MOVE_HOR = 0; // (horizontal)	// (axes)
MOVE_VER = 1; // (vertical)
move_fac = MOVE_DN; // (direction the player is currently facing)

move_inp[MOVE_RT] = 0;
move_spr[MOVE_RT] = spr_wrld_chara_rt;
move_axis[MOVE_RT] = MOVE_HOR;
move_spdMul[MOVE_RT] = 1;

move_inp[MOVE_LT] = 0;
move_spr[MOVE_LT] = spr_wrld_chara_lt;
move_axis[MOVE_LT] = MOVE_HOR;
move_spdMul[MOVE_LT] = -1;

move_inp[MOVE_UP] = 0;
move_spr[MOVE_UP] = spr_wrld_chara_up;
move_axis[MOVE_UP] = MOVE_VER;
move_spdMul[MOVE_UP] = -1;

move_inp[MOVE_DN] = 0;
move_spr[MOVE_DN] = spr_wrld_chara_dn;
move_axis[MOVE_DN] = MOVE_VER;
move_spdMul[MOVE_DN] = 1;

sprite_index = move_spr[MOVE_DN];
depth = -bbox_bottom;


move_stg = -1; /* (movement stage)
 -2 = frozen, can't move due to event/menu;
 -1 = idle, can start movement and open inventory menu;
  0 = moving, can't open inventory menu;
*/

move_spd = 1;
move_dur = 0;
move_durMax = 16;
move_xTgt = 0;
move_yTgt = 0;


cam_id = view_camera[0]; // cam (camera info)
cam_act = true;
cam_x = 0;
cam_y = 0;
cam_w = 320;
cam_h = 240;
cam_clamp = false;




// dear diary, i've had one of those bad dreams again
