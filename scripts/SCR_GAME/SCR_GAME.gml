
function FN_GAME_SETUP()
{
	randomize();
	
	window_set_size(640, 480);
	window_set_color(c_black);
	window_set_caption("");
	window_set_showborder(true);
	if (os_type == os_windows)
		window_enable_borderless_fullscreen(true);
	window_center();
	
	surface_resize(application_surface, 640, 480);
	
	display_reset(0, false);
	display_set_gui_size(320, 240);
	
	
	global.GAME_VER = "0.03";
	
	global.GAME_FNT = font_add_sprite_ext(SPR_GAME_FNT, "aáàâãbcçdeéèêfghiíìîjklmnoóòôõpqrstuúùûvwxyzAÁÀÂÃBCÇ₢DEÉÈÊFGHIÍÌÎJKLMNOÓÒÔÕPQRS$TUÚÙÛVWXYZ' ,.?!:;\"&1234567890%()[]/_-—<>←→↑↓", false, -1);
	global.GAME_FNT_H = fn_text_h("Salenis");
	
	
	fn_config_setup_0();
	fn_config_setup_1();
	
	fn_profile_setup();
	
	
	fn_obj_create(obj_rmCtrl);
	fn_obj_create(obj_dbg);
	var _rmStart = temp_rm_menu_home;
	if (global.dbg_act == true && global.dbg_actRm != -1)
		_rmStart = global.dbg_actRm;
	room_goto(_rmStart);
}
