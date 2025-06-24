
opt_inpLt = fn_config_inp("press", config_INP.LT);
opt_inpRt = fn_config_inp("press", config_INP.RT);
opt_inpUp = fn_config_inp("press", config_INP.UP);
opt_inpDn = fn_config_inp("press", config_INP.DN);
opt_inpSlct = fn_config_inp("press", config_INP.SLCT);
opt_inpCncl = fn_config_inp("press", config_INP.CNCL);


if (lvlTrans_act == true) // lvlTrans (Transition sequence between levels) (trans rights, am i right?!!)
{
	lvl_alp[lvl] = fn_lerp(lvl_alp[lvl], 0, lvlTrans_alpSpd);
	lvl_alp[lvlTrans_lvlTgt] = fn_lerp(lvl_alp[lvlTrans_lvlTgt], 1, lvlTrans_alpSpd);
	
	var _slack = 0.05;
	if (lvl_alp[lvl] <= _slack && lvl_alp[lvlTrans_lvlTgt] >= (1 - _slack))
	{
		lvl_alp[lvl] = 0;
		lvl_alp[lvlTrans_lvlTgt] = 1;
		
		if (lvlTrans_menuKill == true)
			fn_obj_dstr(id);
		if (lvlTrans_rmTgt != -1)
			room_goto(lvlTrans_rmTgt);
		if (lvlTrans_gameKill == true)
			game_end();
		
		lvl = lvlTrans_lvlTgt;
		lvlTrans_act = false;
		lvlTrans_lvlTgt = -1;
	}
}




event_user(1); // [Child] [Step]
