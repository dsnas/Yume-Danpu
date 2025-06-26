
//////// Functions related to the pause menu


// Functions related to configing up the menu
function fn_menu_pse_evCreate()
{
	// Main level
	LVL_MAIN = 0;
	var l = LVL_MAIN;
	lvlTrans_tgt = l;
	
		// Dark translucent background
	rect_x[l, 0] = 0;
	rect_y[l, 0] = 0;
	rect_w[l, 0] = 320;
	rect_h[l, 0] = 240;
	rect_col[l, 0] = global.thm_col[global.thm_cur].black;
	rect_alp[l, 0] = 0.75;
	
		// Title
	fn_menu_ttl_add(l, fn_getText("menu_pse_main_ttl"));
	
		// Options [#0]
	fn_menu_opt_addText(l, "menu_pse_main_opt_");
	fn_log(opt_text[l, 0]);
	var _opt_yDist = draw_dist;
	var _opt_hAll = (_opt_yDist * (opt_amt[l] - 1) + global.game_fnt_h);
	
		// Box
	var _box_wDist = round(draw_dist * 1.5);
	var _box_hDist = draw_dist;
	box_w[l, 0] = (_box_wDist + opt_wMax[l] + _box_wDist);
	box_h[l, 0] = (_box_hDist + _opt_hAll + _box_hDist);
	
	var _box_yDist = draw_dist;
	box_x[l, 0] = (160 - round(box_w[l, 0] / 2));
	box_y[l, 0] = (120 + _box_yDist - round(box_h[l, 0] / 2));
	
		// Options [#1]
	for (var o = 0; o < opt_amt[l]; o++)
	{
		opt_x[l, o] = (box_x[l, 0] + round(box_w[l, 0] / 2) - round(opt_w[l, o] / 2));
		opt_y[l, o] = (box_y[l, 0] + round(box_h[l, 0] / 2) - round(_opt_hAll / 2) + (_opt_yDist * o));
		
		fn_menu_optSlctr_add(l, o);
	}
	opt_cncl_key_idx[l, 1] = CONFIG_KEY_IDX.MENU_PSE;
	
	
	
	
	// Takes a screenshot of the game to use as the background, since all objects will temporarily deactivate and disappear
	sshot_spr = -1;
	if (global.config_lowGfx == false) // Checks if the low graphics configing is enabled, since taking a screenshot can freeze the game for half a second
	{
		sshot_fname = "menu_pause_sshot.png"; 
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
	fn_aud_play(global.thm_opt_slct_snd[global.thm_cur], CONFIG_VOLTYPE.MENU);
}
function fn_menu_pse_DrawGUI_0(l)
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
		{
			_opt_slct_snd = opt_cncl_snd[lvl];
			fn_menu_pse_resume();
		}
		
		// "Settings"
		if (opt_move_pos[lvl] == 1)
		{
			
		}
		
		// "Instructions"
		if (opt_move_pos[lvl] == 2)
			_opt_slct_snd = global.thm_opt_fail_snd[global.thm_cur];
		
		// "Quit to Menu"
		if (opt_move_pos[lvl] == 3)
		{
			fn_rmTrans_start();
			opt_move_act[lvl] = false;
			opt_slct_act[lvl] = false;
			opt_cncl_act[lvl] = false;
		}
	}
}
function fn_menu_pse_opt_cncl()
{
	// Main level
	if (lvl == LVL_MAIN)
	{
		_opt_cncl_snd = opt_cncl_snd[lvl];
		fn_menu_pse_resume();
	}
}


// Functions unrelated to the core menu system
function fn_menu_pse_resume()
{
	fn_menu_lvlTrans_start(lvl_amtMax, , , true);
	
	// Deletes the screenshot
	if (sshot_spr != -1)
	{
		if (file_exists(sshot_fname) == true)
			file_delete(sshot_fname);
		if (sprite_exists(sshot_spr) == true)
			sprite_delete(sshot_spr);
		sshot_spr = -1;
	}
	
	// Activates everything in the room
	instance_activate_all();
	audio_resume_all();
	
	// Unfreezes the player
	obj_player.move_stg = -1;
}
