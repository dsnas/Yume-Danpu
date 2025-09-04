
// Draws the background
for (var _x = 0; _x < clouds_loop_xLen; _x++)
{
	for (var _y = 0; _y < clouds_loop_yLen; _y++)
	{
		var _clouds_loop_xAdd = (clouds_loop_xDist * (_x - clouds_loop_xLen_outRm));
		var _clouds_loop_yAdd = (clouds_loop_yDist * (_y - clouds_loop_yLen_outRm));
		
		fn_draw_spr(clouds_spr, clouds_img, (clouds_x + _clouds_loop_xAdd), (clouds_y + _clouds_loop_yAdd), clouds_col, clouds_alp, clouds_xSc, clouds_ySc, clouds_ang, false);
	}
}


// Animates the background
if (clouds_imgSpd > 0)
{
	image_index += clouds_imgSpd;
	if (global.config_rdcdMot == true)
		image_index = 0;
}