
if (global.dbg_act == true) || (room == rm_dbgwrld)
{
	draw_set_color(c_red);
	draw_set_alpha(0.5);
	
	
	draw_line(0, 0, room_width, 0);
	draw_line(room_width, 0, room_width, room_height);
	draw_line(room_width, room_height, 0, room_height);
	draw_line(0, room_height, 0, 0);
	
	
	if (fn_obj_exists(obj_player) == true)
	{
		with (obj_player)
		{
			draw_set_alpha(0.5);
	
			//draw_set_color(c_red);
			//draw_rectangle(move_dir_x[move_dir], move_dir_y[move_dir], (move_dir_x[move_dir] + 16), (move_dir_y[move_dir] - 16), 1);
	
			draw_set_color(c_blue);
			draw_rectangle((x - 16), (y - 32), (x + 32), (y + 16), 1);
		}
	}
}
