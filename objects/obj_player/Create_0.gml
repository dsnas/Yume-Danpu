
fn_obj_img(id);
fn_obj_depth();
view_enabled = true;
view_visible[0] = true;


fn_chara_setup_0();
move_preset = "player";
fn_chara_setup_1();


// Opening and closing menus
menu_id[0] = "inv";
menu_key[0] = CONFIG_KEY.MENU_INV;

menu_id[1] = "pse";
menu_key[1] = CONFIG_KEY.MENU_PSE;

menu_len = array_length(menu_id);
menu_dly_dur = 0;




// dear diary, i've had one of those bad dreams again
