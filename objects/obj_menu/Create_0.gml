
fn_obj_img( , , , , 0);
fn_obj_depth( , -10000);


draw_x = 0;
draw_y = 0;
draw_dist = 16;
draw_alp = 1;


fn_menu_getId();


// Levels, the different sections of the menu the player can navigate through (like "Effects", "Items" and "Themes" from the inventory, or "Start" from the main menu)
lvl_amtMax = 10; // Maximum amount of levels there can be

LVL_EMPTY = lvl_amtMax; // Index of the menu level that should remain empty (outside the range of the for() loop)
lvl = LVL_EMPTY; // Index of the current menu level

for (var l = 0; l < (lvl_amtMax + 1); l++) // This is the only for() loop that covers the empty menu level, as it only sets up variables and doesn't draw anything
	lvl_alp[l] = 0; // Alpha of all elements drawn at that menu level


// Level transition sequence
fn_menu_lvlTrans_start(0);	// There's no need for the child menu to call this function again, it only needs to set "lvlTrans_tgt" to the child's main level


// Rectangles, boxes, options, information and titles
for (var l = 0; l < lvl_amtMax; l++)
{
	// Rectangles
	rect_amt[l] = 0;
	fn_menu_rect_add(l, 0);
	
	// Boxes
	box_amt[l] = 0;
	fn_menu_box_add(l, 0);
	
	// Options
	opt_amt[l] = 0;
	fn_menu_opt_add(l, 0);
	fn_menu_opt_slctr_add(l, 0); // Option selector
	fn_menu_opt_desc_add(l, 0); // Options' description
	fn_menu_opt_config_add(l, 0); // Options' settings
	fn_menu_opt_config_slctr_add(l, 0); // Selector of the options' settings
	
	// Information
	info_amt[l] = 0;
	fn_menu_info_add(l, 0);
	
	// Titles
	fn_menu_ttl_add(l);
}


fn_menu_evCreate();
