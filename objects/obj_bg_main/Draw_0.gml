
// Loops through each phase of the drawing order until the maximum amount is reached
for (var dO = 0; dO < drawOrder_amtMax; dO++)
{
	// Draws lands
	for (var i = 0; i < array_length(land_spr); i++)
	{
		if (dO == land_drawOrder[i] && land_spr[i] != -1)
		{
			if (land_move_act[i] == true)
			{
				
			}
			
			
			if (land_loop_act[i] == false)
				fn_draw_spr(land_spr[i], land_img[i], land_x[i], land_y[i], land_col[i], land_alp[i], land_xSc[i], land_ySc[i], land_ang[i], false);
			else
			{
				var _loop_xAmt = land_loop_amt[i]
				var _loop_yAmt = land_loop_amt[i]
				
				for (var xx = 0; xx < _loop_xAmt; xx++)
				{
					for (var yy = 0; yy < _loop_yAmt; yy++)
					{
						fn_draw_spr(land_spr[i], land_img[i], land_x[i] + (land_loop_xDist[i] * xx), land_y[i] + (land_loop_yDist[i] * yy), land_col[i], land_alp[i], land_xSc[i], land_ySc[i], land_ang[i], false);
					}
				}
			}
			
			
			/*
			if (land_loop_act[i] == false)
				fn_draw_spr(land_spr[i], land_img[i], land_x[i], land_y[i], land_col[i], land_alp[i], land_xSc[i], land_ySc[i], land_ang[i], false);
			else if (land_loop_act[i] == true)
			{
				var _loop_x = (land_x[i] - (land_loop_xDist[i] * land_loop_amt[i]));
				var _loop_y = (land_y[i] - (land_loop_yDist[i] * land_loop_amt[i]));
	
				var _loop_xAmt = (land_loop_amt[i] + (room_width / land_loop_xDist[i]) + land_loop_amt[i]);
				var _loop_yAmt = (land_loop_amt[i] + (room_height / land_loop_yDist[i]) + land_loop_amt[i]);
	
				for (var xx = 0; xx < _loop_xAmt; xx++)
				{
					for (var yy = 0; yy < _loop_yAmt; yy++)
						fn_draw_spr(land_spr[i], land_img[i], (_loop_x + (land_loop_xDist[i] * xx)), (_loop_y + (land_loop_yDist[i] * yy)), land_col[i], land_alp[i], land_xSc[i], land_ySc[i], land_ang[i], false);
				}
			}
			*/
		}
	}
}




if (global.dbg_act == true)
{
	draw_set_color(c_red);
	draw_set_alpha(0.5);
	draw_line(0, 0, room_width, 0);
	draw_line(room_width, 0, room_width, room_height);
	draw_line(room_width, room_height, 0, room_height);
	draw_line(0, room_height, 0, 0);
}

