/// @descr [Step]

if (lvlTrans_act == false)
{
	if (lvl == LVL_LANG) // [LVL LANG] opt move
		fn_menu_opt_move(1); // dflt (horizontal)
	else if (lvl == LVL_MAIN) // [LVL MAIN] opt move
		fn_menu_opt_move(0); // dflt (vertical)
	
	if (inp_slct == true) // (Checks for the player's selection input) (Selects the option)
	{
		if (lvl == LVL_LANG) // [LVL LANG]
		{
			global.flag[0] = true; // (Whether a language was chosen the first time the game started)
			fn_menu_lvlTrans(LVL_MAIN);
		}
		else if (lvl == LVL_MAIN) // [LVL MAIN]
			fn_menu_lvlTrans(lvl_amtMax, undefined, rm_wrld_macaco);
		
		fn_aud_play(global.thm_snd_optSlct[global.thm_cur], SETT_VOL.MENU);
	}
	
	if (inp_cncl == true) || (fn_inp("press", SETT_INP.MENU_PSE) == true) // (Checks for the player's cancel or inventory inputs) (Returns to the previous level, or closes the menu)
	{
		fn_aud_play(global.thm_snd_optCncl[global.thm_cur], SETT_VOL.MENU);
	}
}
