/// @descr [step]

var l = lvl;


if (lvlTrans_act == false)
{
	if (lvl == LVL_MAIN) // [main lvl] [opt move] normal
		event_user(5);
	else if (lvl == LVL_EFF) || (lvl == LVL_ITM) || (lvl == LVL_THM) // [eff/itm/thm lvl] opt move → horizontal and vertical
	{
		var _pos_old = opt_pos[l];
		
		if (fn_inp("press", SETT_INP.RT) == true && opt_pos[l] % 2 == 0) // move (horizontal)
			opt_pos[l] += 1;
		else if (fn_inp("press", SETT_INP.LT) == true && opt_pos[l] % 2 == 1)
			opt_pos[l] -= 1;
		
		if (fn_inp("press", SETT_INP.DN) == true && (opt_pos[l] + 2) < (opt_amt[l] - 0)) // move (vertical)
			opt_pos[l] += 2;
		else if (fn_inp("press", SETT_INP.UP) == true && (opt_pos[l] - 2) > -1)
			opt_pos[l] -= 2;
		
		if (_pos_old != opt_pos[l]) // play snd
			fn_aud_play(global.thm_snd_optMove[global.chara_thm], SETT_VOL.MENU);
		
		
		var _lbl_alpTgt = 0; // (change description text, and animate its alpha)
		var _lbl_alpSpd = opt_colSpd;
		if (array_get(ram_invArr[l], opt_pos[l]) == true)
		{
			lbl_txt[l, 1] = array_get(ram_descArr[l], opt_pos[l]);
			if (_pos_old != opt_pos[l])
				lbl_alp[l, 1] = 0.5;
			_lbl_alpTgt = 1;
		}
		lbl_alp[l, 1] = fn_lerp(lbl_alp[l, 1], _lbl_alpTgt, _lbl_alpSpd);
	}
	
	
	if (fn_inp("press", SETT_INP.SLCT) == true) // (checks for the player's selection input) (selects the option)
	{
		var _opt_snd = global.thm_snd_optSlct[global.chara_thm];
		
		if (lvl == LVL_MAIN) // [main lvl]
		{
			lvlTrans_act = true;
			lvlTrans_tgtLvl = (opt_pos[l] + 1);
			lvlTrans_tgtOptPos = 0;
		}
		
		if (lvl == LVL_EFF) || (lvl == LVL_ITM) || (lvl == LVL_THM) // [ram lvl]
		{
			if (array_get(ram_invArr[l], opt_pos[l]) == false)
				_opt_snd = global.thm_snd_optFail[global.chara_thm];
			else
			{
				event_user(0);
				if (lvl == LVL_THM)
				{
					global.chara_thm = opt_pos[l];
					
				}
			}
		}
		
		fn_aud_play(_opt_snd, SETT_VOL.MENU);
	}
	
	if (fn_inp("press", SETT_INP.CNCL) == true || fn_inp("press", SETT_INP.MENU_INV) == true) // (checks for the player's cancel or inventory input) (returns to the previous level, or closes the inventory)
	{
		lvlTrans_act = true;
		
		if (lvl == LVL_MAIN) // [main lvl]
		{
			lvlTrans_tgtLvl = lvl_amtMax;
			lvlTrans_kill = true;
			
			wrld_chara.move_stg = -1;
		}
		
		if (lvl == LVL_EFF) || (lvl == LVL_ITM) || (lvl == LVL_THM) // [ram lvl]
		{
			var _lbl_alpTgt = 0; // (reset description text and alpha)
			if (array_get(ram_invArr[l], opt_pos[l]) == true)
			{
				lbl_txt[l, 1] = array_get(ram_descArr[l], opt_pos[l]);
				_lbl_alpTgt = 1;
			}
			lbl_alp[l, 1] = _lbl_alpTgt;
			
			lvlTrans_tgtLvl = LVL_MAIN;
			lvlTrans_tgtOptPos = 0;
		}
		
		fn_aud_play(global.thm_snd_optCncl[global.chara_thm], SETT_VOL.MENU);
	}
}
