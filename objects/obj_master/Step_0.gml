

if (fscr_delay <= 0) // set fullscreen
{
	if (fscr != global.sett_fscr)
	{
		fscr = global.sett_fscr;
		fscr_delay = fscr_maxDelay;
		window_set_fullscreen(fscr);
	}
}
else
	fscr_delay -= 1;



if (global.debug == true) // debug inputs
{
	if (keyboard_check_pressed(ord("G")) == 1)
		room_goto(rm_wrld_macaco);
	if (keyboard_check_pressed(ord("R")) == 1)
		game_restart();
	
	if (fn_exists(wrld_chara) == true)
	{
		if (keyboard_check(ord("I")) == 1)
		{
			wrld_chara.cam_w -= 8;
			wrld_chara.cam_h -= 6;
		}
		else if (keyboard_check(ord("O")) == 1)
		{
			wrld_chara.cam_w += 8;
			wrld_chara.cam_h += 6;
		}
	}
}
