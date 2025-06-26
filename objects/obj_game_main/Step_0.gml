
fn_config_key_quick();


// Toggles fullscreen configing on/off
if (press_fscr == true)
{
	global.config_fscr = !global.config_fscr;
	fn_config_file_save();
}

// Toggles autowalk on/off
if (press_atwlk == true)
	global.player_atwlk = !global.player_atwlk;


// Toggles fullscreen mode with a delay to avoid issues
if (fscr_delay <= 0)
{
	if (fscr != global.config_fscr)
	{
		fscr = global.config_fscr;
		fscr_delay = fscr_delayMax;
		window_set_fullscreen(global.config_fscr);
	}
}
else
	fscr_delay -= 1;
