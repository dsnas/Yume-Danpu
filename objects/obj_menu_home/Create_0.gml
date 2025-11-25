
event_inherited();


// Language level
LVL_LANG = 1;
var l = LVL_LANG;
fn_menu_lvl_add(l);
if (global.config.lang_hasChosen == false)
	fn_menu_lvl_fader_start(l, global.player.thm[global.player.thm_curr].snd.start, , 120);
	
	// Options and decorations
for (var o = 0; o < array_length(global.config.lang); o++)
{
	fn_menu_lvl_option_add(l, o, "");
	fn_menu_lvl_option_icon_add(l, o);	
	fn_menu_lvl_decor_add(l, o);
}
lvl[l].option_move.list.key = [CONFIG_KEY.LT, CONFIG_KEY.RT];

fn_menu_lvl_panel_add(l, 0); // Panel
fn_menu_lvl_label_add(l, 0); // Label


// Main level
LVL_MAIN = 2;
var l = LVL_MAIN;
fn_menu_lvl_add(l);
if (global.config.lang_hasChosen == true)
	fn_menu_lvl_fader_start(l, , , 0);
fn_menu_lvl_train_add(l, 0);
for (var p = 0; p < 2; p++)
	fn_menu_lvl_panel_add(l, p);
fn_menu_lvl_card_add(l, 0);
for (var o = 0; o < 3; o++)
{
	fn_menu_lvl_option_add(l, o);
	fn_menu_lvl_option_icon_add(l, o, spr_menu_home_main_lvl_option_icon, o)
}


























