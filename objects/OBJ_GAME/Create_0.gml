
randomize();


global.game =
{
	ver : "0.03",
		
	wnd_name : "Yume Danpu",
	wnd_w : 640,
	wnd_h : 480,
}
global.game.fnt = font_add_sprite_ext(spr_game_fnt, "aáàâãbcçdeéèêfghiíìîjklmnoóòôõpqrstuúùûvwxyzAÁÀÂÃBCÇ₢DEÉÈÊFGHIÍÌÎJKLMNOÓÒÔÕPQRS$TUÚÙÛVWXYZ' ,.?!:;\"&1234567890%()[]/_-—<>←→↑↓", false, -1);
global.game.fnt_h = fn_text_h("Salenis");


window_set_size(global.game.wnd_w, global.game.wnd_h);
surface_resize(application_surface, global.game.wnd_w, global.game.wnd_h);
display_set_gui_size((global.game.wnd_w / 2), (global.game.wnd_h / 2));
fn_wnd_name("");
window_center();
window_set_color(c_black);
window_set_showborder(true);
if (os_type == os_windows)
	window_enable_borderless_fullscreen(true);
display_reset(0, false);


fn_config_lang_setup();
fn_config_lang_data_setup();
fn_config_setup();

fn_player_setup(false);


fn_obj_create(obj_rmCtrl);
fn_obj_create(obj_dbg);
var _rmStart = temp_rm_menu_home;
if (global.dbg_act == true && global.dbg_actRm != -1)
	_rmStart = global.dbg_actRm;
room_goto(_rmStart);




fn_obj_img( , , , , 0);
fn_obj_depth( , -15000);


// For toggling Fullscreen
fscr_act = -1;
fscr_delay = 0;
fscr_delayMax = 30;


// For toggling Hide Cursor
hideCsr_act = -1;
