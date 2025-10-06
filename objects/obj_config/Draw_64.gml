
// Video
if (global.config.vid.fscr.act == true) // Draws black rectangles to cover drawings that go off-screen
{
	var _resW = global.config.vid.resW;
	var _resH = global.config.vid.resH;
	var _fscrRect_col = c_black;
	fn_draw_rect(0, -_resH, -(_resW * 2), (_resH * 3), _fscrRect_col, _fscrRect_col, _fscrRect_col, _fscrRect_col, 1);
	fn_draw_rect(_resW, -_resH, (_resW * 2), (_resH * 3), _fscrRect_col, _fscrRect_col, _fscrRect_col, _fscrRect_col, 1);
}
if (global.config.vid.showVer.act == true) // Draws Version
{
	var _showVer_spr = spr_config_vid_showVer;
	var _showVer_w = fn_spr_w(_showVer_spr);
	var _showVer_h = fn_spr_h(_showVer_spr);
	var _showVer_x = (global.config.vid.resW - 4 - _showVer_w);
	var _showVer_y = (global.config.vid.resH - 4 - _showVer_h);
	
	var _showVer_col = [global.player.thm[global.player.thm_curr].col.whiteDark, global.player.thm[global.player.thm_curr].col.whiteLight];
	var _showVer_alp = 0.255
	
	for (var v = 0; v < 2; v++)
		fn_draw_spr(_showVer_spr, v, _showVer_x, _showVer_y, _showVer_col[v], _showVer_alp);
}
if (global.config.vid.showFps.act == true) // Draws FPS
{
	var _showFps_text = $"{fps} FPS";
	var _showFps_w = fn_text_w(_showFps_text);
	var _showFps_x = (320 - 4 - _showFps_w);
	var _showFps_y = 2;
	
	var _showFps_col = [global.player.thm[global.player.thm_curr].col.whiteLight, global.player.thm[global.player.thm_curr].col.whiteDark];
	var _showFps_alp = 0.5;
	
	fn_draw_text(_showFps_text, _showFps_x, _showFps_y, _showFps_col[0], _showFps_col[1], _showFps_alp);
}
if (global.config.vid.showBdr.act == true) // Draws Border
{
	var _showBdr_spr = spr_config_vid_showBdr;
	var _showBdr_sc = 0.5;
	
	fn_draw_spr(_showBdr_spr, 0, 0, 0, , , _showBdr_sc, _showBdr_sc);
}




// oi bom noite !!!!!!
