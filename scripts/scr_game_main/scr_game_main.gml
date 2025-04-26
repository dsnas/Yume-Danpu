
function fn_game_main_create() // create event
{
	randomize();
	window_center();
	display_set_gui_size(320, 240);
	
	var _caption = "Yume Danpu";
	var i = irandom_range(1, 100);
	if (i <= 5)
		_caption = choose("Yume Danpy", "Yume Dapnu");
	window_set_caption(_caption);
	
	
	fn_sett_start();
	
	fn_create(inp, 0, 0);
	fn_create(dbg, 0, 0);
}


/* gonna do this later, it'll take a really long time	
	global.fnt_main = font_add_sprite_ext(spr_fnt_main, "", 0, -2);
	global.fnt_main = font_add_sprite_ext(spr_font_main, "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNMçÇáàâãéèêíìîóòôõúùûÁÀÂÃÉÈÊÍÌÎÓÒÔÕÚÙÛ1234567890 -.,'!?%<>()[]/←→↑↓", 0, -2);
*/
