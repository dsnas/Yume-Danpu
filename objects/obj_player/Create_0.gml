
image_speed = 0;
image_index = 0;
image_alpha = 1;
view_enabled = true;
view_visible[0] = true;


fn_chara_start();
move_dir_spr[MOVE_DIR_LT] = spr_player_lt;
move_dir_spr[MOVE_DIR_RT] = spr_player_rt;
move_dir_spr[MOVE_DIR_UP] = spr_player_up;
move_dir_spr[MOVE_DIR_DN] = spr_player_dn;
move_atwlk_lastDirKey = -1;


// Opening and closing menus
menu_id[0] = "inv";
menu_key_idx[0] = KEY_IDX.MENU_INV;

menu_id[1] = "pse";
menu_key_idx[1] = KEY_IDX.MENU_PSE;


// Camera movement
cam_act = true;
cam_id = view_camera[0];
cam_x = 0;
cam_y = 0;
cam_w = 320;
cam_h = 240;
cam_clamp = false;




// dear diary, i've had one of those bad dreams again
