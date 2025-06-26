
// Option movement, selection and cancellation
if (lvl >= 0 && lvl <= (lvl_amtMax - 1) && lvlTrans_stg == -1) // Checks if the current level is valid
{
	fn_config_key_quick();
	
	
	fn_menu_evStep();
	
	
	// Option movement
	fn_menu_opt_move();
	
	// Option selection
	fn_menu_opt_slct();

	// Option cancellation
	fn_menu_opt_cncl();
	
}


// Transition sequence between levels
if (lvlTrans_stg == 0)
{
	// Checks if the pre-sequence delay is inactive
	if (lvlTrans_preDelay <= 0)
	{
		// Changes the alpha of the current level
		lvl_alp[lvl] = fn_lerp(lvl_alp[lvl], 0, lvlTrans_spd);
		
		
		// Checks if the post-sequence delay is inactive
		if (lvlTrans_postDelay <= 0)
		{
			// Changes the alpha of the target level
			lvl_alp[lvlTrans_tgt] = fn_lerp(lvl_alp[lvlTrans_tgt], 1, lvlTrans_spd);
			
			
			// Checks if the alpha of both levels equal their respective values
			var _alpSlack = 0.05;
			if (lvl_alp[lvl] <= _alpSlack && lvl_alp[lvlTrans_tgt] >= (1 - _alpSlack))
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

/*
if (lvlTrans_stg == 0 && lvlTrans_rmTgt == -1) // Checks if the transition sequence is active
{
	if (lvlTrans_lvl_delay <= 0)
		lvl_alp[lvl] = fn_lerp(lvl_alp[lvl], 0, lvlTrans_alpSpd);
	else
		lvlTrans_lvl_delay -= 1;
	
	
	if (lvlTrans_lvlTgt_delay <= 0)
		lvl_alp[lvlTrans_lvlTgt] = fn_lerp(lvl_alp[lvlTrans_lvlTgt], 1, lvlTrans_alpSpd);
	else
		lvlTrans_lvlTgt_delay -= 1;
	
	
	var _slack = 0.05;
	if (lvl_alp[lvl] <= _slack && lvl_alp[lvlTrans_lvlTgt] >= (1 - _slack))
	{
		lvl_alp[lvl] = 0;
		lvl_alp[lvlTrans_lvlTgt] = 1;
			
		lvl = lvlTrans_lvlTgt;
		lvlTrans_stg = -1;
		lvlTrans_lvlTgt = -1;
		
		if (lvlTrans_killMe == true)
			fn_obj_destroy();
		
		if (lvlTrans_endGame == true)
			game_end();
		
		lvlTrans_killMe = false;
		lvlTrans_rmTgt = -1;
		lvlTrans_endGame = false;
	}
}
*/
















