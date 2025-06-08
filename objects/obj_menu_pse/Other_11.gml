/// @descr [step]

if (lvlTrans_act == false)
{
	if (lvl == LVL_MAIN) // [main lvl] opt move
		fn_menu_opt_move(0); // [opt move] dflt
	
	if (inp_slct == true) // (checks for the player's selection input) (selects the option)
	{
		if (lvl == LVL_MAIN) // [main lvl]
		{
			var _opt_snd = global.thm_snd_optSlct[global.thm_cur];
			
			if (opt_pos[lvl] == 0) // ("Resume" option)
				fn_menu_pse_resume();
			else if (opt_pos[lvl] == (opt_amt[lvl] - 1))
				fn_menu_lvlTrans(lvl_amtMax, undefined, temp_rm_menu_home);
			else
				_opt_snd = global.thm_snd_optFail[global.thm_cur];
			
			fn_aud_play(_opt_snd, SETT_VOL.MENU);
		}
	}
	
	if (inp_cncl == true) || (fn_inp("press", SETT_INP.MENU_PSE) == true) // (checks for the player's cancel or pause input) (resumes the game)
	{
		fn_menu_pse_resume(); // resumes the game
		fn_aud_play(global.thm_snd_optCncl[global.thm_cur], SETT_VOL.MENU);
	}
}
