
//////// Functions related to the settings menu


// Functions related to setting up the menu
function fn_menu_config_evCreate()
{
	// Main level [#0]
	LVL_MAIN = 0;
	var l = LVL_MAIN;
	lvlTrans_tgt = l;
	
	fn_menu_ttl_add(l, fn_getText("menu_config_main_ttl"));
	
	
	
	
	// All levels
	for (var l = 0; l < lvl_amtMax; l++)
	{
		// Box
		var _box_xDist = (draw_dist * 4);
		var _box_yDist = (draw_dist * 3);
		if (l != LVL_MAIN)
		{
			_box_xDist = draw_dist;
			_box_yDist = _box_xDist;
		}
		
		var _box_x = _box_xDist;
		var _box_y = (ttl_box_y[l] + ttl_box_h[l] + _box_yDist);
		var _box_w = (320 - (_box_x * 2));
		var _box_h = (240 - _box_y - _box_yDist);
		
		fn_menu_box_add(l, 0, _box_x, _box_y, _box_w, _box_h);
	}
	
	
	
	
	// Main level [#1]
	var l = LVL_MAIN;
	
		// Options
	fn_menu_opt_add_ext(l, "menu_config_main_opt_");
	
	var _opt_yDist = draw_dist;
	var _opt_hAll = (_opt_yDist * (opt_amt[l] - 1) + global.game_fnt_h);
	for (var o = 0; o < opt_amt[l]; o++)
	{	
		opt_x[l, o] = (box_x[l, 0] + draw_dist);
		opt_y[l, o] = (box_y[l, 0] + (box_h[l, 0] / 2) - (_opt_hAll / 2) + (_opt_yDist * o));
		fn_menu_opt_slctr_add(l, o); // Option selector
	}
	
			// Option's setting
	var _opt_config_xDist = (draw_dist * 2);
	fn_menu_opt_config_add(l, 0, opt_x[l, 0] + opt_w[l, 0] + _opt_config_xDist, opt_y[l, 0]);
	fn_menu_opt_config_slctr_add(l, 0); // Selector of the option's setting
	
	
	
	
	// Languages level (unused)
	LVL_LANG = 1;
	var l = LVL_LANG;
	
		// Title
	fn_menu_ttl_add(l, fn_getText("menu_config_lang_ttl"));
	
	
	
	
	// Controls level (unused)
	LVL_KEY = 2;
	var l = LVL_KEY;
	
		// Title
	fn_menu_ttl_add(l, fn_getText("menu_config_key_ttl"));
	
		// Options
	var _opt_x = (box_x[l, 0] + draw_dist);
	var _opt_y = (box_y[l, 0] + draw_dist);
	fn_menu_opt_add(l, 0, fn_getText("menu_config_key_opt_0"), _opt_x, _opt_y);
	fn_menu_opt_slctr_add(l, 0);
	
	
	
	
	// Video Settings level
	LVL_VID = 3;
	var l = LVL_VID;
	
		// Title
	fn_menu_ttl_add(l, fn_getText("menu_config_vid_ttl"));
	
		// Options
	fn_menu_opt_add_ext(l, "menu_config_vid_opt_");
	
	for (var o = 0; o < opt_amt[l]; o++)
	{
		var _opt_x = (box_x[l, 0] + draw_dist);
		var _opt_y = (box_y[l, 0] + draw_dist + (draw_dist * o));
		fn_menu_opt_add(l, o, , _opt_x, _opt_y);
	}
}
function fn_menu_config_evStep_0()
{
	// Main level
	if (lvl == LVL_MAIN) || (lvlTrans_tgt == LVL_MAIN)
	{	
		var l = lvl;
		if (lvlTrans_tgt == LVL_MAIN)
			 l = lvlTrans_tgt;
		
		opt_config_text[l, 0] = global.config_lang_name[global.config_lang];
	}
}


// Functions related to the options
function fn_menu_config_opt_slct()
{
	// Main level
	if (lvl == LVL_MAIN)
	{
		// "Video Settings"
		if (opt_move_pos[lvl] == 1)
		{
			fn_menu_lvlTrans_start(LVL_VID);
		}
	}
}
function fn_menu_config_opt_cncl()
{
	// Main level
	if (lvl == LVL_MAIN)
	{
		fn_menu_lvlTrans_start(LVL_EMPTY, , , true);
		
		with (global.menu_home_obj)
			fn_menu_lvlTrans_start(LVL_MAIN);
	}
}
