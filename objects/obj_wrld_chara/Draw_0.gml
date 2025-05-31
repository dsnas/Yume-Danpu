
fn_draw_self(draw_x, draw_y, draw_xSc, draw_ySc, draw_ang);




if (global.dbg_act == true)
{
	draw_set_color(c_red);
	draw_set_alpha(0.5);
	draw_rectangle(move_xAhead[move_fac], move_yAhead[move_fac], (move_xAhead[move_fac] + 16), (move_yAhead[move_fac] - 16), 1);
}
