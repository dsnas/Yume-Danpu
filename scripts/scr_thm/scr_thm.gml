
//////// Functions related to menu themes


function fn_thm_setup() // Sets up variables for enabling menu themes
{
	enum THM_IDX // Index of each theme in their arrays
	{
		DFLT = 0,	// Default theme
		MADOT = 1	// Madotsuki theme
	}
	
	global.thm_amtMax = global.eff_amtMax;
	for (var _THM_IDX = 0; _THM_IDX < global.thm_amtMax; _THM_IDX++)
	{
		fn_thm_add(_THM_IDX, "%%%", "%%%", c_black, c_black, c_black, c_black, c_black, false, -1, -1, 0, -1); 
		
		global.thm_optSlctr_xDist[_THM_IDX] = 6;
		global.thm_optSlctr_yDist[_THM_IDX] = 4;
		
		global.thm_start_snd[_THM_IDX] = snd_menu_start;
		global.thm_opt_move_snd[_THM_IDX] = snd_menu_opt_move_dflt;
		global.thm_opt_slct_snd[_THM_IDX] = snd_menu_opt_slct_dflt;
		global.thm_opt_cncl_snd[_THM_IDX] = snd_menu_opt_cncl_dflt;
		global.thm_opt_fail_snd[_THM_IDX] = snd_menu_opt_fail_dflt;
		
		global.thm_has[_THM_IDX] = false; // (Determines if the player currently has this theme)
	}
	global.thm_cur = THM_IDX.DFLT; // Determines which theme is currently active
	
	
	// Default theme
	fn_thm_add(THM_IDX.DFLT, fn_getText("thm_name_dflt"), fn_getText("thm_desc_dflt"), #949299, #949299, #545359, #545359, #100F11, false, spr_menu_box_dflt, spr_menu_optSlctr_dflt, 0, spr_menu_plyrFrm_madot);
	global.thm_has[THM_IDX.DFLT] = true;
	
	// Madotsuki theme
	fn_thm_add(THM_IDX.MADOT, fn_getText("thm_name_madot"), fn_getText("thm_desc_madot"), #DEB2E7, #9C619C, #7B5184, #420439, #290831, true, spr_menu_box_madot, spr_menu_optSlctr_madot, 0.25, spr_menu_plyrFrm_madot); 
	global.thm_opt_move_snd[THM_IDX.MADOT] = snd_menu_opt_move_madot;
	global.thm_opt_slct_snd[THM_IDX.MADOT] = snd_menu_opt_slct_madot;
	global.thm_opt_cncl_snd[THM_IDX.MADOT] = snd_menu_opt_cncl_madot;
	global.thm_opt_fail_snd[THM_IDX.MADOT] = snd_menu_opt_fail_madot;
	global.thm_has[THM_IDX.MADOT] = true;
}
function fn_thm_add(_THM_IDX, _name, _desc, _col_whiteLight, _col_whiteDark, _col_grayLight, _col_grayDark, _col_black, _shdw_act, _box_spr, _optSlctr_spr, _optSlctr_imgSpd, _plyrFrm_spr)
{
	var i = _THM_IDX;
	
	global.thm_name[i] = _name;
	global.thm_desc[i] = _desc;
	
	global.thm_col[i] =
	{
		whiteLight	: _col_whiteLight,
		whiteDark	: _col_whiteDark,
		grayLight	: _col_grayLight,
		grayDark	: _col_grayDark,
		black		: _col_black
	}
	global.thm_shdw_act[i] = _shdw_act;
	
	global.thm_box_spr[i] = _box_spr;
	
	global.thm_optSlctr_spr[i]		= _optSlctr_spr;
	global.thm_optSlctr_imgSpd[i]	= _optSlctr_imgSpd;
	
	global.thm_plyrFrm_spr[i] = _plyrFrm_spr;
}
