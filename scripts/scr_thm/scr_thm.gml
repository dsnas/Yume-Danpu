
function fn_thm_start()
{
	fn_thm_setup(0, fn_txtdata("thm_name_0"), spr_menu_bg_0, c_white, c_white, #9F9F9F, #9F9F9F, #343434, true); // Default
	fn_thm_setup(0, fn_txtdata("thm_name_0"), spr_menu_bg_0, c_white, c_white, #9F9F9F, #9F9F9F, #343434, true); // Default
	fn_thm_setup(2, fn_txtdata("thm_name_2"), spr_menu_bg_2, #DEB2E7, #9C619C, #7B5184, #420439, #290831, true); // Madotsuki
}

function fn_thm_setup(_id, _name_txt, _bg_spr, _col_0, _col_1, _col_2, _col_3, _col_4, _txtShdw)
{
	var i = _id;
	
	global.thm_name_txt[i] = _name_txt;
	global.thm_bg_spr[i] = _bg_spr;								// bg (menu background)
	
	global.thm_col[i, 0] = _col_0;	// txt  →  upper main		// col (colors)
	global.thm_col[i, 1] = _col_1;	// txt  →  lower main
	global.thm_col[i, 2] = _col_2;	// txt  →  upper other
	global.thm_col[i, 3] = _col_3;	// txt  →  lower other
	global.thm_col[i, 4] = _col_4;	// txt  →  shdw
		
	global.thm_txtShdw[i] = _txtShdw;
}
