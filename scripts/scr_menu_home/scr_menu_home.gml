
//////// Functions related to the main menu


// Functions related to setting up the menu
function fn_menu_home_evCreate_0()
{
	// MEU DEUS !!!!!!!!! QUE MURAL COLORIDO!!!!!!!!!! AAAAAAAAAAAAAAAAAAAAAAAA
	
	
	// Languages level
	LVL_LANG = 0;
	var l = LVL_LANG;
	
		// Options
	for (var o = 0; o < global.config_lang_amt; o++)
	{
		fn_menu_opt_add(l, o, "");
		fn_menu_opt_slctr_add(l, o);
	}
	opt_move_type[l] = OPT_MOVE_TYPE_dfltHor; // Toggles horizontal default option movement
	opt_amt[l] = global.config_lang_amt;
	
		// Flags [#0]
	lang_flag_spr = spr_menu_home_flag;
	lang_flag_w = fn_spr_w(lang_flag_spr);
	lang_flag_h = fn_spr_h(lang_flag_spr);
	var _flag_xDist = round(draw_dist * 2.5);
	var _flag_yDistInfo = (draw_dist * 1.5); // The flags' vertical distance from the title info
	var _flag_wAll = ((_flag_xDist * (opt_amt[l] - 1)) + lang_flag_w);
	
		// Flag selector [#0]
	lang_flag_slctr_spr = spr_menu_home_flag_slctr;
	lang_flag_slctr_col = global.thm_col[global.thm].whiteLight;
	
		// Title info [#0]
	fn_menu_info_addText(l, 0, "menu_home_lang_info_0");
	var _info_hAll = (_flag_yDistInfo + lang_flag_h); // Total height of the title info and the flags
	
		// Box
	var _box_wDist = round(draw_dist * 1.25);
	var _box_hDist = draw_dist;
	var _box_w = (_box_wDist + _flag_wAll + _box_wDist);
	var _box_h = (_box_hDist + _info_hAll + _box_hDist);
	var _box_x = (160 - round(_box_w / 2));
	var _box_y = (120 - round(_box_h / 2));
	fn_menu_box_add(l, 0, _box_x, _box_y, _box_w, _box_h);
	
		// Title info [#1]
	var _info_yFix = 2;
	info_x[l, 0] = (box_x[l, 0] + round(box_w[l, 0] / 2) - round(info_w[l, 0] / 2));
	info_y[l, 0] = (box_y[l, 0] + round(box_h[l, 0] / 2) - round(_info_hAll / 2) - _info_yFix);
	
		// Flags [#1] and their selector [#1]
	for (var f = 0; f < opt_amt[l]; f++)
	{
		lang_flag_x[f] = (box_x[l, 0] + round(box_w[l, 0] / 2) - round(_flag_wAll / 2) + round(_flag_xDist * f));
		lang_flag_y[f] = (info_y[l, 0] + _flag_yDistInfo);
		lang_flag_alpTgt[f, 0] = 0.35; // Flag's alpha while unselected
		lang_flag_alpTgt[f, 1] = 1; // Flag's alpha while selected
		lang_flag_alp[f] = lang_flag_alpTgt[f, 0];
		
		lang_flag_slctr_x[f] = (lang_flag_x[f] + round(lang_flag_w / 2));
		lang_flag_slctr_y[f] = (lang_flag_y[f] + lang_flag_h + round(_box_hDist / 3));
		lang_flag_slctr_alp[f] = 0;
	}
	
	lang_snd = global.thm_start_snd[global.thm];
	
	
	
	
	// Main level
	LVL_MAIN = 1;
	var l = LVL_MAIN;
	
	main_logo_spr = spr_menu_home_logo;
	main_logo_x = (160 - (fn_spr_w(main_logo_spr) / 2));
	main_logo_y = (draw_dist * 2);
	
		// Options [#0]
	fn_menu_opt_add_ext(l, "menu_home_main_opt_");
	var _opt_yDist = round(draw_dist * 1.25);
	var _opt_hAll = (round(_opt_yDist * (opt_amt[l] - 1)) + global.GAME_FNT_H);
		
		// Box
	var _box_wDist = round(draw_dist * 1.25);
	var _box_hDist = round(draw_dist * 0.75);
	var _box_w = (_box_wDist + opt_wMax[l] + _box_wDist);
	var _box_h = (_box_hDist + _opt_hAll + _box_hDist);
	var _box_x = (160 - round(_box_w / 2));
	var _box_y = (120 + round(draw_dist * 3) - round(_box_h / 2));
	fn_menu_box_add(l, 0, _box_x, _box_y, _box_w, _box_h);
	
		// Options [#1]
	for (var o = 0; o < opt_amt[l]; o++)
	{
		opt_x[l, o] = (box_x[l, 0] + round(box_w[l, 0] / 2) - round(opt_w[l, o] / 2));
		opt_y[l, o] = (box_y[l, 0] + round(box_h[l, 0] / 2) - round(_opt_hAll / 2) + (_opt_yDist * o));
		fn_menu_opt_slctr_add(l, o);
	}
}
function fn_menu_home_evCreate_1()
{
	// Languages level
	if (global.config_lang_hasChosen == false)
	{
		lvl = LVL_LANG;
		lvl_alpDelay[lvl] = 120;
		lang_snd_act = false;
	}
	
	// Main level
	else if (global.config_lang_hasChosen == true)
		lvl = LVL_MAIN;
}
function fn_menu_home_evStep()
{
	// Plays menu start sound when the languages level opens
	if (lvl == LVL_LANG && lvl_alp[lvl] == 1 && lang_snd_act == false)
	{
		fn_aud_play(lang_snd, CONFIG_VOLTYPE.MENU);
		lang_snd_act = true;
	}
}
function fn_menu_home_evDrawGUI_2(l)
{
	// Language level
	if (l == LVL_LANG)
	{
		// Draws flags and their selector
		for (var f = 0; f < opt_amt[l]; f++)
		{
			var fPos = (f == opt_move_pos[l]);
			
			// Draws the flag selector
			lang_flag_slctr_alp[f] = fn_lerp(lang_flag_slctr_alp[f], fPos, opt_colSpd);
			fn_draw_spr(lang_flag_slctr_spr, 0, lang_flag_slctr_x[f], lang_flag_slctr_y[f], lang_flag_slctr_col, (lang_flag_slctr_alp[f] * lvl_alp[l] * draw_alp), , , , true);
			
			// Draws flags
			lang_flag_alp[f] = lerp(lang_flag_alp[f], lang_flag_alpTgt[f, fPos], opt_colSpd);
			fn_draw_spr(lang_flag_spr, f, lang_flag_x[f], lang_flag_y[f], , (lang_flag_alp[f] * lvl_alp[l] * draw_alp), , , , true);
		}
	}
	
	// Main level
	else if (l == LVL_MAIN)
	{
		// Draws logo
		fn_draw_spr(main_logo_spr, 0, main_logo_x, main_logo_y, , (lvl_alp[l] * draw_alp));
	}
}


// Functions related to the options
function fn_menu_home_opt_slct()
{
	// Languages level
	if (lvl == LVL_LANG)
	{
		// Flag of United States
		if (opt_move_pos[lvl] == 0)
			global.config_lang = CONFIG_LANG.EN_US;
		
		// Flag of Brazil
		else if (opt_move_pos[lvl] == 1)
			global.config_lang = CONFIG_LANG.PT_BR;
		
		// Flag of United States, flag of Brazil
		if (opt_move_pos[lvl] == 0) || (opt_move_pos[lvl] == 1)
		{
			global.config_lang_hasChosen = true;
			fn_config_lang_textData_setup();
			fn_config_file_save();
			
			event_perform(ev_create, 0);
			lvl = LVL_MAIN;
			lvl_alp[LVL_LANG] = 1;
		}
	}
	
	// Main level
	else if (lvl == LVL_MAIN)
	{
		// "Start"
		if (opt_move_pos[lvl] == 0)
		{
			fn_rmTrans_start();
			opt_move_act[lvl] = false;
			opt_slct_act[lvl] = false;
			opt_cncl_act[lvl] = false;
		}
		
		// "Options"
		else if (opt_move_pos[lvl] == 1)
		{
			fn_menu_lvlNew(LVL_EMPTY);
			fn_menu_obj_create("config");
		}
		
		// "Exit"
		else if (opt_move_pos[lvl] == 2)
			fn_menu_lvlNew(LVL_EMPTY, 30, , true);
	}
}
