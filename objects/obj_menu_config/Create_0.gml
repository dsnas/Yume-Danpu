
event_inherited();


// Main level
LVL_MAIN = 1;
var l = LVL_MAIN;
fn_menu_lvl_add(l);
fn_menu_lvl_fader_start(l);

	// Title element
fn_menu_lvl_title_add(l, "menu_home_main_option_1");
var _title = lvl[l].title;

	// Panel element
var _panel_xMargin = 16;
var _panel_yMargin = 16;
var _panel_width = 172;
var _panel_height = 104;
var _panel_x = round((global.config.vid.resW / 2) - (_panel_width / 2));
var _panel_y = round((global.config.vid.resH / 2) - (_panel_height / 2) + ((_title.panel.height - abs(_title.panel.y)) / 2));
fn_menu_lvl_panel_add(l, 0, , _panel_x, _panel_y, _panel_width, _panel_height);

	// Option elements
fn_menu_lvl_option_add(l, 0, "menu_config_main_option_0", (_panel_x + _panel_xMargin), (_panel_y + _panel_yMargin));
fn_menu_lvl_option_value_add(l, 0);
lvl[l].option[0].value.x = (lvl[l].option[0].x + fn_textdata_width(lvl[l].option[0].text) + ((_panel_x + _panel_width - (lvl[l].option[0].x + fn_textdata_width(lvl[l].option[0].text))) / 2));

var _opt_len = 3;
var _opt_yDist = (fn_text_height("Salenis") + 4);
var _opt_heightAll = ((_opt_yDist * (_opt_len - 1)) + fn_text_height("Salenis"));
var _opt_yCenter = (lvl[l].option[0].y + fn_text_height("Salenis") + ((_panel_y + _panel_height - (_panel_yMargin / 2) - (lvl[l].option[0].y + fn_text_height("Salenis"))) / 2));

for (var o = 1; o < (_opt_len + 1); o++)
{
	fn_menu_lvl_option_add(l, o, $"menu_config_main_option_{o}");
	lvl[l].option[o].x = (_panel_x + (_panel_width / 2) - (fn_textdata_width(lvl[l].option[o].text) / 2));
	lvl[l].option[o].y = round(_opt_yCenter - (_opt_heightAll / 2) + (_opt_yDist * (o - 1)));
}
