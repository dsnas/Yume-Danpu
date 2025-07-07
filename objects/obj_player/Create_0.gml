
fn_obj_img(id);
fn_obj_depth();
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
menu_key[0] = CONFIG_KEY.MENU_INV;

menu_id[1] = "pse";
menu_key[1] = CONFIG_KEY.MENU_PSE;

menu_len = array_length(menu_id);

menu_delay_dur = 0;




// dear diary, i've had one of those bad dreams again
