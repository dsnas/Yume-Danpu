/// @descr Option confirm results
// Refer to {lvl[lvl_curr].option_curr} as {_opt_curr}
// Disable the confirmation sound by modifying the variable {_confirm_snd} to -1

// Main level
if (lvl_curr == LVL_MAIN)
{
	switch (_opt_curr)
	{
		// Language
		case 0:
			_confirm_snd = -1;
			break;
		
		// Graphics
		case 1:
			fn_menu_lvl_fader_start(LVL_VID);
			break;
		
		// Music & Sounds
		case 2:
			fn_menu_lvl_fader_start(LVL_AUD);
			break;
		
		case 3:
			fn_menu_lvl_fader_start(LVL_ACCESS);
			break;
	}
}
