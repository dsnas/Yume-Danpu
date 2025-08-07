
// Render (self-drawing)
if (render.act == true)
{
	if (render.imgSpd > 0)
	{
		image_index += render.imgSpd;
		if (global.config_rdcdMot == true)
			image_index = 0;
	}
	
	fn_draw_spr(sprite_index, image_index, (render.x + render.xOfs), (render.y + render.yOfs), image_blend, image_alpha, render.xSc, render.ySc, render.ang, false);
}
