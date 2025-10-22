
event_inherited();


LVL_MAIN = 1;
fn_menu_lvl_add(LVL_MAIN);
fn_menu_lvl_fader_start(LVL_MAIN);
fn_menu_lvl_panel_add(LVL_MAIN, 0, 0, 60, 60, 57, 87);
for (var i = 0; i < 3; i++)
{
	fn_menu_lvl_option_add(LVL_MAIN, i, $"WWWWW", 32, (32 + (32 * i)));
}
fn_menu_lvl_option_add(LVL_MAIN, 3, $"Call me", 32, 128);
fn_menu_lvl_option_value_add(LVL_MAIN, 3);
fn_menu_lvl_option_add(LVL_MAIN, 4, $"Then I Said: Image!", 32, 160);
fn_menu_lvl_option_icon_add(LVL_MAIN, 4, spr_menu_inv_mnyIco);

LVL_OTHER = 2;
fn_menu_lvl_add(LVL_OTHER);
fn_menu_lvl_panel_add(LVL_OTHER, 0, 0, 120, 40, 87, 67);
fn_menu_lvl_option_add(LVL_OTHER, 0, "Jipypirty", 32, 128);
fn_menu_lvl_option_add(LVL_OTHER, 1, "DAYS", 42, 192);
