
var l = lvl_curr;
if (l == LVL_MAIN) // Main level
{
	// Panel element
	var _panel_xMargin = 16;
	var _panel_yMargin = 18;
	var _panel_width = 192;
	var _panel_height = 104;
	var _panel_x = round((global.config.vid.resW / 2) - (_panel_width / 2));
	var _panel_y = round((global.config.vid.resH / 2) - (_panel_height / 2) + ((lvl[l].title.panel.height - abs(lvl[l].title.panel.y)) / 2));
	lvl[l].panel[0].x = _panel_x;
	lvl[l].panel[0].y = _panel_y;
	lvl[l].panel[0].width = _panel_width;
	lvl[l].panel[0].height = _panel_height;
	
	// Option elements
	lvl[l].option[0].x = (_panel_x + _panel_xMargin);
	lvl[l].option[0].y = (_panel_y + _panel_yMargin);
	lvl[l].option[0].value.text = textdata(global.config.lang[global.config.lang_curr].name);
	lvl[l].option[0].value.x = (lvl[l].option[0].x + fn_textdata_width(lvl[l].option[0].text) + ((_panel_x + _panel_width - (lvl[l].option[0].x + fn_textdata_width(lvl[l].option[0].text))) / 2));
	var _opt_len = 3;
	var _opt_yDist = (fn_text_height("Salenis") + 4);
	var _opt_heightAll = ((_opt_yDist * (_opt_len - 1)) + fn_text_height("Salenis"));
	var _opt_yCenter = (lvl[l].option[0].y + fn_text_height("Salenis") + ((_panel_y + _panel_height - (_panel_yMargin / 2) - (lvl[l].option[0].y + fn_text_height("Salenis"))) / 2));
	for (var o = 1; o < (_opt_len + 1); o++)
	{
		lvl[l].option[o].x = (_panel_x + (_panel_width / 2) - (fn_textdata_width(lvl[l].option[o].text) / 2));
		lvl[l].option[o].y = round(_opt_yCenter - (_opt_heightAll / 2) + (_opt_yDist * (o - 1)));
	}
}


event_inherited();
