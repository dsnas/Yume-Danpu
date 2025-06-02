/// @descr [step]

if (lvlTrans_act == false)
{
	if (lvl == LVL_MAIN) // [main lvl] opt move
		fn_menu_opt_move(0); // [opt move] dflt
	else if (lvl == LVL_EFF) || (lvl == LVL_ITM) || (lvl == LVL_THM) // [eff/itm/thm lvl] opt move → horizontal and vertical
	{
		var _pos_old = opt_pos[lvl];
		
		if (inp_lt == true && opt_pos[lvl] % 2 == 0) // (Horizontal option movement)
			opt_pos[lvl] -= 1;
		else if (inp_rt == true && opt_pos[lvl] % 2 == 1)
			opt_pos[lvl] += 1;
		
		if (inp_dn == true && (opt_pos[lvl] + 2) < (opt_amt[lvl] - 0)) // (Vertical option movement)
			opt_pos[lvl] += 2;
		else if (inp_up == true && (opt_pos[lvl] - 2) > -1)
			opt_pos[lvl] -= 2;
		
		if (_pos_old != opt_pos[lvl]) // play snd
			fn_aud_play(global.thm_snd_optMove[global.chara_thm], SETT_VOL.MENU);
		
		
		var _lbl_alpTgt = 0; // (change description text, and animate its alpha)
		var _lbl_alpSpd = opt_colSpd;
		if (array_get(ram_invArr[lvl], opt_pos[lvl]) == true)
		{
			lbl_txt[lvl, 1] = array_get(ram_descArr[lvl], opt_pos[lvl]);
			if (_pos_old != opt_pos[lvl])
				lbl_alp[lvl, 1] = 0.5;
			_lbl_alpTgt = 1;
		}
		lbl_alp[lvl, 1] = fn_lerp(lbl_alp[lvl, 1], _lbl_alpTgt, _lbl_alpSpd);
	}
	
	
	if (inp_slct == true) // (checks for the player's selection input) (selects the option)
	{
		var _opt_snd = global.thm_snd_optSlct[global.chara_thm];
		
		
		if (lvl == LVL_MAIN) // [main lvl]
			fn_menu_lvlTrans((opt_pos[lvl] + 1));
		
		
		if (lvl == LVL_EFF) || (lvl == LVL_ITM) || (lvl == LVL_THM) // [ram lvl]
		{
			if (array_get(ram_invArr[lvl], opt_pos[lvl]) == false)
				_opt_snd = global.thm_snd_optFail[global.chara_thm];
			else
			{
				if (lvl == LVL_THM)
				{
					global.chara_thm = opt_pos[lvl];
					event_user(0);
				}
			}
		}
		
		
		fn_aud_play(_opt_snd, SETT_VOL.MENU);
	}
	
	
	if (inp_cncl == true) || (fn_inp("press", SETT_INP.MENU_INV) == true) // (checks for the player's cancel or inventory input) (returns to the previous level, or closes the inventory)
	{
		if (lvl == LVL_MAIN) // [main lvl]
		{
			fn_menu_lvlTrans(lvl_amtMax, true);
			
			wrld_chara.move_stg = -1;
		}
		
		
		if (lvl == LVL_EFF) || (lvl == LVL_ITM) || (lvl == LVL_THM) // [ram lvl]
		{
			var _lbl_alpTgt = 0; // (reset description text and alpha)
			if (array_get(ram_invArr[lvl], opt_pos[lvl]) == true)
			{
				lbl_txt[lvl, 1] = array_get(ram_descArr[lvl], opt_pos[lvl]);
				_lbl_alpTgt = 1;
			}
			lbl_alp[lvl, 1] = _lbl_alpTgt;
			
			fn_menu_lvlTrans(LVL_MAIN);
		}
		
		
		fn_aud_play(global.thm_snd_optCncl[global.chara_thm], SETT_VOL.MENU);
	}
}
