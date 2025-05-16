
function fn_thm_start()
{
	/* Default */	fn_thm_setup(0, fn_txtdata("thm_name_0"), spr_menu_bg_0, spr_menu_chrFrm_1, c_white, -1, #9E7B9B, -1, #442343, true, 0.5);
	/* Simple */	fn_thm_setup(1, fn_txtdata("thm_name_1"), spr_menu_bg_1, spr_menu_chrFrm_1, c_white, -1, make_color_hsv(0, 0, (255 * 0.5)), -1, c_black, false, 0);
	/* Madotsuki*/	fn_thm_setup(2, fn_txtdata("thm_name_2"), spr_menu_bg_2, spr_menu_chrFrm_2, #DEB2E7, #9C619C, #7B5184, #420439, #290831, true, 0.35);
	
	
	
	/* (unused) Simple */	//fn_thm_setup(1, fn_txtdata("thm_name_1"), spr_menu_bg_1, spr_menu_chrFrm_1, #E0E1DD, #E0E1DD, #5C7490, #5C7490, #1B263B, true, 0.0);
}

function fn_thm_setup(_id, _name_txt, _bg_spr, _chrFrm_spr, _col_0, _col_1, _col_2, _col_3, _col_4, _txtShdw, _pxAlp)
{
	var i = _id;
	
	global.thm_name_txt[i] = _name_txt;
	global.thm_bg_spr[i] = _bg_spr;	// bg (menu background)
	global.thm_chrFrm_spr[i] = _chrFrm_spr; // chrFrm (player portrait frame)
	
	global.thm_col[i, 0] = _col_0;	// txt  →  upper main		// col (colors)
	global.thm_col[i, 1] = _col_1;	// txt  →  lower main
	global.thm_col[i, 2] = _col_2;	// txt  →  upper other
	global.thm_col[i, 3] = _col_3;	// txt  →  lower other
	global.thm_col[i, 4] = _col_4;	// txt  →  shdw
	for (var z = 0; z < array_length(global.thm_col[i]); z++)
	{
		if (global.thm_col[i, z] == -1)
			global.thm_col[i, z] = global.thm_col[i, (z - 1)];
	}
		
	global.thm_txtShdw[i] = _txtShdw;
	global.thm_pxAlp[i] = _pxAlp;
}
