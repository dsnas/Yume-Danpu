
event_inherited();


// Language level
LVL_LANG = 1;
var l = LVL_LANG;
fn_menu_lvl_add(l);
if (global.config.lang_hasChosen == false)
	fn_menu_lvl_fader_start(l, global.player.thm[global.player.thm_curr].snd.start, , 120);

var _opt_len = array_length(global.config.lang);
for (var o = 0; o < _opt_len; o++)
{
	fn_menu_lvl_option_add(l, o, "");
	lvl[l].option[o].select.act = false;
}
lvl[l].option_move.list.key = [CONFIG_KEY.LT, CONFIG_KEY.RT];

var _panel_xMargin = 16;
var _panel_yMargin = 16;

var _label_text = "menu_config_main_option_0";
var _label_width = fn_textdata_width(_label_text);
var _label_height = fn_textdata_height(_label_text);
var _label_yOfs = _panel_yMargin; // Vertical offset from {panel_y}
var _label_xAlign = fa_center;

var _flag_spr = spr_menu_home_flag;
var _flag_width = fn_spr_width(_flag_spr);
var _flag_height = fn_spr_height(_flag_spr);
var _flag_xDist = (_flag_width + 16); // Horizontal distance between each flag
var _flag_yOfs = (_label_yOfs + _label_height + round(_panel_yMargin / 2)); // Vertical offset from {panel_y}
var _flag_widthAll = ((_flag_xDist * (_opt_len - 1)) + _flag_width);

var _panel_width = max( (_panel_xMargin + _flag_widthAll + _panel_xMargin), (_panel_xMargin + _label_width + _panel_xMargin) );
var _panel_height = (_flag_yOfs + _flag_height + _panel_yMargin);
var _panel_x = (160 - round(_panel_width / 2));
var _panel_y = (120 - round(_panel_height / 2));
fn_menu_lvl_panel_add(LVL_LANG, 0, , _panel_x, _panel_y, _panel_width, _panel_height);

fn_menu_lvl_label_add(LVL_LANG, 0, _label_text, (_panel_x + round(_panel_width / 2)), (_panel_y + _label_yOfs), , _label_xAlign);

for (var o = 0; o < _opt_len; o++)
{
	var _flag_x = (_panel_x + round(_panel_width / 2) - round(_flag_widthAll / 2) + (_flag_xDist * o));
	var _flag_y = (_panel_y + _flag_yOfs);
	fn_menu_lvl_option_icon_add(l, o, _flag_spr, o);
	lvl[l].option[o].icon.x = _flag_x;
	lvl[l].option[o].icon.y = _flag_y;
	
	fn_menu_lvl_decor_add(LVL_LANG, o, spr_menu_home_flag_select, , (_flag_x + round(_flag_width / 2)), (_flag_y + _flag_height + 5), global.player.thm[global.player.thm_curr].color.whiteLight, 0);
}


// Main level
LVL_MAIN = 2;
var l = LVL_MAIN;
fn_menu_lvl_add(l);
if (global.config.lang_hasChosen == true)
	fn_menu_lvl_fader_start(l, , , (120 * !fn_obj_exists(obj_dbg)));

var _opt_len = 3;
var _opt_yCenter = (120 + 45);
var _opt_yDist = (fn_text_height("Salenis") + 6);
var _opt_heightAll = ((_opt_yDist * (_opt_len - 1)) + fn_text_height("Salenis"));
for (var o = 0; o < _opt_len; o++)
{
	fn_menu_lvl_option_add(l, o, $"menu_home_main_option_{o}");
	lvl[l].option[o].x = round(160 - (fn_textdata_width(lvl[l].option[o].text) / 2));
	lvl[l].option[o].y = round(_opt_yCenter - (_opt_heightAll / 2) + (_opt_yDist * o));
	
	if (o == 0)
		var _opt_widthMax = fn_textdata_width(lvl[l].option[o].text);
	else
		_opt_widthMax = max(_opt_widthMax, fn_textdata_width(lvl[l].option[o].text));
}

var _panel_xMargin = 16;
var _panel_yMargin = (16 - 4);
var _panel_width = (_panel_xMargin + _opt_widthMax + _panel_xMargin);
var _panel_height = (_panel_yMargin + _opt_heightAll + _panel_yMargin);
var _panel_x = round(160 - (_panel_width / 2));
var _panel_y = round(_opt_yCenter - (_panel_height / 2));
fn_menu_lvl_panel_add(l, 0, , _panel_x, _panel_y, _panel_width, _panel_height);

var _logo_spr = spr_menu_home_logo;
var _logo_width = fn_spr_width(_logo_spr);
var _logo_height = fn_spr_height(_logo_spr);
fn_menu_lvl_decor_add(l, 0, _logo_spr, , round(160 - (_logo_width / 2)), round(60 - (_logo_height / 2)));

var _prod_spr = spr_menu_home_prod;
var _prod_width = fn_spr_width(_prod_spr);
var _prod_height = fn_spr_height(_prod_spr);
var _prod_x = round((global.config.vid.resW / 2) - (_prod_width / 2));
var _prod_y = (global.config.vid.resH - _prod_height - 4); //round(_panel_y + _panel_height + ((240 - _panel_y - _panel_height) / 2) - (_prod_height / 2));
var _prod_color = [global.player.thm[global.player.thm_curr].color.grayLight, global.player.thm[global.player.thm_curr].color.whiteLight];
for (var p = 0; p < 2; p++)
	fn_menu_lvl_decor_add(l, (1 + p), _prod_spr, ((2 * global.config.lang_curr) + p), _prod_x, _prod_y, _prod_color[p], 0.5);
