
lvl = -1;
lvl_curr = -1;



LVL_MAIN = 0;
fn_menu_lvl_add(LVL_MAIN);
lvl_curr = LVL_MAIN;
for (var i = 0; i < 3; i++)
	fn_menu_lvl_opt_add(0, i, $"WWWWW", 32, (32 + (32 * i)));
