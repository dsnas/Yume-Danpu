
if (global.dbg_act == false) || (global.dbg_act == true)
{
	if (string_ends_with(keyboard_string, global.dbg_pwd) == true)
	{
		global.dbg_act = !global.dbg_act;
		keyboard_string = "";
	}
}


if (global.dbg_act == true && keyboard_check(global.dbg_mod) == true)
{
	if (keyboard_check(ord("G")) == true)
	{
		for (var i = 0; i < array_length(global.dbg_rm); i++)
		{
			if (keyboard_check_pressed(ord(i)) == true)
				room_goto(global.dbg_rm[i]);
		}
	}
	
	if (keyboard_check(ord("I")) == true)
	{
		if (fn_obj_exists(obj_player) == true)
		{
			obj_player.cam_w -= 8;
			obj_player.cam_h -= 6;
		}
	}
	else if (keyboard_check(ord("O")) == true)
	{
		if (fn_obj_exists(obj_player) == true)
		{
			obj_player.cam_w += 8;
			obj_player.cam_h += 6;
		}
	}
	
	if (keyboard_check_pressed(ord("R")) == true)
		game_restart();
}
