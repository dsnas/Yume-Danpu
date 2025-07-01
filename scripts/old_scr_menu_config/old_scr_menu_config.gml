
function fn_menu_config_lbl_textdata(_lvl_id)
{
	var l = _lvl_id;
	var _lblSlctr_xDist = (draw_dist * 2);
	
	
	if (l == LVL_MAIN) // LVL MAIN
	{
		lbl_text[l, 0] = global.config_lang_Name[global.config_lang];
	}
	
	else if (l == LVL_GFX) // LVL VID (Video settings)
	{
		lbl_text[l, 0] = fn_getText("menu_config_main_lbl_" + string(global.config_fscr));
	}
	
	
	for (var o = 0; o < lbl_amtMax; o++)
	{
		lblSlctr_x[l][o][0] = (opt_x[l, o] + opt_wMax[l] + _lblSlctr_xDist); // [LVL MAIN] (Label arrows)
		lblSlctr_x[l][o][1] = (lblSlctr_x[l][o][0] + lblSlctr_w + lbl_w[l, o]);
		lblSlctr_y[l, o] = opt_y[l, o];

		lbl_x[l, o] = (lblSlctr_x[l][o][0] + lblSlctr_w); // [LVL MAIN] (Label #1)
		lbl_y[l, o] = opt_y[l, o];
	}
}
