/// @descr Option cancel results
// Refer to {lvl[lvl_curr].option_curr} as {_opt_curr}
// Disable the cancellation sound by modifying the variable {_cancel_snd} to -1

if (lvl_curr == LVL_MAIN)
{
	fn_menu_lvl_fader_start(LVL_EMPTY);
	with (obj_menu_home)
		fn_menu_lvl_fader_start(LVL_MAIN);
}
