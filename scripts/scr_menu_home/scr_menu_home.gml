
// Functions related to the main menu system


function fn_menu_home_evCreate()
{
	// Languages level
	LVL_LANG = 0;
	var l = LVL_LANG;
	lvlTrans_lvlTgt = l;
	
	for (var o = 0; o < global.sett_lang_amt; o++)
	{
		opt_text[l, o] = "";
		optSlctr_act[l, o] = false;
	}
	opt_move_type[l] = OPT_MOVE_TYPE_dfltHor; // Toggles horizontal default option movement
	opt_amt[l] = global.sett_lang_amt;
	
		// Flags [#0]
	lang_flag_spr = spr_menu_home_flag;
	lang_flag_w = fn_spr_w(lang_flag_spr);
	lang_flag_h = fn_spr_h(lang_flag_spr);
	var _flag_xDist = round(draw_dist * 2.5);
	var _flag_yDistInfo = (draw_dist * 1.5); // The flags' vertical distance from the title info
	var _flag_wAll = ((_flag_xDist * (opt_amt[l] - 1)) + lang_flag_w);
	
		// Flag selector [#0]
	lang_flagSlctr_spr = spr_menu_home_flagSlctr;
	lang_flagSlctr_col = global.thm_col[global.thm_cur].whiteLight;
	
		// Title info [#0]
	fn_menu_info_addText(l, 0, "menu_sett_lang_info");
	var _info_hAll = (_flag_yDistInfo + lang_flag_h); // Total height of the title info and the flags
	
		// Box
	var _box_wDist = round(draw_dist * 1.25);
	var _box_hDist = draw_dist;
	box_w[l, 0] = (_box_wDist + _flag_wAll + _box_wDist);
	box_h[l, 0] = (_box_hDist + _info_hAll + _box_hDist);
	box_x[l, 0] = (160 - round(box_w[l, 0] / 2));
	box_y[l, 0] = (120 - round(box_h[l, 0] / 2));
	
		// Title info [#1]
	var _info_yFix = 2;
	info_x[l, 0] = (box_x[l, 0] + round(box_w[l, 0] / 2) - round(info_w[l, 0] / 2));
	info_y[l, 0] = (box_y[l, 0] + round(box_h[l, 0] / 2) - round(_info_hAll / 2) - _info_yFix);
	
		// Flags [#1] and their selector [#1]
	for (var f = 0; f < opt_amt[l]; f++)
	{
		lang_flag_x[f] = (box_x[l, 0] + round(box_w[l, 0] / 2) - round(_flag_wAll / 2) + round(_flag_xDist * f));
		lang_flag_y[f] = (info_y[l, 0] + _flag_yDistInfo);
		lang_flag_alpTgt[f, 0] = 0.35;	// Flag's alpha while unselected
		lang_flag_alpTgt[f, 1] = 1;		// Flag's alpha while selected
		lang_flag_alp[f] = lang_flag_alpTgt[f, 0];
		
		lang_flagSlctr_x[f] = (lang_flag_x[f] + round(lang_flag_w / 2));
		lang_flagSlctr_y[f] = (lang_flag_y[f] + lang_flag_h + round(_box_hDist / 3));
		lang_flagSlctr_alp[f] = 0;
	}
	
	
	
	
	// Main level
	LVL_MAIN = 1;
	var l = LVL_MAIN;
	if (global.flag[0] == true)
		lvlTrans_lvlTgt = l;
	
	fn_menu_opt_addText(l, "menu_home_main_opt_"); // Options #0
	var _opt_yDist = round(draw_dist * 1.25);
	var _opt_hAll = (round(_opt_yDist * (opt_amt[l] - 1)) + global.game_fnt_h);

	var _box_wAmt = round(draw_dist * 1.25); // Box
	var _box_hAmt = round(draw_dist * 0.75);
	box_w[l, 0] = (_box_wAmt + opt_wMax[l] + _box_wAmt);
	box_h[l, 0] = (_box_hAmt + _opt_hAll + _box_hAmt);
	box_x[l, 0] = (160 - round(box_w[l, 0] / 2));
	box_y[l, 0] = (120 + round(draw_dist * 3) - round(box_h[l, 0] / 2));

	for (var o = 0; o < opt_amt[l]; o++) // Options #1
	{
		opt_x[l, o] = (box_x[l, 0] + round(box_w[l, 0] / 2) - round(opt_w[l, o] / 2));
		opt_y[l, o] = (box_y[l, 0] + round(box_h[l, 0] / 2) - round(_opt_hAll / 2) + (_opt_yDist * o));
		
		fn_menu_optSlctr_add(l, o);
	}
	
	
	
	
	// Settings level
	LVL_SETT = 2;
}
function fn_menu_home_evDrawGUI_1(l)
{
	// Language level
	if (l == LVL_LANG)
	{
		// Draws flags and their selector
		for (var f = 0; f < opt_amt[l]; f++)
		{
			// Draws the flag selector
			lang_flagSlctr_alp[f] = fn_lerp(lang_flagSlctr_alp[f], (f == opt_move_pos[l]), opt_colSpd);
			fn_draw_spr(lang_flagSlctr_spr, 0, lang_flagSlctr_x[f], lang_flagSlctr_y[f], lang_flagSlctr_col, (lang_flagSlctr_alp[f] * lvl_alp[l] * draw_alp), , , , true);
			
			// Draws flags
			lang_flag_alp[f] = lerp(lang_flag_alp[f], lang_flag_alpTgt[f, (f = opt_move_pos[l])], opt_colSpd);
			fn_draw_spr(lang_flag_spr, f, lang_flag_x[f], lang_flag_y[f], , (lang_flag_alp[f] * lvl_alp[l] * draw_alp), , , , true);
		}
	}
}


function fn_menu_home_opt_slct()
{
	// Languages level
	if (lvl == LVL_LANG)
	{
		if (opt_move_pos[lvl] == 0) // Selected English (United States)
			global.sett_lang = LANG_IDX.EN_US;
		else if (opt_move_pos[lvl] == 1) // Selected Português (Brasil)
			global.sett_lang = LANG_IDX.PT_BR;
		fn_textData_setup()
		
		global.flag[0] = true;
		
		event_perform(ev_create, 0);
		lvlTrans_lvlTgt_delay = 120;
	}
	
	
	// Main level
	else if (lvl == LVL_MAIN)
	{
		// Fetches the selection results based on the player's current option position
		if (opt_move_pos[lvl] == 0) // "Start"
			fn_menu_lvlTrans_start(lvl_amtMax, , , , rm_macaco);
		else if (opt_move_pos[lvl] == 1) // "Options"
		{
			opt_slct_act[lvl] = false;
			opt_slct_act[lvl] = false;
			fn_menu_lvlTrans_start(LVL_SETT);
			
			fn_obj_create(obj_menu_sett);
		}
		else if (opt_move_pos[lvl] == 2) // "Exit"
			fn_menu_lvlTrans_start(lvl_amtMax, , , , , true);
	}
}
