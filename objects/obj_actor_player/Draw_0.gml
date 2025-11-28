
event_inherited();


if (myself.draw.act == false)
{
	if (global.player.fcn_curr != -1) // An item is equipped
	{
		switch (global.player.fcn_curr)
		{
			// Kart item
			case PLAYER_FCN.KART:			
				var _x = (myself.x + myself.xOfs);
				var _y = (myself.y + myself.yOfs);
				fn_draw_spr(temp_spr_player_fcn_kart_0, dir_curr, _x, _y);
				fn_draw_spr_part(sprite_index, image_index, 0, 4, sprite_width, 17, _x, (_y - sprite_height + 5), image_blend, image_alpha, myself.xSc, myself.ySc);
				fn_draw_spr(temp_spr_player_fcn_kart_1, dir_curr, _x, _y);
				break;
		}
	}
}
