
if (string_ends_with(keyboard_string, global.dbg_actPwd) == true)
{
	global.dbg_act = !global.dbg_act;
	keyboard_string = "";
}


// Commands
if (global.dbg_act == true && keyboard_check(global.dbg_cmd_key) == true)
{
	// Restarts game
	if (keyboard_check_pressed(ord("R")) == true)
		game_restart();
	
	
	// Commands that require obj_rmCtrl in the room
	if (fn_obj_exists(obj_rmCtrl) == true)
	{
		// Zooms the camera in/out
		if (keyboard_check(ord("I")) == true)
		{
			obj_rmCtrl.cam_w -= 8;
			obj_rmCtrl.cam_h -= 6;
		}
		else if (keyboard_check(ord("O")) == true)
		{
			obj_rmCtrl.cam_w += 8;
			obj_rmCtrl.cam_h += 6;
		}
	}
	
	
	// Toggles the drawings of Debug Mode
	if (keyboard_check_pressed(ord("H")) == true)
		global.dbg_hud_act = !global.dbg_hud_act;
	
	
	// Deletes a saved file previously
	if (keyboard_check_pressed(ord("P")) == true && file_exists(global.player_file.name) == true)
		fn_player_file_erase();
	
	
	if (keyboard_check_pressed(ord("G")) == true)
		fn_obj_create(obj_fader);
}
