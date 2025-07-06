
fn_config_key_quick();


// Toggles fullscreen setting on/off
if (press_fscr == true)
{
	global.config_fscr = !global.config_fscr;
	fn_config_file_save();
}


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


// Toggles autowalk on/off
if (fn_obj_exists(obj_player) == true)
{
	if (press_atwlk == true)
		global.config_atwlk = !global.config_atwlk;
}
