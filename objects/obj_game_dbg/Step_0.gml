
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
		if (fn_exists(wrld_chara) == true)
		{
			wrld_chara.cam_w -= 8;
			wrld_chara.cam_h -= 6;
		}
	}
	else if (keyboard_check(ord("O")) == true) // [chara] (zooms out)
	{
		if (fn_exists(wrld_chara) == true)
		{
			wrld_chara.cam_w += 8;
			wrld_chara.cam_h += 6;
		}
	}
	
	if (keyboard_check_pressed(ord("R")) == true) // (restarts game)
		game_restart();
	
	if (keyboard_check_pressed(ord("P")) == true) // (plays the player footstep sound)
		fn_aud_play(snd_wrld_chara_foot, SETT_VOL.CHARA);
}
