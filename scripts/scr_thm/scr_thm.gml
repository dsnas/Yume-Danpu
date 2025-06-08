
function fn_thm_start() // Start thms (themes)
{
	global.thm_amtMax = global.eff_amtMax;
	for (var t = 0; t < global.thm_amtMax; t++)
	{
		fn_thm_setup_0(t, "%%%", "%%%", c_white, c_white, c_gray, c_gray, c_black, false, spr_menu_wnd_madot, spr_menu_optSlctr_madot, 0, 6, 4); 
		fn_thm_setup_1(t, snd_menu_optMove_dflt, snd_menu_optSlct_dflt, snd_menu_optCncl_dflt, snd_menu_optFail_dflt, spr_menu_chrFrm_madot);
		global.thm_has[t] = false;  // (Determines if the player currently has the theme)
	}
	enum THM
	{
		DFLT = 0, // (Default)
		SMPL = 1, // (Simple)
		MADOT = 2 // (Madotsuki)
	}
	global.thm_cur = THM.DFLT; // (Determines which theme is currently active)
	
	
	/* (Default) */
	fn_thm_setup_0(THM.DFLT, fn_txtdata("thm_name_dflt"), fn_txtdata("thm_desc_dflt"), #949299, #949299, #545359, #545359, #100F11, false, spr_menu_wnd_dflt, spr_menu_optSlctr_dflt, 0, 6, 4); 
	fn_thm_setup_1(THM.DFLT, snd_menu_optMove_dflt, snd_menu_optSlct_dflt, snd_menu_optCncl_dflt, snd_menu_optFail_dflt, spr_menu_chrFrm_madot);
	global.thm_has[0] = true;
	
	/* (Simple) */
	fn_thm_setup_0(THM.SMPL, fn_txtdata("thm_name_smpl"), fn_txtdata("thm_desc_smpl"), 0, 0, 0, 0, 0, true, -1, -1, 0, 0, 0); 
	fn_thm_setup_1(THM.SMPL, -1, -1, -1, -1, -1);
	global.thm_has[1] = true;
	
	/* (Madotsuki) */
	fn_thm_setup_0(THM.MADOT, fn_txtdata("thm_name_madot"), fn_txtdata("thm_desc_madot"), #DEB2E7, #9C619C, #7B5184, #420439, #290831, true, spr_menu_wnd_madot, spr_menu_optSlctr_madot, 0.25, 6, 4); 
	fn_thm_setup_1(THM.MADOT, snd_menu_optMove_madot, snd_menu_optSlct_madot, snd_menu_optCncl_madot, snd_menu_optFail_madot, spr_menu_chrFrm_madot);
	global.thm_has[2] = true;
}

function fn_thm_setup_0(_id, _name_txt, _desc_txt, _col_0, _col_1, _col_2, _col_3, _col_4, _shdw_act, _wnd_spr, _optSlctr_spr, _optSlctr_frmSpd, _optSlctr_xDist, _optSlctr_yDist) // (the function had to be split into two parts because GameMaker has a limit on how many arguments you can use)
{
	var i = _id;
	
	global.thm_name_txt[i] = _name_txt;
	global.thm_desc_txt[i] = _desc_txt;
		
	global.thm_col[i, 0] = _col_0; // lighter white (txt  →  upper main) // col (colors)
	global.thm_col[i, 1] = _col_1; // darker white (txt  →  lower main)
	global.thm_col[i, 2] = _col_2; // lighter gray (txt  →  upper other)
	global.thm_col[i, 3] = _col_3; // darker gray (txt  →  lower other)
	global.thm_col[i, 4] = _col_4; // black (txt  →  shdw)
	global.thm_shdw_act[i] = _shdw_act;
		
	global.thm_wnd_spr[i] = _wnd_spr; // wnd (wnds/backgrounds)
		
	global.thm_optSlctr_spr[i] = _optSlctr_spr; // optSlctr (option selection indicator)
	global.thm_optSlctr_frmSpd[i] = _optSlctr_frmSpd;
	global.thm_optSlctr_xDist[i] = _optSlctr_xDist;
	global.thm_optSlctr_yDist[i] = _optSlctr_yDist;
}
function fn_thm_setup_1(_id, _snd_optMove, _snd_optSlct, _snd_optCncl, _snd_optFail, _inv_chrFrm_spr)
{
	var i = _id;
	
	global.thm_snd_optMove[i] = _snd_optMove; // snds (sounds)
	global.thm_snd_optSlct[i] = _snd_optSlct;
	global.thm_snd_optCncl[i] = _snd_optCncl;
	global.thm_snd_optFail[i] = _snd_optFail;
		
	global.thm_chrFrm_spr[i] = _inv_chrFrm_spr; // chrFrm (inv  →  player portrait fliste)
}
