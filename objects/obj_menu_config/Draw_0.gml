
if (is_array(lvl) == true)
{
	// Main level
	if (lvl_curr == LVL_MAIN) || (lvl_fader.tgt.lvl == LVL_MAIN)
	{	
		var l = LVL_MAIN;
		
		// Panel
		var _panel = lvl[l].panel[0];
		var _panel_xMarg = 48;
		var _panel_yMarg = 64;
		_panel.width = round(global.config.vid.resW - (_panel_xMarg * 2));
		_panel.height = round(global.config.vid.resH - (_panel_yMarg * 2));
		_panel.x = round((global.config.vid.resW / 2) - (_panel.width / 2));
		_panel.y = round((global.config.vid.resH / 2) - (_panel.height / 2) + (_panel.title.height / 2));
		_panel.title.label.text = "menu_home_main_option_1";
		var _panel_yPad = (16 + 4);
		
		// Options
		 //DEPOIS FAZER option select NAS BANDERIAS DO menu home lvl lang
		var _opt = lvl[l].option;
		for (var o = 0; o < array_length(_opt); o++)
		{
			_opt[o].text = $"menu_config_main_option_{o}";
			_opt[o].icon.spr = spr_menu_config_main_option_icon;
			_opt[o].icon.img = o;
			_opt[o].icon.xGap = fn_menu_lvl_option_icon_xGap_getDflt(l, o);
			if (o == 0)
			{
				_opt[o].value.text = $"config_lang_{global.config.lang[global.config.lang_curr].code}";
				var _opt_widthAll = (fn_textdata_width(_opt[o].text) + _opt[o].value.xGap + (fn_textdata_width(_opt[o].value.text) / 2) + _opt[o].value.arrow[1].xGap + (fn_textdata_width(_opt[o].value.text) / 2) + (fn_text_width(_opt[o].value.arrow[1].text) / 2));
				_opt[o].x = round(_panel.x + (_panel.width / 2) - (_opt_widthAll / 2) + (_opt[o].icon.xGap / 2));
				_opt[o].y = round(_panel.y + _panel_yPad);
			}
			else
			{
				var _opt_len = (array_length(_opt) - 1);
				var _opt_yGap = 16;
				var _opt_heightAll = ((_opt_yGap * (_opt_len - 1)) + fn_text_height("Salenis"));
				_opt[o].x = round(_panel.x + (_panel.width / 2) - (fn_textdata_width(_opt[o].text) / 2) + (_opt[o].icon.xGap / 2));
				_opt[o].y = round(_panel.y + _panel.height - _panel_yPad - _opt_heightAll + (_opt_yGap * (o - 1)));
			}
		}
	}
	
	// Video, Music & Sounds and Accessibility levels
	for (var l = LVL_VID; l < LVL_ACCESS; l++)
	{
		if (lvl_curr == l) || (lvl_fader.tgt.lvl == l)
		{
			// Panel
			var _panel = lvl[l].panel[0];
			var _panel_xMarg = (48 - 16);
			var _panel_yMarg = (64 - 16);
			_panel.width = (global.config.vid.resW - (_panel_xMarg * 2));
			_panel.height = (global.config.vid.resH - (_panel_yMarg * 2));
			_panel.x = round((global.config.vid.resW / 2) - (_panel.width / 2));
			_panel.y = round((global.config.vid.resH / 2) - (_panel.height / 2) + (_panel.title.height / 2));
			_panel.title.label.text = $"menu_config_main_option_{l - 1}";
			var _panel_xPad = (32 + 4);
			
			// Options
			var _opt = lvl[l].option
			var _opt_yGap = 16;
			var _opt_heightAll = ((_opt_yGap * (array_length(_opt) - 1)) + fn_text_height("Salenis"));
			var o = 0;
			_opt[o++].text = global.config.vid.fscr.name;
			_opt[o++].text = global.config.vid.vsync.name;
			_opt[o++].text = global.config.vid.hideCsr.name;
			_opt[o++].text = global.config.vid.showVer.name;
			_opt[o++].text = global.config.vid.showBdr.name;
			_opt[o++].text = global.config.vid.showFps.name;
			var o = 0;
			_opt[o++].value.text = textdata($"menu_config_all_option_value_{global.config.vid.fscr.act}");
			_opt[o++].value.text = textdata($"menu_config_all_option_value_{global.config.vid.vsync.act}");
			_opt[o++].value.text = textdata($"menu_config_all_option_value_{global.config.vid.hideCsr.act}");
			_opt[o++].value.text = textdata($"menu_config_all_option_value_{global.config.vid.showVer.act}");
			_opt[o++].value.text = textdata($"menu_config_all_option_value_{global.config.vid.showBdr.act}");
			_opt[o++].value.text = textdata($"menu_config_all_option_value_{global.config.vid.showFps.act}");
			for (var o = 0; o < array_length(_opt); o++)
			{
				_opt[o].x = round(_panel.x + _panel_xPad);
				_opt[o].y = round(_panel.y + (_panel.height / 2) - (_opt_heightAll / 2) + (_opt_yGap * o));
				_opt[o].value.x = round(_opt[o].x + fn_menu_lvl_option_getWidthMax(l) + (((_panel.x + _panel.width) - (_opt[o].x + fn_menu_lvl_option_getWidthMax(l))) / 2));
			}
		}
	}
	
	// Video level
	if (lvl_curr == LVL_VID) || (lvl_fader.tgt.lvl == LVL_VID)
	{	
		var l = LVL_MAIN;
	}
}


event_inherited();
