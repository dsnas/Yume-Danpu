
event_inherited();


// Main level
LVL_MAIN = 1;
var l = LVL_MAIN;
fn_menu_lvl_add(l);
fn_menu_lvl_fader_start(l);
fn_menu_lvl_title_add(l, "menu_home_main_option_1"); // Title
fn_menu_lvl_panel_add(l, 0); // Panel

	// Options
fn_menu_lvl_option_add(l, 0, "menu_config_main_option_0");
fn_menu_lvl_option_value_add(l, 0);
for (var o = 1; o < (3 + 1); o++)
	fn_menu_lvl_option_add(l, o, $"menu_config_main_option_{o}");
