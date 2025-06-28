
fn_menu_evStep_0();


// Inactive level transition sequence
if (lvlTrans_stg == -1 && lvl != LVL_EMPTY) // Also checks if the current level is valid
{
	fn_config_key_quick();
	
	
	fn_menu_evStep_1();
	
	
	// Option movement, selection and cancellation
	if (opt_amt[lvl] > 0)
	{
		// Option movement
		if (opt_move_act[lvl] == true)
		{
			var _opt_move_posOld = opt_move_pos[lvl];
			
			fn_menu_opt_move(); // Retrieves the option movement sequence determined by the menu's ID
			
			if (_opt_move_posOld != opt_move_pos[lvl])
				fn_aud_play(opt_move_snd[lvl], CONFIG_VOLTYPE.MENU);
		}
		
		
		// Option selection
		if (opt_slct_act[lvl] == true && press_slct == true)
		{
			_opt_slct_snd = -1;
			
			fn_menu_opt_slct(); // Retrieves the option selection sequence determined by the menu's ID
			
			if (_opt_slct_snd == -1 && (lvlTrans_stg > -1 || fn_obj_exists(obj_rmTrans) == true))
				_opt_slct_snd = opt_slct_sndDflt[lvl]
			if (_opt_slct_snd != -1)
				fn_aud_play(_opt_slct_snd, CONFIG_VOLTYPE.MENU);
		}
		
		
		// Option cancellation
		for (var k = 0; k < (array_length(opt_cncl_key[lvl]) * opt_cncl_act[lvl]); k++) // Loops through each key the player can press to cancel an option
		{
			if (fn_config_key_press(opt_cncl_key[lvl, k]) == true)
			{
				_opt_cncl_snd = -1;
				
				fn_menu_opt_cncl(); // Retrieves the option cancellation sequence determined by the menu's ID
				
				if (_opt_cncl_snd == -1 && (lvlTrans_stg > -1 || fn_obj_exists(obj_rmTrans) == true))
					_opt_cncl_snd = opt_cncl_sndDflt[lvl]
				if (_opt_cncl_snd != -1)
					fn_aud_play(_opt_cncl_snd, CONFIG_VOLTYPE.MENU);
			}
		}
	}
}


// Active level transition sequence
else if (lvlTrans_stg == 0)
{
	if (lvlTrans_preDelay <= 0) // Checks if the pre-sequence delay is inactive
	{
		// Changes the alpha of the current level
		lvl_alp[lvl] = fn_lerp(lvl_alp[lvl], 0, lvlTrans_spd);
		
		
		if (lvlTrans_postDelay <= 0) // Checks if the post-sequence delay is inactive
		{
			// Changes the alpha of the target level
			lvl_alp[lvlTrans_tgt] = fn_lerp(lvl_alp[lvlTrans_tgt], 1, lvlTrans_spd);
			
			
			var _alpSlack = 0.05;
			if (lvl_alp[lvl] <= _alpSlack && lvl_alp[lvlTrans_tgt] >= (1 - _alpSlack)) // Checks if the alpha of both levels equal their respective values
			{
				lvl_alp[lvl] = 0;
				lvl_alp[lvlTrans_tgt] = 1;
				lvl = lvlTrans_tgt;
				lvlTrans_stg = -1;
				
				if (lvlTrans_selfDstr == true)
					fn_obj_destroy();
				if (lvlTrans_gameEnd == true)
					game_end();
				
				opt_move_act[lvl] = true;
				opt_slct_act[lvl] = true;
				opt_cncl_act[lvl] = true;
			}
		}
		else
			lvlTrans_postDelay -= 1;
	}
	else
		lvlTrans_preDelay -= 1;
}
