/// @descr [step]

if (lvlTrans_act == false)
{
	if (lvl == LVL_MAIN) // [main lvl] opt move
		event_user(5); // [opt move] dflt/normal
	
	if (fn_inp("press", SETT_INP.SLCT) == true) // (checks for the player's selection input) (selects the option)
	{
		if (lvl == LVL_MAIN) // [main lvl]
		{
			var _opt_snd = global.thm_snd_optSlct[global.chara_thm];
			
			if (opt_pos[lvl] == 0) // ("Resume" option)
				fn_menu_pse_resume(); // resumes the game
			else
				_opt_snd = global.thm_snd_optFail[global.chara_thm];
			
			fn_aud_play(_opt_snd, SETT_VOL.MENU);
		}
	}
	
	if (fn_inp("press", SETT_INP.CNCL) == true || fn_inp("press", SETT_INP.MENU_PSE) == true) // (checks for the player's cancel or pause input) (resumes the game)
	{
		fn_menu_pse_resume(); // resumes the game
		fn_aud_play(global.thm_snd_optCncl[global.chara_thm], SETT_VOL.MENU);
	}
}
