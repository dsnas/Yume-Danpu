/// @descr Option's value cycle result
// Refer to {lvl[lvl_curr].option_curr} as {_opt_curr}
// Refer to the sign of the option's value cycle as {_cycle_sign}

if (lvl_curr == LVL_MAIN && _opt_curr == 0)
{
	var _lang_curr = (global.config.lang_curr + _cycle_sign);
	if (_lang_curr < 0)
		_lang_curr = (array_length(global.config.lang) - 1);
	if (_lang_curr >= array_length(global.config.lang))
		_lang_curr = 0;
	fn_config_lang_mod(_lang_curr);
}
else if (lvl_curr == LVL_VID)
{
	if (_opt_curr == 0)
		global.config.vid.fscr.act = !global.config.vid.fscr.act;
	else if (_opt_curr == 1)
		global.config.vid.vsync.act = !global.config.vid.vsync.act;
	else if (_opt_curr == 2)
		global.config.vid.hideCsr.act = !global.config.vid.hideCsr.act;
	else if (_opt_curr == 3)
		global.config.vid.showVer.act = !global.config.vid.showVer.act;
	else if (_opt_curr == 4)
		global.config.vid.showBdr.act = !global.config.vid.showBdr.act;
	else if (_opt_curr == 5)
		global.config.vid.showFps.act = !global.config.vid.showFps.act;
	
	fn_config_file_save();
}
else if (lvl_curr == LVL_AUD)
{
	
}
else if (lvl_curr == LVL_ACCESS)
{
	
}