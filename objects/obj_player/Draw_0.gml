
fn_draw_self();

if (self_custom == true)
{
	// Items
	if (global.itm == ITM.KART) // Kart
	{	
		var _self_x = self_x;
		var _self_y = self_y;
		if (move_slide_shk_durCurr > 0)
		{
			_self_x += irandom_range(-move_slide_shk_dist, move_slide_shk_dist);
			_self_y += irandom_range(-move_slide_shk_dist, move_slide_shk_dist);
			move_slide_shk_durCurr -= 1;
		}
				
		fn_draw_spr(spr_itm_kart_0, dir, _self_x, _self_y);
		fn_draw_spr_part(sprite_index, image_index, 0, 4, 16, 17, _self_x, (_self_y - sprite_height + 5), image_blend, image_alpha, self_xSc, self_ySc);
		fn_draw_spr(spr_itm_kart_1, dir, _self_x, _self_y);
	}
}
