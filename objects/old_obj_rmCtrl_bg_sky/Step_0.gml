
// Movement of the background
if (global.config_rdcdMot == false)
{
	sky_x += sky_move_xSpd;
	if (round(sky_x) == round(sky_move_xTgt))
		sky_x = sky_move_xStart;
	
	sky_y += sky_move_ySpd;
	if (round(sky_y) == round(sky_move_yTgt))
		sky_y = sky_move_yStart;
}
else
{
	sky_x = sky_move_xStart;
	sky_y = sky_move_yStart;
}
