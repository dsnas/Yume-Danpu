
//////// Functions related to menu themes


function fn_thm_setup() // Sets up variables for enabling menu themes
{
	enum THM_IDX // Stores the index of each theme in their arrays
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
		
		global.thm_opt_move_snd[_THM_IDX] = snd_menu_opt_move_dflt;
		global.thm_opt_slct_snd[_THM_IDX] = snd_menu_opt_slct_dflt;
		global.thm_opt_cncl_snd[_THM_IDX] = snd_menu_opt_cncl_dflt;
		global.thm_opt_fail_snd[_THM_IDX] = snd_menu_opt_fail_dflt;
		
		global.thm_has[_THM_IDX] = false; // (Determines if the player currently has this theme)
	}
	
	global.thm_cur = THM_IDX.DFLT; // Determines which theme is currently active
	
	
	// Default theme
	fn_thm_add(THM_IDX.DFLT, fn_textData("thm_name_dflt"), fn_textData("thm_desc_dflt"), #949299, #949299, #545359, #545359, #100F11, false, spr_menu_box_dflt, spr_menu_optSlctr_dflt, 0, spr_menu_plyrFrm_madot);
	global.thm_has[THM_IDX.DFLT] = true;
	
	// Madotsuki theme
	fn_thm_add(THM_IDX.MADOT, fn_textData("thm_name_madot"), fn_textData("thm_desc_madot"), #DEB2E7, #9C619C, #7B5184, #420439, #290831, true, spr_menu_box_madot, spr_menu_optSlctr_madot, 0.25, spr_menu_plyrFrm_madot); 
	global.thm_opt_move_snd[THM_IDX.MADOT] = snd_menu_opt_move_madot;
	global.thm_opt_slct_snd[THM_IDX.MADOT] = snd_menu_opt_slct_madot;
	global.thm_opt_cncl_snd[THM_IDX.MADOT] = snd_menu_opt_cncl_madot;
	global.thm_opt_fail_snd[THM_IDX.MADOT] = snd_menu_opt_fail_madot;
	global.thm_has[THM_IDX.MADOT] = true;
}
function fn_thm_add(_THM_IDX, _name, _desc, _col_whiteLight, _col_whiteDark, _col_grayLight, _col_grayDark, _col_black, _shdw_act, _box_spr, _optSlctr_spr, _optSlctr_imgSpd, _plyrFrm_spr)
{
	global.thm_name[_THM_IDX] = _name;
	global.thm_desc[_THM_IDX] = _desc;
	
	global.thm_col[_THM_IDX] =
	{
		whiteLight	: _col_whiteLight,
		whiteDark	: _col_whiteDark,
		grayLight	: _col_grayLight,
		grayDark	: _col_grayDark,
		black		: _col_black
	}
	global.thm_shdw_act[_THM_IDX] = _shdw_act;
	
	global.thm_box_spr[_THM_IDX] = _box_spr;
	
	global.thm_optSlctr_spr[_THM_IDX]		= _optSlctr_spr;
	global.thm_optSlctr_imgSpd[_THM_IDX]	= _optSlctr_imgSpd;
	
	global.thm_plyrFrm_spr[_THM_IDX] = _plyrFrm_spr;
}
