
if (destroy_stg == 0)
{
	fn_audio_play(snd_menu_opt_cncl, false, SETT_VOL_MENU, 1, 0);
	
	trans_stg = 0;
	destroy_stg = 1;
}

if (trans_stg == 0) // fade-out trans (transition animation)
{
	draw_alp -= trans_alpAmt;
	if (draw_alp <= 0)
	{
		draw_alp = 0;
		trans_stg = 1;
		
		if (destroy_stg == 1)
			fn_destroy(id);
	}
}
else if (trans_stg == 1) // fade-in trans (transition animation)
{
	draw_alp += trans_alpAmt;
	if (draw_alp >= 1)
	{
		draw_alp = 1;
		trans_stg = -1;
	}
}



for (var z = 0; z < lvl_amtMax; z++) // opt alp (option alpha) animation
{
	for (var i = 0; i < opt_amtMax; i++)
	{
		/*
		opt_alp[z, i] = lerp(opt_alp[z, i], 0.5 + (0.5 * (i == opt_pos)), opt_col_slctSpd);
		opt_col_0[z, i] = global.thm_col[global.chara_thm, 0];
		opt_col_1[z, i] = global.thm_col[global.chara_thm, 1];
		*/
		
		
		var _col_0 = opt_col_0[z, i];
		var _col_1 = opt_col_1[z, i];
		
		var _tgtCol_slct = (2 * (i == opt_pos));
		var _tgtCol_0 = global.thm_col[global.chara_thm, (2 - _tgtCol_slct)];
		var _tgtCol_1 = global.thm_col[global.chara_thm, (3 - _tgtCol_slct)];
		
		opt_col_0[z, i] = fn_lerp_col(_col_0, _tgtCol_0, opt_colSpd);
		opt_col_1[z, i] = fn_lerp_col(_col_1, _tgtCol_1, opt_colSpd);
		
	}
}



event_user(1); // (child) step
