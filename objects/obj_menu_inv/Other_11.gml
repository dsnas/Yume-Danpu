/// @descr step

var l = lvl;


if (lvlTrans_act == false)
{
	if (lvl == LVL_MAIN) // opt move  →  normal
		event_user(5);
	else if (lvl == LVL_EFF) // opt move  →  eff, itm and thm
	{
		var _pos_old = opt_pos[l];
		
		if (fn_inp("press", SETT_INP_RT) == true && opt_pos[l] % 2 == 0) // move (horizontal)
			opt_pos[l] += 1;
		else if (fn_inp("press", SETT_INP_LT) == true && opt_pos[l] % 2 == 1)
			opt_pos[l] -= 1;
		
		if (fn_inp("press", SETT_INP_DN) == true && (opt_pos[l] + 2) < (opt_amt[l] - 0)) // move (vertical)
			opt_pos[l] += 2;
		else if (fn_inp("press", SETT_INP_UP) == true && (opt_pos[l] - 2) > -1)
			opt_pos[l] -= 2;
		
		if (_pos_old != opt_pos[l]) // play snd
			fn_audio_play(global.thm_optMove_snd[global.chara_thm], false, SETT_VOL_MENU, 1, 0);
		
		
		event_user(10); // (eff lvl) desc
	}
	
	
	if (fn_inp("press", SETT_INP_SLCT) == true) // opt slct
	{
		var _opt_snd = global.thm_optSlct_snd[global.chara_thm];
		
		lvlTrans_tgtOptPos = 0;
		if (lvl == LVL_MAIN)
		{
			lvlTrans_act = true;
			lvlTrans_tgtLvl = LVL_EFF;
		}
		//if (lvl == LVL_EFF && opt_txt[l, opt_pos] == opt_txt_emptySlot)
		//	_opt_snd = global.thm_optFail_snd[global.chara_thm]
		
		fn_audio_play(_opt_snd, false, SETT_VOL_MENU, 1, 0);
	}
	
	if (fn_inp("press", SETT_INP_CNCL) == true || fn_inp("press", SETT_INP_MENU_INV))
	{
		var _opt_snd = global.thm_optCncl_snd[global.chara_thm]
		
		lvlTrans_act = true;
		if (lvl == LVL_MAIN)
		{
			lvlTrans_tgtLvl = lvl_amtMax;
			lvlTrans_kill = true;
			wrld_chara.move_stage = -1;
		}
		if (lvl == LVL_EFF)
		{
			lvlTrans_tgtLvl = LVL_MAIN;
			lvlTrans_tgtOptPos = 0;
		}
		
		fn_audio_play(_opt_snd, false, SETT_VOL_MENU, 1, 0);
	}
}










/* (unused) slide-in trans (transition animation)
draw_xTgt = 0;
if (destroy_stg > -1)
	draw_xTgt = -8;
draw_x = lerp(draw_x, draw_xTgt, 0.25);
*/