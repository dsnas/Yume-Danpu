
if (string_ends_with(keyboard_string, "hunter2") == true) // toggle debug mode on/off
{
	global.dbg = !global.dbg;
	keyboard_string = "";
}

if (global.dbg == true)
{
	if (keyboard_check_pressed(ord("E")) == true) // (chara) zoom in
		show_debug_overlay(!is_debug_overlay_open());
	
	if (keyboard_check(ord("I")) == true) // (chara) zoom in
	{
		if (fn_exists(wrld_chara) == true)
		{
			wrld_chara.cam_w -= 8;
			wrld_chara.cam_h -= 6;
		}
	}
	else if (keyboard_check(ord("O")) == true) // (chara) zoom out
	{
		if (fn_exists(wrld_chara) == true)
		{
			wrld_chara.cam_w += 8;
			wrld_chara.cam_h += 6;
		}
	}
	
	if (keyboard_check_pressed(ord("R")) == true) // restart game
		game_restart();
	
	for (var i = 0; i < 3; i++)
	{
		if (keyboard_check_pressed(ord(i)) == true)
			global.chara_thm = i;
	}
}
