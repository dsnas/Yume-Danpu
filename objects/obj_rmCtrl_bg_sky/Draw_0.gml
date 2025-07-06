
// Draws the background
for (var _x = 0; _x < sky_loop_xAmt; _x++)
{
	for (var _y = 0; _y < sky_loop_yAmt; _y++)
	{
		var _sky_loop_xAdd = (sky_loop_xDist * (_x - sky_loop_xAmt_outRm));
		var _sky_loop_yAdd = (sky_loop_yDist * (_y - sky_loop_yAmt_outRm));
		
		fn_draw_spr_stretch(sky_spr, sky_img, (sky_x + _sky_loop_xAdd), (sky_y + _sky_loop_yAdd), sky_w, sky_h, sky_col, sky_alp);
	}
}


// Animates the background
if (sky_imgSpd > 0)
{
	image_index += sky_imgSpd;
	if (global.config_rdcdMot == true)
		image_index = 0;
}
