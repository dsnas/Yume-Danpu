
active = true;

if (draw_rpt == true) // repetition
{
	if (draw_rpt_autoDist == true) // automatically get repetition distance
	{
		draw_rpt_xDist = fn_spr_w(draw_spr);
		draw_rpt_yDist = fn_spr_h(draw_spr);
	}
	draw_rpt_xDist *= draw_xSc;
	draw_rpt_yDist *= draw_ySc;
	
	if (draw_rpt_autoAmt == true) // automatically get repetition amount
	{
		draw_rpt_amt = (wrld_chara.cam_w / draw_rpt_xDist);
		if (draw_rpt_xDist > draw_rpt_yDist)
			draw_rpt_amt = (wrld_chara.cam_h / draw_rpt_yDist);
		
		draw_rpt_amt += 1;
	}
}

if (draw_move == true) // movement
{
	if (draw_move_autoSpd == true) // automatically get movement speed
	{
		draw_move_xSpd = (draw_rpt_xDist / draw_move_xTime);
		draw_move_ySpd = (draw_rpt_yDist / draw_move_yTime);
	}
}
