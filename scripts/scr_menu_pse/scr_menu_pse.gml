
//////// Functions related to the pause menu


// Functions related to setting up the menu
function fn_menu_pse_evCreate_0()
{
	// Main level
	LVL_MAIN = 0;
	var l = LVL_MAIN;
	
		// Title
	fn_menu_ttl_add(l, fn_getText("menu_pse_main_ttl"));
	
		// Options [#0]
	fn_menu_opt_add_ext(l, "menu_pse_main_opt_");
	var _opt_yDist = draw_dist;
	var _opt_hAll = (_opt_yDist * (opt_amt[l] - 1) + global.GAME_FNT_H);
	
		// Box
	var _box_wDist = round(draw_dist * 1.5);
	var _box_hDist = draw_dist;
	var _box_w = (_box_wDist + opt_wMax[l] + _box_wDist);
	var _box_h = (_box_hDist + _opt_hAll + _box_hDist);
	
	var _box_yDist = draw_dist;
	var _box_x = (160 - round(_box_w / 2));
	var _box_y = (120 + _box_yDist - round(_box_h / 2));
	
	fn_menu_box_add(l, 0, _box_x, _box_y, _box_w, _box_h);
	
		// Options [#1]
	for (var o = 0; o < opt_amt[l]; o++)
	{
		opt_x[l, o] = (box_x[l, 0] + round(box_w[l, 0] / 2) - round(opt_w[l, o] / 2));
		opt_y[l, o] = (box_y[l, 0] + round(box_h[l, 0] / 2) - round(_opt_hAll / 2) + (_opt_yDist * o));
		fn_menu_opt_slctr_add(l, o);
	}
	opt_slct_snd[l, 2] = global.thm_opt_fail_snd[global.thm];
	
	
	
	
	// All levels
	for (var l = 0; l < lvl_amtMax; l++)
	{
		// Dark translucent background
		fn_menu_rect_add(l, 0, 0, 0, 320, 240, global.thm_col[global.thm].black, 0.75);
	}
}
function fn_menu_pse_evCreate_1()
{
	fn_obj_depth( , (depth + 1));
	
	
	// Main level
	lvl = LVL_MAIN;
	lvl_alp[lvl] = 0.1;
	
	
	// Takes a screenshot of the game to use as the background, since all objects will temporarily deactivate and disappear
	sshot_spr = -1;
	if (global.config_lowGfx == false) // Checks if the low graphics configing is enabled, since taking a screenshot can freeze the game for half a second
	{
		sshot_fname = "menu_pse_sshot.png"; 
		surface_save(application_surface, working_directory + string(sshot_fname));
		sshot_spr = sprite_add(sshot_fname, 1, false, false, 0, 0);
		sshot_xSc = 0.5;
		sshot_ySc = 0.5;
	}
	
	// Deactivates/Pauses everything in the room, excluding the ones that should persist
	instance_deactivate_all(true);
	instance_activate_object(obj_game_main);
	instance_activate_object(obj_game_dbg);
	instance_activate_object(obj_rm);
	audio_pause_all();
	fn_aud_play(global.thm_opt_slct_snd[global.thm], CONFIG_VOLTYPE.MENU);
}
function fn_menu_pse_evDrawGUI_0(l)
{
	// Draws the screenshot
	if (sshot_spr != -1)
		draw_sprite_ext(sshot_spr, 0, 0, 0, sshot_xSc, sshot_ySc, 0, c_white, 1);
}


// Functions related to the options
function fn_menu_pse_opt_slct()
{
	// Main level
	if (lvl == LVL_MAIN)
	{
		// "Resume"
		if (opt_move_pos[lvl] == 0)
			fn_menu_pse_resume();
		
		// "Options"
		else if (opt_move_pos[lvl] == 1)
		{
			fn_menu_lvlNew(LVL_EMPTY);
			fn_menu_obj_create("config");
		}
		
		// "Quit to Menu"
		else if (opt_move_pos[lvl] == 3)
		{
			opt_move_act[lvl] = false;
			opt_slct_act[lvl] = false;
			opt_cncl_act[lvl] = false;
			fn_rmTrans_start();
			fn_menu_pse_sshot_delete();
		}
	}
}
function fn_menu_pse_opt_cncl()
{
	// Main level
	if (lvl == LVL_MAIN)
		fn_menu_pse_resume();
}


// Functions unrelated to the core menu system
function fn_menu_pse_sshot_delete() // Deletes the image file of the screenshot
{
	if (sshot_spr != -1)
	{
		if (file_exists(sshot_fname) == true)
			file_delete(sshot_fname);
		if (sprite_exists(sshot_spr) == true)
			sprite_delete(sshot_spr);
		sshot_spr = -1;
	}
}
function fn_menu_pse_resume() // Resumes the game
{
	fn_menu_pse_sshot_delete();
	
	instance_activate_all();
	audio_resume_all();
	obj_player.move_stg = -1;
	
	fn_menu_lvlNew(LVL_EMPTY, , true);
}
