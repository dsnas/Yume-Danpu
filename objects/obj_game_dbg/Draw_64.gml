
if (string_ends_with(keyboard_string, "hunter2") == true) // toggle debug mode on/off
{
	global.dbg = !global.dbg;
	keyboard_string = "";
}

if (global.dbg == true)
{
	if (keyboard_check_pressed(ord("E")) == 1) // (chara) zoom in
		show_debug_overlay(!is_debug_overlay_open());
	
	if (keyboard_check(ord("I")) == 1) // (chara) zoom in
	{
		if (fn_exists(wrld_chara) == true)
		{
			wrld_chara.cam_w -= 8;
			wrld_chara.cam_h -= 6;
		}
	}
	
	else if (keyboard_check(ord("O")) == 1) // (chara) zoom out
	{
		if (fn_exists(wrld_chara) == true)
		{
			wrld_chara.cam_w += 8;
			wrld_chara.cam_h += 6;
		}
	}
	
	if (keyboard_check_pressed(ord("R")) == 1) // restart game
		game_restart();
	
	
	
	if (fntTest == true)
		fn_draw_txt(fntTest_txt, 8, 8 + 4, 0.5, 0.5, 0, c_white, c_white, c_white, c_white, 1);
}
