
function fn_thm_start()
{
	global.thm_amt = 0;
	global.thm_amtMax = 10;
	for (var i = 0; i < global.thm_amtMax; i++)
	{
		global.thm_name_txt[i] = "";
		global.thm_desc_txt[i] = "";
	}
	
	/* Default */ #macro THM_DFLT 0
	fn_thm_setup(THM_DFLT, fn_txtdata("thm_name_0"), "", spr_menu_wnd_thm0, spr_menu_optSlctr_thm0, 2, 2, spr_menu_chrFrm_thm1, c_white, -1, #9E7B9B, -1, #442343, snd_menu_optMove_thm0, snd_menu_optSlct_thm0, snd_menu_optCncl_thm0, snd_menu_optFail_thm0, true, 0.5);
	
	/* Simple */ #macro THM_SIMPLE 1
	fn_thm_setup(THM_SIMPLE, fn_txtdata("thm_name_1"), "", spr_menu_wnd_thm1, spr_menu_optSlctr_thm0, 2, 2, spr_menu_chrFrm_thm1, c_white, -1, make_color_hsv(0, 0, (255 * 0.45)), -1, c_black, snd_menu_optMove_thm0, snd_menu_optSlct_thm0, snd_menu_optCncl_thm0, snd_menu_optFail_thm0, false, 0);
	
	/* Madotsuki */ #macro THM_MADOT 2
	fn_thm_setup(THM_MADOT, fn_txtdata("thm_name_2"), "", spr_menu_wnd_thm2, spr_menu_optSlctr_thm0, 6, 4, spr_menu_chrFrm_thm2, #DEB2E7, #9C619C, #7B5184, #420439, #290831, snd_menu_optMove_thm2, snd_menu_optSlct_thm2, snd_menu_optCncl_thm2, snd_menu_optFail_thm2, true, 0);
	
	
	
	/* (unused) Simple */	//fn_thm_setup(1, fn_txtdata("thm_name_1"), spr_unused_menu_wnd_1, spr_unused_menu_chrFrm_1, #E0E1DD, #E0E1DD, #5C7490, #5C7490, #1B263B, true, 0.0);
}

function fn_thm_setup(_id, _name_txt, _desc_txt, _wnd_spr, _optSlctr_spr, _optSlctr_xDist, _optSlctr_yDist, _chrFrm_spr, _col_0, _col_1, _col_2, _col_3, _col_4, _optMove_snd, _optSlct_snd, _optCncl_snd, _optFail_snd, _txtShdw, _pxAlp)
{
	var i = _id;
	
	global.thm_name_txt[i] = _name_txt;
	global.thm_desc_txt[i] = _desc_txt;
	
	global.thm_wnd_spr[i] = _wnd_spr;	// wnd (menu  →  windows/backgrounds)
	global.thm_optSlctr_spr[i] = _optSlctr_spr; // optSlctr (menu  →  option selection indicator)
	global.thm_optSlctr_xDist[i] = _optSlctr_xDist;
	global.thm_optSlctr_yDist[i] = _optSlctr_yDist;
	global.thm_chrFrm_spr[i] = _chrFrm_spr; // chrFrm (menu  →  player portrait frame)
	
	global.thm_col[i, 0] = _col_0; // lighter white (txt  →  upper main)		// col (colors)
	global.thm_col[i, 1] = _col_1; // darker white (txt  →  lower main)
	global.thm_col[i, 2] = _col_2; // lighter gray (txt  →  upper other)
	global.thm_col[i, 3] = _col_3; // darker gray (txt  →  lower other)
	global.thm_col[i, 4] = _col_4; // black (txt  →  shdw) 
	for (var z = 0; z < array_length(global.thm_col[i]); z++)
	{
		if (global.thm_col[i, z] == -1)
			global.thm_col[i, z] = global.thm_col[i, (z - 1)];
	}
	
	global.thm_optMove_snd[i] = _optMove_snd;// menu snds
	global.thm_optSlct_snd[i] = _optSlct_snd;
	global.thm_optCncl_snd[i] = _optCncl_snd;
	global.thm_optFail_snd[i] = _optFail_snd;
	
	global.thm_txtShdw[i] = _txtShdw;
	global.thm_pxAlp[i] = _pxAlp;
	
	global.thm_amt += 1;
}
