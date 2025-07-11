
if (string_ends_with(keyboard_string, global.dbg_actPwd) == true)
{
	global.dbg_act = !global.dbg_act;
	keyboard_string = "";
}


if (global.dbg_act == true && keyboard_check(global.dbg_cmd_key) == true)
{
	if (keyboard_check_pressed(ord("M")) == true)
		show_debug_overlay(!is_debug_overlay_open());
	
	if (keyboard_check(ord("G")) == true)
	{
		for (var i = 0; i < array_length(global.dbg_cmd_rm); i++)
		{
			if (keyboard_check_pressed(ord(i)) == true)
				room_goto(global.dbg_cmd_rm[i]);
		}
	}
	
	if (keyboard_check(ord("I")) == true)
	{
		if (fn_obj_exists(obj_rmCtrl) == true)
		{
			obj_rmCtrl.cam_w -= 8;
			obj_rmCtrl.cam_h -= 6;
		}
	}
	else if (keyboard_check(ord("O")) == true)
	{
		if (fn_obj_exists(obj_rmCtrl) == true)
		{
			obj_rmCtrl.cam_w += 8;
			obj_rmCtrl.cam_h += 6;
		}
	}
	
	if (keyboard_check_pressed(ord("D")) == true)
		file_delete(global.config_file_name);
	
	if (keyboard_check_pressed(ord("R")) == true)
		game_restart();
}
