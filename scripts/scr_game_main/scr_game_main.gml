
function fn_game_main_create()
{
	randomize();
	window_center();
	display_set_gui_size(320, 240);
	window_set_caption("Yume Danpu");
	
	
	
	fn_sett_start(); // start sett (settings)
	fn_txtdata_start(); // start txtdata of the selected lang
	
	fn_chara_start(); // start chara info
	fn_thm_start();
	
	global.fnt_main = font_add_sprite_ext(spr_fnt_main, "aáàâãbcçdeéèêfghiíìîjklmnoóòôõpqrstuúùûvwxyzAÁÀÂÃBCÇ₢DEÉÈÊFGHIÍÌÎJKLMNOÓÒÔÕPQRSTUÚÙÛVWXYZ' ,.?!:;\"1234567890%()[]/_-<>←→↑↓", false, -2);
	
	
	
	fn_create(obj_game_dbg, 0, 0);
}



	/* disabled until i make the save file system
	var _caption = "Yume Danpu";
	var i = irandom_range(1, 100);
	if (i <= 5)
		_caption = choose("Yume Dapnu", "Yume Danpy", "Yume Dangu", "Yume Fanpu", "Dume Yanpu");
	window_set_caption(_caption);
	*/
