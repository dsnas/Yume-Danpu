
// Movement of the background
if (global.config_rdcdMot == false)
{
	clouds_x += clouds_move_xSpd;
	if (round(clouds_x) == round(clouds_move_xTgt))
		clouds_x = clouds_move_xStart;
	
	clouds_y += clouds_move_ySpd;
	if (round(clouds_y) == round(clouds_move_yTgt))
		clouds_y = clouds_move_yStart;
}
else
{
	clouds_x = clouds_move_xStart;
	clouds_y = clouds_move_yStart;
}