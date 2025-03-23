
if (active == true)
{
	if (draw_move == true) // movement
	{
		draw_x += draw_move_xSpd;
		if (draw_x >= draw_rpt_xDist)
			draw_x = 0;
				
		draw_y += draw_move_ySpd;
		if (draw_y >= draw_rpt_yDist)
			draw_y = 0;
	}

	if (draw_rpt == false) // doesn't repeat
	{
		fn_draw_spr(draw_spr, draw_img, draw_x, draw_y, draw_xSc, draw_ySc, draw_ang, draw_col, draw_alp);
	}
	else if (draw_rpt == true) // does repeat
	{
		var _rpt_x = (draw_x - (draw_rpt_xDist * draw_rpt_amt) );
		var _rpt_y = (draw_y - (draw_rpt_yDist * draw_rpt_amt) );
	
		var _rpt_hAmt = (draw_rpt_amt + (wrld_w / draw_rpt_xDist) + draw_rpt_amt);
		var _rpt_vAmt = (draw_rpt_amt + (wrld_h / draw_rpt_yDist) + draw_rpt_amt);
	
		for (var h = 0; h < _rpt_hAmt; h++)
		{
			for (var v = 0; v < _rpt_vAmt; v++)
				fn_draw_spr(draw_spr, draw_img, _rpt_x + (draw_rpt_xDist * h), _rpt_y + (draw_rpt_yDist * v), draw_xSc, draw_ySc, draw_ang, draw_col, draw_alp);
		}
	}
}
