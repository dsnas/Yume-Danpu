
var l = lvl_curr;
if (l == LVL_LANG) // Language level
{	
	// Options
	var _opt_len = array_length(lvl[l].option);
	for (var o = 0; o < _opt_len; o++)
		lvl[l].option[o].select.act = false;
	
	// Panel
	var _panel_xMargin = 16;
	var _panel_yMargin = 16;
	
	// Label
	var _label_text = "menu_config_main_option_0";
	var _label_width = fn_textdata_width(_label_text);
	var _label_height = fn_textdata_height(_label_text);
	var _label_yOfs = _panel_yMargin; // Vertical offset from {panel_y}
	
	// Options' icon
	var _flag_spr = spr_menu_home_flag;
	var _flag_width = fn_spr_width(_flag_spr);
	var _flag_height = fn_spr_height(_flag_spr);
	var _flag_xDist = (_flag_width + 16); // Horizontal distance between each flag
	var _flag_yOfs = (_label_yOfs + _label_height + round(_panel_yMargin / 2)); // Vertical offset from {panel_y}
	var _flag_widthAll = ((_flag_xDist * (_opt_len - 1)) + _flag_width);
	
	// Panel and panel
	var _panel_width = max( (_panel_xMargin + _flag_widthAll + _panel_xMargin), (_panel_xMargin + _label_width + _panel_xMargin) );
	var _panel_height = (_flag_yOfs + _flag_height + _panel_yMargin);
	var _panel_x = (160 - round(_panel_width / 2));
	var _panel_y = (120 - round(_panel_height / 2));
	lvl[l].panel[0].x = _panel_x;
	lvl[l].panel[0].y = _panel_y;
	lvl[l].panel[0].width = _panel_width;
	lvl[l].panel[0].height = _panel_height;
	lvl[l].label[0].text = _label_text;
	lvl[l].label[0].x = (_panel_x + round(_panel_width / 2) - (fn_textdata_width(lvl[l].label[0].text) / 2));
	lvl[l].label[0].y = (_panel_y + _label_yOfs);
	
	// Options' icon and decorations
	for (var o = 0; o < _opt_len; o++)
	{
		// Option's icon
		var __flag_x = (_panel_x + round(_panel_width / 2) - round(_flag_widthAll / 2) + (_flag_xDist * o));
		var __flag_y = (_panel_y + _flag_yOfs);
		lvl[l].option[o].icon.spr = _flag_spr;
		lvl[l].option[o].icon.img = o;
		lvl[l].option[o].icon.x = __flag_x;
		lvl[l].option[o].icon.y = __flag_y;
		
		// Decoration
		lvl[l].decor[o].spr = spr_menu_home_flag_select
		lvl[l].decor[o].x = (__flag_x + round(_flag_width / 2));
		lvl[l].decor[o].y = (__flag_y + _flag_height + 5);
		lvl[l].decor[o].color = global.player.thm[global.player.thm_curr].color.whiteLight;
		lvl[l].decor[o].alpha = (o == lvl[l].option_curr);
	}
}
else if (l == LVL_MAIN)
{
	// Options
	var _opt_len = array_length(lvl[l].option);
	var _opt_yCenter = (120 + 45);
	var _opt_yDist = (fn_text_height("Salenis") + 6);
	var _opt_heightAll = ((_opt_yDist * (_opt_len - 1)) + fn_text_height("Salenis"));
	for (var o = 0; o < _opt_len; o++)
	{
		lvl[l].option[o].text = $"menu_home_main_option_{o}";
		lvl[l].option[o].x = round(160 - (fn_textdata_width(lvl[l].option[o].text) / 2));
		lvl[l].option[o].y = round(_opt_yCenter - (_opt_heightAll / 2) + (_opt_yDist * o));
		
		if (o == 0)
			var _opt_widthMax = fn_textdata_width(lvl[l].option[o].text);
		else
			_opt_widthMax = max(_opt_widthMax, fn_textdata_width(lvl[l].option[o].text));
	}
	
	// Panel
	var _panel_xMargin = 16;
	var _panel_yMargin = (16 - 4);
	var _panel_width = (_panel_xMargin + _opt_widthMax + _panel_xMargin);
	var _panel_height = (_panel_yMargin + _opt_heightAll + _panel_yMargin);
	var _panel_x = round(160 - (_panel_width / 2));
	var _panel_y = round(_opt_yCenter - (_panel_height / 2));
	lvl[l].panel[0].x = _panel_x;
	lvl[l].panel[0].y = _panel_y;
	lvl[l].panel[0].width = _panel_width;
	lvl[l].panel[0].height = _panel_height;
	
	// Logo decoration
	var _logo_spr = spr_menu_home_logo;
	var _logo_width = fn_spr_width(_logo_spr);
	var _logo_height = fn_spr_height(_logo_spr);
	lvl[l].decor[0].spr = _logo_spr;
	lvl[l].decor[0].x = round(160 - (_logo_width / 2));
	lvl[l].decor[0].y = round(60 - (_logo_height / 2));
	
	// Credits decoration
	var _prod_spr = spr_menu_home_prod;
	var _prod_width = fn_spr_width(_prod_spr);
	var _prod_height = fn_spr_height(_prod_spr);
	var _prod_x = round((global.config.vid.resW / 2) - (_prod_width / 2));
	var _prod_y = (global.config.vid.resH - _prod_height - 4);
	var _prod_color = [global.player.thm[global.player.thm_curr].color.grayLight, global.player.thm[global.player.thm_curr].color.whiteLight];
	for (var p = 1; p < (2 + 1); p++)
	{
		lvl[l].decor[p].spr = _prod_spr;
		lvl[l].decor[p].img = ((2 * global.config.lang_curr) + (p - 1));
		lvl[l].decor[p].x = _prod_x;
		lvl[l].decor[p].y = _prod_y;
		lvl[l].decor[p].color = _prod_color[(p - 1)];
		lvl[l].decor[p].alpha = 0.5;
	}
}


event_inherited();
