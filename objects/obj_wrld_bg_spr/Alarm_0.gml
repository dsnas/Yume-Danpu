/// @descr [delayed create]

draw_act = true;


if (draw_rpt == true) // (if background repeats)
{
	if (draw_rpt_autoDist == true) // (retrieve repetition distance based on the sprite's width and height)
	{
		draw_rpt_xDist = fn_spr_w(draw_spr);
		draw_rpt_yDist = fn_spr_h(draw_spr);
	}
	draw_rpt_xDist *= draw_xSc;
	draw_rpt_yDist *= draw_ySc;
	
	
	if (draw_rpt_amtAuto == true) // (retrieve repetition amount based on the camera's width or height)
	{
		draw_rpt_amt = (wrld_chara.cam_w / draw_rpt_xDist);
		if (draw_rpt_xDist > draw_rpt_yDist)
			draw_rpt_amt = (wrld_chara.cam_h / draw_rpt_yDist);
		
		draw_rpt_amt += 1;
	}
}


if (draw_move == true) // (if background moves)
{
	if (draw_move_autoSpd == true) // (retrieve movement speed based on the repetition amount and movement duration)
	{
		draw_move_xSpd = (draw_rpt_xDist / draw_move_xDur);
		draw_move_ySpd = (draw_rpt_yDist / draw_move_yDur);
	}
}
