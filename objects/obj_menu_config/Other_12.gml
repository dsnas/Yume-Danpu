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
