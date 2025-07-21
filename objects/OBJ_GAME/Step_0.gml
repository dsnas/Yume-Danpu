
fn_key_quick();


// Toggles Fullscreen on/off
if (press_fscr == true)
{
	global.config_fscr = !global.config_fscr;
	fn_config_file_save();
}

// Toggles fullscreen mode with a delay to avoid issues
if (fscr_delay <= 0)
{
	if (fscr_act != global.config_fscr)
	{
		fscr_act = global.config_fscr;
		fscr_delay = fscr_delayMax;
		window_set_fullscreen(global.config_fscr);
	}
}
else
	fscr_delay -= 1;


// Toggles Hide Cursor
if (hideCsr_act != global.config_hideCsr)
{
	hideCsr_act = global.config_hideCsr;
	window_set_cursor(cr_none);
	if (hideCsr_act == false)
		window_set_cursor(cr_default);
}


// Toggles Autowalk on/off
if (fn_obj_exists(obj_player) == true)
{
	if (press_atwlk == true)
		global.config_atwlk = !global.config_atwlk;
}
