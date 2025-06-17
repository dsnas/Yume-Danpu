/// @descr [Step]

if (lvlTrans_act == false)
{
	if (opt_canMove == true) // (Option movement)
	{
		if (lvl == LVL_MAIN) || (lvl == LVL_VID) // (LVL MAIN, LVL VID)
			fn_menu_opt_move(0); // dflt (Default)
	}
	
	
	if (opt_canSlct == true && opt_inpSlct == true) // (Option selection) (Checks for the player's selection input)
	{
		if (lvl == LVL_MAIN) // [LVL MAIN]
		{
			var _lvlTrans_lvlTgt = -1;
			
			/* (Temporarily unused)
			if (optMove_pos[lvl] == 0) // (Languages)
				_lvlTrans_lvlTgt = LVL_MAIN;
			*/
			if (optMove_pos[lvl] == 1) // (Video Settings)
				_lvlTrans_lvlTgt = LVL_VID;
			else if (optMove_pos[lvl] == 2) // (Audio Settings)
				_lvlTrans_lvlTgt = LVL_AUD;
			else if (optMove_pos[lvl] == 3) // (Controls)
				_lvlTrans_lvlTgt = LVL_INP;
			else if (optMove_pos[lvl] == 4) // (Accessibility)
				_lvlTrans_lvlTgt = LVL_A11Y;
			
			if (_lvlTrans_lvlTgt != -1)
				fn_menu_lvlTrans_start(_lvlTrans_lvlTgt);
		}
		
		fn_aud_play(global.thm_snd_optSlct[global.thm_cur], VOL_IDX.MENU);
	}
	else if (opt_canCncl == true && opt_inpCncl == true) // (Option cancellation) (Checks for the player's cancel input)
	{
		if (lvl == LVL_MAIN) // [LVL MAIN]
		{
			fn_menu_lvlTrans_start(lvl_amtMax, true);
			
			with (obj_menu_home)
			{
				opt_canSlct = true;
				opt_canCncl = true;
				fn_menu_lvlTrans_start(LVL_MAIN);
			}
		}
		
		fn_aud_play(global.thm_snd_optCncl[global.thm_cur], VOL_IDX.MENU);
	}
}




