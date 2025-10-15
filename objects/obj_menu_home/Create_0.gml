
event_inherited();


// Language level
LVL_LANG = 1;
var l = LVL_LANG;
fn_menu_lvl_add(l);
fn_menu_lvl_fader_start(l, global.player.thm[global.player.thm_curr].snd.start, , 120);
var _option_len = array_length(global.config.lang);
for (var o = 0; o < _option_len; o++)
{
	fn_menu_lvl_option_add(l, o, "");
	lvl[l].option[o].select.act = false;
}
lvl[l].option_move.list.key = [CONFIG_KEY.LT, CONFIG_KEY.RT];

var _panel_xMargin = 16;
var _panel_yMargin = 16;

var _label_text = textdata("menu_home_lang_label");
var _label_width = fn_text_w(_label_text);
var _label_height = fn_text_h(_label_text);
var _label_yOfs = _panel_yMargin; // Vertical offset from {panel_y}

var _flag_spr = spr_menu_home_flag;
var _flag_width = fn_spr_w(_flag_spr);
var _flag_height = fn_spr_h(_flag_spr);
var _flag_xDist = (_flag_width + 16); // Horizontal distance between each flag
var _flag_yOfs = (_label_yOfs + _label_height + round(_panel_yMargin / 2)); // Vertical offset from {panel_y}
var _flag_widthAll = ((_flag_xDist * (_option_len - 1)) + _flag_width);

var _panel_width = max( (_panel_xMargin + _flag_widthAll + _panel_xMargin), (_panel_xMargin + _label_width + _panel_xMargin) );
var _panel_height = (_flag_yOfs + _flag_height + _panel_yMargin);
var _panel_x = (160 - round(_panel_width / 2));
var _panel_y = (120 - round(_panel_height / 2));
fn_menu_lvl_panel_add(LVL_LANG, 0, , , _panel_x, _panel_y, _panel_width, _panel_height);

fn_menu_lvl_label_add(LVL_LANG, 0, _label_text, (_panel_x + round(_panel_width / 2) - round(_label_width / 2)), (_panel_y + _label_yOfs));

for (var f = 0; f < _option_len; f++)
{
	var _flag_x = (_panel_x + round(_panel_width / 2) - round(_flag_widthAll / 2) + (_flag_xDist * f));
	var _flag_y = (_panel_y + _flag_yOfs);
	fn_menu_lvl_decor_add(LVL_LANG, f, _flag_spr, f, _flag_x, _flag_y);
	fn_menu_lvl_decor_add(LVL_LANG, (f + 2), spr_menu_home_flag_select, , (_flag_x + round(_flag_width / 2)), (_flag_y + _flag_height + 5), global.player.thm[global.player.thm_curr].color.whiteLight, 0);
}


// Main level
LVL_MAIN = 2;
var l = LVL_MAIN;
fn_menu_lvl_add(l);