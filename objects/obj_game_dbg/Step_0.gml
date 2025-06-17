
if (global.dbg_act == false) || (global.dbg_act == true)
{
	if (string_ends_with(keyboard_string, global.dbg_pwd) == true) // (toggles debug mode on)
	{
		global.dbg_act = !global.dbg_act;
		keyboard_string = "";
	}
}


if (global.dbg_act == true && keyboard_check(global.dbg_mod) == true)
{
	if (keyboard_check_pressed(ord("G")) == true) // (goes to desired room)
		room_goto(global.dbg_rm);
	
	if (keyboard_check(ord("I")) == true) // [chara] (zooms in)
	{
		if (fn_obj_exists(obj_player) == true)
		{
			obj_player.cam_w -= 8;
			obj_player.cam_h -= 6;
		}
	}
	else if (keyboard_check(ord("O")) == true) // [chara] (zooms out)
	{
		if (fn_obj_exists(obj_player) == true)
		{
			obj_player.cam_w += 8;
			obj_player.cam_h += 6;
		}
	}
	
	if (keyboard_check_pressed(ord("R")) == true) // (restarts game)
		game_restart();
}
