/// @descr [step]

if (lvlTrans_act == false)
{
	if (lvl == LVL_LANG) // [main lvl] opt move
		fn_menu_opt_move(1); // [opt move] dflt
	
	if (inp_slct == true) // (checks for the player's selection input) (selects the option)
	{
		if (lvl == LVL_LANG)
		{
			fn_menu_lvlTrans(LVL_MAIN);
		}
		
		fn_aud_play(global.thm_snd_optSlct[global.chara_thm], SETT_VOL.MENU);
	}
	
	if (inp_cncl == true) || (fn_inp("press", SETT_INP.MENU_PSE) == true) // (checks for the player's cancel or pause input) (resumes the game)
	{
		fn_aud_play(global.thm_snd_optCncl[global.chara_thm], SETT_VOL.MENU);
	}
}
