/// @descr [step]

var l = lvl;


if (lvlTrans_act == false)
{
	if (lvl == LVL_LANG) // [main lvl] opt move
		event_user(5); // [opt move] dflt/normal
	
	if (fn_inp("press", SETT_INP.SLCT) == true) // (checks for the player's selection input) (selects the option)
	{
		fn_aud_play(global.thm_snd_optSlct[global.chara_thm], SETT_VOL.MENU);
	}
	
	if (fn_inp("press", SETT_INP.CNCL) == true || fn_inp("press", SETT_INP.MENU_PSE) == true) // (checks for the player's cancel or pause input) (resumes the game)
	{
		fn_aud_play(global.thm_snd_optCncl[global.chara_thm], SETT_VOL.MENU);
	}
}
