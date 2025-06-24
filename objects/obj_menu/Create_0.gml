
fn_obj_img( , , , , 0);
fn_obj_depth( , -10000);


draw_x = 0;
draw_y = 0;
draw_dist = 16;
draw_alp = 1;


fn_menu_getId();


// Levels, the different sections of the menu the player can navigate through, like "Effects", "Items" and "Themes" from the inventory, or "Start" from the main menu
lvl_amtMax = 10;	// Maximum amount of levels there can be
lvl = lvl_amtMax;	// Index of the current menu level
/*
	The default menu level equals the maximum amount of levels there can be, since for() loops will NOT go through it.
	The default menu level needs to be empty because of the transition sequence.
*/
for (var l = 0; l < (lvl_amtMax + 1); l++) // This is the only for() loop that goes through the default menu level, as it just to set up variables and not to draw anything
	lvl_alp[l] = 0; // Alpha of everything that's being drawn in that level


// Transition sequence between menu levels
fn_menu_lvlTrans_start(-1);	// !!!!!!!!! The menu extension only needs to redefine "lvlTrans_lvlTgt" to its main level index, there's no need to repeat the function


// Rectangles, boxes, options, information and titles (Per-level)
for (var l = 0; l < lvl_amtMax; l++)
{
	// Rectangles
	rect_amtMax[l] = 10;
	for (var r = 0; r < rect_amtMax[l]; r++)
		fn_menu_rect_add(l, r, 0, 0, 0, 0);
	
	
	// Boxes
	box_spr = global.thm_box_spr[global.thm_cur];
	box_amtMax[l] = 10;
	for (var b = 0; b < box_amtMax[l]; b++)
		fn_menu_box_add(l, b, 0, 0, 0, 0);
	
	
	// Options and their selector
	opt_amtMax[l] = 10;		// Maximum amount of options there can be
	opt_amt[l] = 0;			// Amount of options there currently is
	for (var o = 0; o < opt_amtMax[l]; o++)
	{
		fn_menu_opt_add(l, o, "%%%", 0, 0);
		fn_menu_optSlctr_add(l, o);
	}
	opt_colSpd = 1;												// Speed of the selection animation (NOT per-level) (1 == instantaneous)
	optSlctr_spr = global.thm_optSlctr_spr[global.thm_cur];		// Sprite of the selector (NOT per-level)
	
	// Option movement
		// ID numbers of each type of option movement
	OPT_MOVE_TYPE_dfltVer = 0;	// Vertical default
	OPT_MOVE_TYPE_dfltHor = 1;	// Horizontal default
	OPT_MOVE_TYPE_invList = 2;	// Inventory's effects, items and themes list
	opt_move_type[l] = OPT_MOVE_TYPE_dfltVer;	// ID of the type of option movement
	
	opt_move_act[l] = true;										// Determines if the player can move through the options
	opt_move_pos[l] = 0;										// Index of the player's current position in the array of options
	opt_move_snd[l] = global.thm_opt_move_snd[global.thm_cur];	// Option movement sound
	
	// Option selection
	opt_slct_act[l] = true;										// Determines if the player can select any options
	opt_slct_snd[l] = global.thm_opt_slct_snd[global.thm_cur];	// Sound
	
	// Option cancellation
	opt_cncl_act[l] = true;										// Determines if the player can cancel the last option selection
	opt_cncl_snd[l] = global.thm_opt_cncl_snd[global.thm_cur];	// Sound
	opt_cncl_key_idx[l, 0] = CONFIG_KEY_IDX.CNCL;						// Key to check for input
	
	
	// Information, text that can't be interacted with in any way, like "Eleanor" in the inventory
	info_amtMax[l] = 10;
	for (var i = 0; i < info_amtMax[l]; i++)
		fn_menu_info_add(l, i, "%%%", 0, 0);
	
	
	// Titles
	fn_menu_ttl_add(l, "%%%");
}


fn_menu_evCreate();
