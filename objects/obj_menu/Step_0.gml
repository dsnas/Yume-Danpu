
fn_key_quick();


fn_menu_evStep();


// Option movement, selection and cancellation
if (lvl >= 0 && lvl <= (lvl_amtMax - 1) && lvlTrans_stg == -1) // Checks if the current level is valid and if the transition sequence is inactive
{
	// Option movement
	fn_menu_opt_move();
		
	// Option selection
	fn_menu_opt_slct();
}


// Transition sequence between levels
if (lvlTrans_stg == 0) // Checks if the transition sequence is active
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
		
		if (lvlTrans_rmTgt != -1)
			room_goto(lvlTrans_rmTgt)
	}
}

















