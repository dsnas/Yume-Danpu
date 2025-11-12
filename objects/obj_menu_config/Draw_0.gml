
var l = lvl_curr;
if (l == LVL_MAIN) // Main level
{
	// Panel
	var _panel_xMarg = 48;
	var _panel_yMarg = 48;
	var _panel_width = (global.config.vid.resW - (_panel_xMarg * 2));
	var _panel_height = (global.config.vid.resH - (_panel_yMarg * 2));
	var _panel_x = round((global.config.vid.resW / 2) - (_panel_width / 2));
	var _panel_y = round((global.config.vid.resH / 2) - (_panel_height / 2));
	lvl[l].panel[0].x = _panel_x;
	lvl[l].panel[0].y = _panel_y;
	lvl[l].panel[0].width = _panel_width;
	lvl[l].panel[0].height = _panel_height;
	
	// Card
	var _card_xMarg = 0;
	var _card_yMarg = _card_xMarg;
	var _card_x = (_panel_x + _card_xMarg);
	var _card_y = (_panel_y + _card_yMarg);
	var _card_width = (_panel_width - (_card_xMarg * 2));
	var _card_height = (fn_text_height("Salenis") + 6);
	lvl[l].card[0].x = _card_x;
	lvl[l].card[0].y = _card_y;
	lvl[l].card[0].width = _card_width;
	lvl[l].card[0].height = _card_height;
	
	// Label
	var _label_x = (_card_x + 6)//(_card_x + (_card_width / 2) - (fn_text_width("Settings") / 2));
	var _label_y = (_card_y + (_card_height / 2) - (fn_text_height("Settings") / 2) - 1);
	lvl[l].label[0].text = "Settings";
	lvl[l].label[0].x = _label_x;
	lvl[l].label[0].y = _label_y;
	lvl[l].label[0].color = [global.player.thm[global.player.thm_curr].color.grayLight, global.player.thm[global.player.thm_curr].color.grayLight];
	
	
	
	/*
	var _title_panel_heightApparent = (lvl[l].title.panel.height - abs(lvl[l].title.panel.y));
	
	// Panel
	var _panel_xMargin = 64;
	var _panel_yMargin = 48;
	var _panel_width = (global.config.vid.resW - (_panel_xMargin * 2));
	var _panel_height = (global.config.vid.resH - _title_panel_heightApparent - (_panel_yMargin * 2));
	var _panel_x = round((global.config.vid.resW / 2) - (_panel_width / 2));
	var _panel_y = round((global.config.vid.resH / 2) - (_panel_height / 2) + (_title_panel_heightApparent / 2));
	lvl[l].panel[0].x = _panel_x;
	lvl[l].panel[0].y = _panel_y;
	lvl[l].panel[0].width = _panel_width;
	lvl[l].panel[0].height = _panel_height;
	var _panel_xPadding = 16;
	var _panel_yPadding = 16;
	
	// Options
	lvl[l].option[0].x = (_panel_x + _panel_xPadding);
	lvl[l].option[0].y = (_panel_y + _panel_yPadding);
	lvl[l].option[0].value.text = textdata(global.config.lang[global.config.lang_curr].name);
	lvl[l].option[0].value.x = (lvl[l].option[0].x + fn_textdata_width(lvl[l].option[0].text) + ((_panel_x + _panel_width - (lvl[l].option[0].x + fn_textdata_width(lvl[l].option[0].text))) / 2) - 2);
	var _opt_len = 3;
	var _opt_yDist = (fn_text_height("Salenis") + 4);
	var _opt_heightAll = ((_opt_yDist * (_opt_len - 1)) + fn_text_height("Salenis"));
	var _opt_yCenter = (lvl[l].option[0].y + fn_text_height("Salenis") + ((_panel_y + _panel_height - (_panel_yPadding / 2) - (lvl[l].option[0].y + fn_text_height("Salenis"))) / 2) + 1);
	for (var o = 1; o < (_opt_len + 1); o++)
	{
		lvl[l].option[o].x = (_panel_x + (_panel_width / 2) - (fn_textdata_width(lvl[l].option[o].text) / 2));
		lvl[l].option[o].y = round(_opt_yCenter - (_opt_heightAll / 2) + (_opt_yDist * (o - 1)));
	}
	*/
}
else if (l == LVL_VID) // Graphics level
{
	var _title_panel_heightApparent = (lvl[l].title.panel.height - abs(lvl[l].title.panel.y));
	
	// Panel
	var _panel_xMargin = 32;
	var _panel_yMargin = 32;
	var _panel_width = (global.config.vid.resW - (_panel_xMargin * 2));
	var _panel_height = (global.config.vid.resH - _title_panel_heightApparent - (_panel_yMargin * 2));
	var _panel_x = round((global.config.vid.resW / 2) - (_panel_width / 2));
	var _panel_y = round((global.config.vid.resH / 2) - (_panel_height / 2) + (_title_panel_heightApparent / 2));
	lvl[l].panel[0].x = _panel_x;
	lvl[l].panel[0].y = _panel_y;
	lvl[l].panel[0].width = _panel_width;
	lvl[l].panel[0].height = _panel_height;
	var _panel_xPadding = 16;
	var _panel_yPadding = 16;
	
	// Options
	var _opt_yDist = (fn_text_height("Salenis") + 4);
	for (var o = 0; o < array_length(lvl[l].option); o++)
	{
		lvl[l].option[o].x = (_panel_x + _panel_xPadding);
		lvl[l].option[o].y = (_panel_y + _panel_yPadding + (_opt_yDist * o));
		lvl[l].option[o].value.x = (_panel_x + (_panel_width / 2) + 32);
	}
}


event_inherited();
