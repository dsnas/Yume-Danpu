/// @descr [Step]

opt_inpInv = fn_sett_inp("press", SETT_INP.MENU_INV);


if (lvlTrans_act == false)
{
	if (opt_canMove == true)
	{
		if (lvl == LVL_MAIN) // [LVL MAIN] opt move
			fn_menu_opt_move(0); 
		else if (lvl == LVL_LIST_EFF) || (lvl == LVL_LIST_ITM) || (lvl == LVL_LIST_THM) // [LVL LIST] opt move (Option movement)
		{
			fn_menu_opt_move(2); // opt move  →  inv list
		
			lbl_text[lvl, 1] = "%%%";
			if (array_get(list_hasArr[lvl], optMove_pos[lvl]) == true)
				lbl_text[lvl, 1] = array_get(list_descArr[lvl], optMove_pos[lvl]);
		}
	}
	
	
	if (opt_canSlct && opt_inpSlct == true) // (Checks for the player's selection input) (Selects the option)
	{
		var _opt_snd = global.thm_snd_optSlct[global.thm_cur];
		
		
		if (lvl == LVL_MAIN) // [LVL MAIN] (Starts transition to the level of the selected option)
			fn_menu_lvlTrans_start((optMove_pos[lvl] + 1));
		
		
		if (lvl == LVL_LIST_EFF) || (lvl == LVL_LIST_ITM) || (lvl == LVL_LIST_THM) // [LVL LIST] Activates the selected eff/itm/thm
		{
			if (array_get(list_hasArr[lvl], optMove_pos[lvl]) == false)
				_opt_snd = global.thm_snd_optFail[global.thm_cur];
			else
			{
				if (lvl == LVL_LIST_THM)
				{
					global.thm_cur = optMove_pos[lvl];
					event_user(0);
				}
			}
		}
		
		
		fn_aud_play(_opt_snd, VOL_IDX.MENU);
	}
	else if (opt_canCncl == true && (opt_inpCncl == true || opt_inpInv == true)) // (Checks for the player's cancel or inventory inputs) (Returns to the previous level, or closes the menu)
	{
		if (lvl == LVL_MAIN) // [LVL MAIN] Closes the inventory
		{
			fn_menu_lvlTrans_start(lvl_amtMax, true);
			wrld_chara.move_stg = -1;
		}
		
		
		if (lvl == LVL_LIST_EFF) || (lvl == LVL_LIST_ITM) || (lvl == LVL_LIST_THM) // [LVL LIST] Returns to LVL MAIN
			fn_menu_lvlTrans_start(LVL_MAIN);
		
		
		fn_aud_play(global.thm_snd_optCncl[global.thm_cur], VOL_IDX.MENU);
	}
}
