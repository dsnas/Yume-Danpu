
function fn_thm_start()
{
	/* Default */	fn_thm_setup(0, fn_txtdata("thm_name_0"), spr_menu_win_thm0, spr_menu_optSlctr_thm0, 2, 2, spr_menu_chrFrm_thm1, c_white, -1, #9E7B9B, -1, #442343, true, 0.5);
	/* Simple */	fn_thm_setup(1, fn_txtdata("thm_name_1"), spr_menu_win_thm1, spr_menu_optSlctr_thm0, 2, 2, spr_menu_chrFrm_thm1, c_white, -1, make_color_hsv(0, 0, (255 * 0.45)), -1, c_black, false, 0);
	/* Madotsuki*/	fn_thm_setup(2, fn_txtdata("thm_name_2"), spr_menu_win_thm2, spr_menu_optSlctr_thm0, 6, 4, spr_menu_chrFrm_thm2, #DEB2E7, #9C619C, #7B5184, #420439, #290831, true, 0);
	
	
	
	/* (unused) Simple */	//fn_thm_setup(1, fn_txtdata("thm_name_1"), spr_unused_menu_win_1, spr_unused_menu_chrFrm_1, #E0E1DD, #E0E1DD, #5C7490, #5C7490, #1B263B, true, 0.0);
}

function fn_thm_setup(_id, _name_txt, _win_spr, _optSlctr_spr, _optSlctr_xDist, _optSlctr_yDist, _chrFrm_spr, _col_0, _col_1, _col_2, _col_3, _col_4, _txtShdw, _pxAlp)
{
	var i = _id;
	
	global.thm_name_txt[i] = _name_txt;
	global.thm_win_spr[i] = _win_spr;	// win (menu  →  windows/backgrounds)
	
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
	
	global.thm_txtShdw[i] = _txtShdw;
	global.thm_pxAlp[i] = _pxAlp;
}
