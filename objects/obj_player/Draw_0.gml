
fn_draw_self();




if (global.dbg_act == true)
{
	draw_set_alpha(0.5);
	
	draw_set_color(c_red);
	draw_rectangle(move_dir_x[move_dir], move_dir_y[move_dir], (move_dir_x[move_dir] + 16), (move_dir_y[move_dir] - 16), 1);
	
	draw_set_color(c_blue);
	draw_rectangle((x - 16), (y - 32), (x + 32), (y + 16), 1);
}
