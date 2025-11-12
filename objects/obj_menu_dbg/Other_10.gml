/// @descr Option confirm results
// Refer to {lvl[lvl_curr].option_curr} as {_opt_curr}
// Disable the confirmation sound by modifying the variable {_confirm_snd} to -1

if (lvl_curr = LVL_MAIN && _opt_curr < 3)
	fn_menu_lvl_fader_start(LVL_OTHER);
