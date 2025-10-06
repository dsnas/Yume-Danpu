
// Video
if (fn_config_key_pressed(CONFIG_KEY.FSCR) == true) // Toggles Fullscreen on/off
{
	global.config.vid.fscr.act = !global.config.vid.fscr.act;
	fn_config_file_save();
}
if (fscr_wait <= 0) 
{
	if (fscr_act != global.config.vid.fscr.act)
	{
		window_set_fullscreen(global.config.vid.fscr.act);
		fscr_act = global.config.vid.fscr.act;
		fscr_wait = fscr_waitMax;
	}
}
else
	fscr_wait -= 1

if (vsync_act != global.config.vid.vsync.act) // Toggles Vsync on/off
{
	display_reset(0, global.config.vid.vsync.act)
	vsync_act = global.config.vid.vsync.act;
}

if (showCsr_act != global.config.vid.showCsr.act) // Toggles Show Cursor on/off
{
	window_set_cursor(cr_default);
	if (showCsr_act == false)
		window_set_cursor(cr_none);
	showCsr_act = global.config.vid.showCsr.act;
}


