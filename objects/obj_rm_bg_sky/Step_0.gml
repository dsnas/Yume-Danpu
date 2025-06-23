
if (sky_loop_act == true)
{
	if (sky_loop_move_xAct == true)
	{
		sky_x += sky_loop_move_xSpd;
		if (round(sky_x) == round(sky_loop_move_xTgt))
			sky_x = sky_loop_move_xStart;
	}
	
	if (sky_loop_move_yAct == true)
	{
		sky_y += sky_loop_move_ySpd;
		if (round(sky_y) == round(sky_loop_move_yTgt))
			sky_y = sky_loop_move_yStart;
	}
	
	
	if (global.dbg_act == true && global.dbg_excessLog == true)
		fn_log($"x = {sky_x} | y = {sky_y} | xTgt = {sky_loop_move_xTgt} | yTgt = {sky_loop_move_yTgt}");
}
