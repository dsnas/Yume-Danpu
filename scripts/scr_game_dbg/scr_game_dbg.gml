
function fn_game_dbg_create() // create event
{
	global.dbg = true;
	global.dbg_rm = rm_wrld_pikini;
	
	show_debug_overlay(global.dbg);
}

function fn_game_dbg_step() // step event
{
	if (string_ends_with(keyboard_string, "hunter2") == true) // toggle debug mode on/off
	{
		global.dbg = !global.dbg;
		keyboard_string = "";
	}
	
	
	if (global.dbg == true)
	{
		if (keyboard_check_pressed(ord("G")) == 1) // go to the desired room
		{
			audio_stop_all();
			room_goto(global.dbg_rm);
		}
		
		
		// (chara) zoom in
		if (keyboard_check(ord("I")) == 1)
		{
			if (fn_exists(wrld_chara) == true)
			{
				wrld_chara.cam_w -= 8;
				wrld_chara.cam_h -= 6;
			}
		}
	
		// (chara) zoom out
		else if (keyboard_check(ord("O")) == 1)
		{
			if (fn_exists(wrld_chara) == true)
			{
				wrld_chara.cam_w += 8;
				wrld_chara.cam_h += 6;
			}
		}
	
		// restart game
		if (keyboard_check_pressed(ord("R")) == 1)
			game_restart();
	}
}

function fn_game_dbg_draw() // draw debugging info
{
	if (global.dbg == true)
	{
		fn_draw_txt(":3", 32, 64, 0.5, 0.5, 0, c_white, c_white, c_white, c_white, 1);
		
		//draw_text_transformed(32, 64, "", 0.5, 0.5, 0);
	}
}












