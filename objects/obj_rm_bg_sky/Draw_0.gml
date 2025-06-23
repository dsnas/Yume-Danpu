
var _sky_loop_xAmt = 1;
var _sky_loop_yAmt = 1;
if (sky_loop_act == true)
{
	_sky_loop_xAmt = sky_loop_xAmt;
	_sky_loop_yAmt = sky_loop_yAmt;
}


for (var _x = 0; _x < _sky_loop_xAmt; _x++)
{
	for (var _y = 0; _y < _sky_loop_yAmt; _y++)
	{
		var _sky_loop_xDist = 0;
		var _sky_loop_yDist = 0;
		if (sky_loop_act == true)
		{
			_sky_loop_xDist = (sky_loop_xDist * (_x - 2));
			_sky_loop_yDist = (sky_loop_yDist * (_y - 2));
		}
		
		fn_draw_spr(sky_spr, sky_img, (sky_x + _sky_loop_xDist), (sky_y + _sky_loop_yDist), sky_col, sky_alp, sky_xSc, sky_ySc, sky_ang, false);
	}
}
