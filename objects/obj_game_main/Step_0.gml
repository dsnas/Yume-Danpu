
fn_key_quick();


// Toggles fullscreen setting on/off
if (key_press_fscr == true)
	global.sett_fscr = !global.sett_fscr;

// Toggles autowalk on/off
if (key_press_atwlk == true)
	global.player_atwlk = !global.player_atwlk;


// Toggles fullscreen mode with a delay to avoid issues
if (fscr_delay <= 0)
{
	if (fscr != global.sett_fscr)
	{
		fscr = global.sett_fscr;
		fscr_delay = fscr_delayMax;
		window_set_fullscreen(global.sett_fscr);
	}
}
else
	fscr_delay -= 1;
