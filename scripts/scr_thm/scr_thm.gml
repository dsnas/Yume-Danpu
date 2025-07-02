
//////// Functions related to menu themes


function fn_thm_setup() // Sets up variables for enabling menu themes
{
	global.thm_amtMax = global.eff_amtMax;
	for (var i = 0; i < global.thm_amtMax; i++)
	{
		fn_thm_add(i, c_black, c_black, c_black, c_black, c_black, false, -1, -1, 0, -1); 
		
		global.thm_opt_slctr_xDist[i] = 6;
		global.thm_opt_slctr_yDist[i] = 4;
		global.thm_start_snd[i] = snd_menu_start;
		global.thm_opt_move_snd[i] = snd_menu_opt_move_dflt;
		global.thm_opt_slct_snd[i] = snd_menu_opt_slct_dflt;
		global.thm_opt_cncl_snd[i] = snd_menu_opt_cncl_dflt;
		global.thm_opt_fail_snd[i] = snd_menu_opt_fail_dflt;
		global.thm_has[i] = false; // (Determines if the player currently has this theme)
	}
	
	enum THM // Index of each theme in their arrays
	{
		DFLT = 0,	// Default theme
		MADOT = 1	// Madotsuki theme
	}
	
	
	// Default theme
	fn_thm_add(THM.DFLT, #949299, #949299, #545359, #545359, #100F11, #100F11, false, spr_menu_box_dflt, spr_menu_opt_slctr_dflt, 0, spr_menu_plyrFrm_dflt);
	global.thm_has[THM.DFLT] = true;
	
	
	// Madotsuki theme
	fn_thm_add(THM.MADOT, #DEB2E7, #9C619C, #7B5184, #420439, #290831, c_black, true, spr_menu_box_madot, spr_menu_opt_slctr_madot, 0.1, spr_menu_plyrFrm_madot); 
	global.thm_opt_move_snd[THM.MADOT] = snd_menu_opt_move_madot;
	global.thm_opt_slct_snd[THM.MADOT] = snd_menu_opt_slct_madot;
	global.thm_opt_cncl_snd[THM.MADOT] = snd_menu_opt_cncl_madot;
	global.thm_opt_fail_snd[THM.MADOT] = snd_menu_opt_fail_madot;
	global.thm_has[THM.MADOT] = true;
	
	
	global.thm = THM.DFLT; // Determines which theme is currently active
}
function fn_thm_add(_idx, _col_whiteLight, _col_whiteDark, _col_grayLight, _col_grayDark, _col_blackLight, _col_blackDark, _shdw_act, _box_spr, _opt_slctr_spr, _opt_slctr_imgSpd, _plyrFrm_spr)
{
	var i = _idx;
	
	global.thm_name[i] = fn_getText($"thm_name_{i}");
	global.thm_desc[i] = fn_getText($"thm_desc_{i}");
	
	global.thm_col[i] =
	{
		whiteLight	: _col_whiteLight,
		whiteDark	: _col_whiteDark,
		grayLight	: _col_grayLight,
		grayDark	: _col_grayDark,
		blackLight	: _col_blackLight,
		blackDark	: _col_blackDark
	}
	global.thm_shdw_act[i] = _shdw_act;
	
	global.thm_box_spr[i] = _box_spr;
	
	global.thm_opt_slctr_spr[i]		= _opt_slctr_spr;
	global.thm_opt_slctr_imgSpd[i]	= _opt_slctr_imgSpd;
	
	global.thm_plyrFrm_spr[i] = _plyrFrm_spr;
}
