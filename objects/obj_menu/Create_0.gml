
fn_obj_img( , , , , 0);
fn_obj_depth( , -10000);

fn_key_quick();


draw_x = 0;
draw_y = 0;
draw_dist = 16;
draw_alp = 1;


fn_menu_getId();


// Levels, the different sections of the menu the player can navigate through (like "Effects", "Items" and "Themes" from the inventory, or "Start" from the main menu)
lvl_lenMax = 10; // Maximum amount of levels there can be

LVL_EMPTY = lvl_lenMax; // Index of the menu level that should remain empty (outside the range of most for() loops)
lvl = LVL_EMPTY; // Index of the current menu level


// Levels and their rectangles, boxes, options, information and titles
for (var l = 0; l < (lvl_lenMax + 1); l++)
{
	// Levels
	lvl_alp[l] = 0; // Alpha of all elements drawn at the level
	lvl_alpDelay[l] = 0; // Duration of the delay for the level's alpha to be updated
	lvl_alpSpd = 0.2; // Speed of the level's alpha transition
	
	lvl_alpTgt_selfDstr[l] = false; // Determines if the menu will destroy itself after the current level reaches its target alpha
	lvl_alpTgt_gameEnd[l] = false; // Determines if the menu will end the game after the current level reaches its target alpha
	
	
	// Rectangles
	rect_len[l] = 0;
	fn_menu_rect_add(l, 0);
	
	// Boxes
	box_len[l] = 0;
	fn_menu_box_add(l, 0);
	
	// Options
	opt_len[l] = 0;
	fn_menu_opt_add(l, 0);
	fn_menu_opt_slctr_add(l, 0); // Option selector
	fn_menu_opt_desc_add(l, 0); // Options' description
	fn_menu_opt_config_add(l, 0); // Options' settings
	fn_menu_opt_config_slctr_add(l, 0); // Selector of the options' settings
	
	// Information
	info_len[l] = 0;
	fn_menu_info_add(l, 0);
	
	// Titles
	fn_menu_ttl_add(l);
}


// Level transition sequence
fn_menu_lvlNew(); // There's no need for the child menu to call this function again, it only needs to set "lvlTrans_tgt" to the child's main level


config_langOld = global.config_langCurr;
thmOld = global.player.thm_curr;


fn_menu_evCreate_0();
fn_menu_evCreate_1();
