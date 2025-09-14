
// Draws the FPS counter
if (global.config_showFps == true)
{
	var _fps_text = $"{fps} FPS";
	
	var _fps_w = fn_text_w(_fps_text);
	var _fps_x = (320 - 4 - _fps_w);
	var _fps_y = 2;
	
	var _fps_col_0 = global.player.thm[global.player.thm_curr].col.whiteLight;
	var _fps_col_1 = global.player.thm[global.player.thm_curr].col.whiteDark;
	var _fps_alp = 0.5;
	
	fn_draw_text(_fps_text, _fps_x, _fps_y, _fps_col_0, _fps_col_1, _fps_alp);
}


// Draws the white border
if (global.config_showBdr == true)
{
	var _bdr_spr = spr_config_showBdr;
	var _bdr_sc = 0.5;
	
	fn_draw_spr(_bdr_spr, 0, 0, 0, , , _bdr_sc, _bdr_sc);
}


// Draws the version number
if (global.config_showVer == true)
{
	var _ver_spr = spr_config_showVer;
	
	var _ver_w = fn_spr_w(_ver_spr);
	var _ver_h = fn_spr_h(_ver_spr);
	var _ver_x = (320 - 4 - _ver_w);
	var _ver_y = (240 - 4 - _ver_h);
	
	var _ver_col_0 = global.player.thm[global.player.thm_curr].col.whiteDark;
	var _ver_col_1 = global.player.thm[global.player.thm_curr].col.whiteLight;
	var _ver_alp = 0.5;
	
	for (var v = 0; v < 2; v++)
	{
		var _ver_col = _ver_col_0;
		if (v == 1)
			_ver_col = _ver_col_1;
		fn_draw_spr(_ver_spr, v, _ver_x, _ver_y, _ver_col, _ver_alp, , , , true);
	}
}


// Draws black rectangles to cover drawings that go off-screen
if (global.config_fscr == true)
{
	var _rect_col = c_black;
	fn_draw_rect(0, -240, -(320 * 2), (240 * 3), _rect_col, _rect_col, _rect_col, _rect_col, 1);
	fn_draw_rect(320, -240, (320 * 2), (240 * 3), _rect_col, _rect_col, _rect_col, _rect_col, 1);
}




// oi bom noite !!!!!!
