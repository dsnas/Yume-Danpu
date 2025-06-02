
// ram (memories: the collectible objects found in the dream world, such as effects, items, and themes)




function fn_eff_start() // start effs (effects)
{
	global.eff_amt = 0;
	global.eff_amtMax = 14;
	for (var i = 0; i < global.eff_amtMax; i++)
	{
		global.eff_name_txt[i] = "Salenis";
		global.eff_desc_txt[i] = "The Salenis description";
	}
	
	
	fn_eff_setup(0, "Salenis 0", "The Salenis is a world-famous dish.\nIt tastes funny.");
	fn_eff_setup(1, "Salenis 1", "The Salenis is a fascinating creation.\nIts smell is pleasing.");
	fn_eff_setup(2, "Salenis 2", "The Salenis is a political symbol.\nIts texture is horrifying.");
}

function fn_eff_setup(_id, _name_txt, _desc_txt)
{
	var i = _id;
	
	global.eff_name_txt[i] = _name_txt;
	global.eff_desc_txt[i] = _desc_txt;
	
	global.eff_amt += 1;
}




function fn_itm_start() // start itms (items)
{
	global.itm_amt = 0;
	global.itm_amtMax = global.eff_amtMax;
	for (var i = 0; i < global.itm_amtMax; i++)
	{
		global.itm_name_txt[i] = "Salenis";
		global.itm_desc_txt[i] = "The Salenis description";
	}
	
	
	fn_itm_setup(0, "VERY COOL ITEM", "VERY COOL DESCRIPTION");
}

function fn_itm_setup(_id, _name_txt, _desc_txt)
{
	var i = _id;
	
	global.itm_name_txt[i] = _name_txt;
	global.itm_desc_txt[i] = _desc_txt;
	
	global.itm_amt += 1;
}




function fn_thm_start() // start thms (themes)
{
	global.thm_amt = 0;
	global.thm_amtMax = global.eff_amtMax;
	for (var i = 0; i < global.thm_amtMax; i++)
	{
		fn_thm_setup_0(i, "Salenis", "The Salenis description", c_white, c_white, c_gray, c_gray, c_black, false, spr_menu_wnd_madot, spr_menu_optSlctr_madot, 0, 6, 4); 
		fn_thm_setup_1(i, snd_menu_optMove_dflt, snd_menu_optSlct_dflt, snd_menu_optCncl_dflt, snd_menu_optFail_dflt, spr_menu_chrFrm_madot);
		global.thm_amt -= 1;
	}
	
	
	enum THM
	{
		DFLT = 0, // (Default)
		SMPL = 1, // (Simple)
		MADOT = 2 // (Madotsuki)
	}
	
	
	/* (Default) */
	fn_thm_setup_0(THM.DFLT, "Salenis", "The Salenis description", c_white, c_white, c_gray, c_gray, c_black, false, spr_menu_wnd_madot, spr_menu_optSlctr_madot, 0, 6, 4); 
	fn_thm_setup_1(THM.DFLT, snd_menu_optMove_dflt, snd_menu_optSlct_dflt, snd_menu_optCncl_dflt, snd_menu_optFail_dflt, spr_menu_chrFrm_madot);
	
	/* (Simple) */
	fn_thm_setup_0(THM.SMPL, fn_txtdata("thm_name_smpl"), fn_txtdata("thm_desc_smpl"), 0, 0, 0, 0, 0, true, -1, -1, 0, 0, 0); 
	fn_thm_setup_1(THM.SMPL, -1, -1, -1, -1, -1);
	
	/* (Madotsuki) */
	fn_thm_setup_0(THM.MADOT, fn_txtdata("thm_name_madot"), fn_txtdata("thm_desc_madot"), #DEB2E7, #9C619C, #7B5184, #420439, #290831, true, spr_menu_wnd_madot, spr_menu_optSlctr_madot, 0.25, 6, 4); 
	fn_thm_setup_1(THM.MADOT, snd_menu_optMove_madot, snd_menu_optSlct_madot, snd_menu_optCncl_madot, snd_menu_optFail_madot, spr_menu_chrFrm_madot);
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
		
	global.thm_wnd_spr[i] = _wnd_spr; // wnd (windows/backgrounds)
		
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
		
	global.thm_chrFrm_spr[i] = _inv_chrFrm_spr; // chrFrm (inv  →  player portrait frame)
	
	global.thm_amt += 1;
}
