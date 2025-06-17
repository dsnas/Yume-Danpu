/// @descr [Step]

opt_inpPse = fn_sett_inp("press", SETT_INP.MENU_PSE);


if (lvlTrans_act == false)
{
	if (opt_canMove == true)
	{
		if (lvl == LVL_MAIN) // [LVL MAIN]
			fn_menu_opt_move(0); // dflt
	}
	
	
	if (opt_canSlct == true && opt_inpSlct == true) // (checks for the player's selection input) (selects the option)
	{
		if (lvl == LVL_MAIN) // [main lvl]
		{
			var _opt_snd = global.thm_snd_optSlct[global.thm_cur];
			
			if (optMove_pos[lvl] == 0) // ("Resume" option)
				fn_menu_pse_resume();
			else if (optMove_pos[lvl] == (opt_amt[lvl] - 1))
				fn_menu_lvlTrans_start(lvl_amtMax, undefined, temp_rm_menu_home);
			else
				_opt_snd = global.thm_snd_optFail[global.thm_cur];
			
			fn_aud_play(_opt_snd, VOL_IDX.MENU);
		}
	}
	else if (opt_canCncl == true && (opt_inpCncl == true || opt_inpPse == true)) // (checks for the player's cancel or pause input) (resumes the game)
	{
		fn_menu_pse_resume(); // resumes the game
		fn_aud_play(global.thm_snd_optCncl[global.thm_cur], VOL_IDX.MENU);
	}
}
