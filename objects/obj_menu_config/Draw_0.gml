
if (is_array(lvl) == true)
{
	// Main level
	if (lvl_curr == LVL_MAIN) || (lvl_fader.tgt.lvl == LVL_MAIN)
	{	
		var l = LVL_MAIN;
		
		// Panel
		var _panel = lvl[l].panel[0];
		var _panel_xMarg = 48;
		var _panel_yMarg = (48 + 16);
		var _panel_width = (global.config.vid.resW - (_panel_xMarg * 2));
		var _panel_height = (global.config.vid.resH - (_panel_yMarg * 2));
		var _panel_x = round((global.config.vid.resW / 2) - (_panel_width / 2));
		var _panel_y = round((global.config.vid.resH / 2) - (_panel_height / 2) + (_panel.title.height / 2));
		_panel.x = _panel_x;
		_panel.y = _panel_y;
		_panel.width = _panel_width;
		_panel.height = _panel_height;
		_panel.title.label.text = "menu_home_main_option_1";
		var _panel_yPad = (16 + 4);
		
		// Options
		 //DEPOIS FAZER option select NAS BANDERIAS DO menu home lvl lang
		for (var o = 0; o < array_length(lvl[l].option); o++)
		{
			var _opt = lvl[l].option;
			_opt[o].text = $"menu_config_main_option_{o}";
			_opt[o].icon.spr = spr_menu_config_main_option_icon;
			_opt[o].icon.img = o;
			_opt[o].icon.xGap = fn_menu_lvl_option_icon_xGap_getDflt(l, o);
			if (o == 0)
			{
				_opt[o].value.text = $"config_lang_{global.config.lang[global.config.lang_curr].code}";
				var _opt_widthAll = (fn_textdata_width(_opt[o].text) + _opt[o].value.xGap + round(fn_textdata_width(_opt[o].value.text) / 2) + _opt[o].value.arrow[1].xGap + round(fn_textdata_width(_opt[o].value.text) / 2) + round(fn_text_width(_opt[o].value.arrow[1].text) / 2));
				_opt[o].x = (_panel.x + round(_panel_width / 2) - round(_opt_widthAll / 2) + round(_opt[o].icon.xGap / 2));
				_opt[o].y = (_panel.y + _panel_yPad);
				//_opt[o].y = (_panel.y + round(_panel_height / 5.5))
			}
			else
			{
				var _opt_len = (array_length(_opt) - 1);
				var _opt_yGap = 16;
				var _opt_heightAll = ((_opt_yGap * (_opt_len - 1)) + fn_text_height("Salenis"));
				_opt[o].x = (_panel.x + round(_panel_width / 2) - round(fn_textdata_width(_opt[o].text) / 2) + round(_opt[o].icon.xGap / 2));
				_opt[o].y = (_panel.y + _panel_height - _panel_yPad - (_opt_heightAll / 1) + (_opt_yGap * (o - 1)));
				//_opt[o].y = ((_opt[0].y + fn_textdata_height(_opt[0].text)) + ((_panel_height - (_opt[0].y + fn_textdata_height(_opt[0].text) - _panel_y)) / 2) - (_opt_heightAll / 2) + (_opt_yGap * (o - 1)));
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
