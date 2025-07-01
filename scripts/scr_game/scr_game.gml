
//////// Functions related to the entire game in general


function fn_game_start()
{
	global.GAME_VER = "0.02";
	
	global.GAME_FNT = font_add_sprite_ext(spr_GAME_FNT, "aáàâãbcçdeéèêfghiíìîjklmnoóòôõpqrstuúùûvwxyzAÁÀÂÃBCÇ₢DEÉÈÊFGHIÍÌÎJKLMNOÓÒÔÕPQRS$TUÚÙÛVWXYZ' ,.?!:;\"&1234567890%()[]/_-—<>←→↑↓", false, -1);
	global.GAME_FNT_H = fn_text_h("Salenis");
	
	
	randomize();
	window_center();
	display_set_gui_size(320, 240);
	
	var _caption = "Yume Danpu";
	if (irandom_range(1, 100) <= 5)
		_caption = choose("Danpu Nikki", "Yume Nikki", "Yume Dapnu", "Yume Danpy", "Yume Dangu", "Yume Fanpu", "Dume Yanpu", "Yume Champu", "Yummy Danpu", "Yummy Nicky");
	window_set_caption(_caption);
	
	fn_config_setup();
	
	fn_eff_setup();
	fn_itm_setup();
	fn_thm_setup();
	fn_player_setup();
	
	fn_obj_create(obj_rm);
	fn_obj_create(obj_game_dbg, 0, 0);
	
	
	var _rm = temp_rm_menu_home;
	//_rm = rm_nexus;
	room_goto(_rm);
}
