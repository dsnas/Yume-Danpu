
//////// Functions related to drawing


// For drawing text
function fn_draw_text(_text, _x, _y, _col_0, _col_1, _alp = 1, _vAl = fa_top, _hAl = fa_left, _xSc = 1, _ySc = 1, _ang = 0)
{
	var _fnt = global.GAME_FNT;
	draw_set_font(_fnt);
	draw_set_valign(_vAl);
	draw_set_halign(_hAl);
	
	var _shadow_col = global.player_thm[global.player_thmCurr].col.shadow;
	var _shadow_alp = (global.player_thm[global.player_thmCurr].alp.shadow * _alp);
	draw_text_ext_transformed_color((_x + 1), (_y + 1), _text, -1, 640, _xSc, _ySc, _ang, _shadow_col, _shadow_col, _shadow_col, _shadow_col, _shadow_alp);
	
	draw_text_ext_transformed_color(_x, _y, _text, -1, 640, _xSc, _ySc, _ang, _col_0, _col_0, _col_1, _col_1, _alp);
}


// For drawing rectangles
function fn_draw_rect(_x, _y, _w, _h, _col_0, _col_1, _col_2, _col_3, _alp)
{
	draw_sprite_general(spr_px, 0, 0, 0, 1, 1, _x, _y, _w, _h, 0, _col_0, _col_1, _col_2, _col_3, _alp);
}


// For drawing sprites
function fn_draw_spr(_spr, _img, _x, _y, _col = c_white, _alp = 1, _xSc = 1, _ySc = 1, _ang = 0, _shadow_act = false)
{
	if (_spr != -1)
	{
		if (_shadow_act == true)
		{
			var _shadow_col = global.player_thm[global.player_thmCurr].col.shadow;
			var _shadow_alp = (global.player_thm[global.player_thmCurr].alp.shadow * _alp);
			draw_sprite_ext(_spr, _img, (_x + 1), (_y + 1), _xSc, _ySc, _ang, _shadow_col, _shadow_alp);
		}
		draw_sprite_ext(_spr, _img, _x, _y, _xSc, _ySc, _ang, _col, _alp);
	}
	else
		fn_log("The function fn_draw_spr() was called with an invalid sprite ID");
}
function fn_draw_spr_stretch(_spr, _img, _x, _y, _w, _h, _col = c_white, _alp = 1)
{
	if (_spr != -1)
		draw_sprite_stretched_ext(_spr, _img, _x, _y, _w, _h, _col, _alp);
	else
		fn_log("The function fn_draw_spr_stretch() was called with an invalid sprite ID");
}
function fn_draw_spr_part(_spr, _img, _lt, _top, _w, _h, _x, _y, _col = c_white, _alp = 1, _xSc = 1, _ySc = 1)
{
	if (_spr != -1)
		draw_sprite_part_ext(_spr, _img, _lt, _top, _w, _h, _x, _y, _xSc, _ySc, _col, _alp);
	else
		fn_log("The function fn_draw_spr_part() was called with an invalid sprite ID");
}


// For drawing lines
function fn_draw_line(_x1, _y1, _x2, _y2, _col = c_white, _alp = 1, _thickness = 1)
{
	draw_set_color(_col);
	draw_set_alpha(_alp);
	draw_line_width(_x1, _y1, _x2, _y2, _thickness);
}


// For self-drawing
function fn_draw_self_setup()
{
	self_imgSpd = 0;
	self_x = x;
	self_y = y;
	self_xSc = image_xscale;
	self_ySc = image_yscale;
	self_ang = image_angle;
	
	self_custom = false;
	self_ignoreRdcdMot = false;
}
function fn_draw_self()
{
	// Animates the object
	if (self_imgSpd > 0)
	{
		image_index += self_imgSpd;
		if (global.config_rdcdMot == true && self_ignoreRdcdMot == false)
			image_index = 0;
	}
	
	// Draws the object
	if (self_custom == false)
		fn_draw_spr(sprite_index, image_index, self_x, self_y, image_blend, image_alpha, self_xSc, self_ySc, self_ang, false);
}
