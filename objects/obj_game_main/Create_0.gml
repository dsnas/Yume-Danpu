
global.GAME_VER = "0.02";
global.GAME_FNT = font_add_sprite_ext(spr_GAME_FNT, "aáàâãbcçdeéèêfghiíìîjklmnoóòôõpqrstuúùûvwxyzAÁÀÂÃBCÇ₢DEÉÈÊFGHIÍÌÎJKLMNOÓÒÔÕPQRS$TUÚÙÛVWXYZ' ,.?!:;\"&1234567890%()[]/_-—<>←→↑↓", false, -1);
global.GAME_FNT_H = fn_text_h("Salenis");


randomize();
window_center();
display_set_gui_size(320, 240);	
fn_wnd_caption("");


fn_config_setup();

fn_eff_setup();
fn_itm_setup();
fn_thm_setup();
fn_player_setup();

fn_obj_create(obj_rm);
fn_obj_create(obj_dbg, 0, 0);


var _rmStart = temp_rm_menu_home;
if (global.dbg_act == true && global.dbg_actRm != -1)
	_rmStart = global.dbg_actRm;
room_goto(_rmStart);




fn_obj_img( , , , , 0);
fn_obj_depth( , -15000);


// For toggling fullscreen
fscr = -1;
fscr_delay = 0;
fscr_delayMax = 30;
