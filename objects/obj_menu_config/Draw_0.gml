
if (is_array(lvl) == true)
{
	// Main level
	if (lvl_curr == LVL_MAIN) || (lvl_fader.tgt.lvl == LVL_MAIN)
	{	
		var l = LVL_MAIN;
		
		// Panel
		var _panel_xMarg = 48;
		var _panel_yMarg = 48;
		var _panel_width = (global.config.vid.resW - (_panel_xMarg * 2));
		var _panel_height = (global.config.vid.resH - (_panel_yMarg * 2));
		var _panel_x = round((global.config.vid.resW / 2) - (_panel_width / 2));
		var _panel_y = round((global.config.vid.resH / 2) - (_panel_height / 2) + (lvl[l].panel[0].title.height / 2));
		lvl[l].panel[0].x = _panel_x;
		lvl[l].panel[0].y = _panel_y;
		lvl[l].panel[0].width = _panel_width;
		lvl[l].panel[0].height = _panel_height;
		lvl[l].panel[0].title.act = true;
		lvl[l].panel[0].title.label.text = "menu_home_main_option_1";
	}
	
	// Video level
	if (lvl_curr == LVL_VID) || (lvl_fader.tgt.lvl == LVL_VID)
	{	
		var l = LVL_MAIN;
	}
}


event_inherited();
