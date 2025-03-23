
fn_import();

bg_maxAmt = 25;
for (var i = 0; i < bg_maxAmt; i++)
	bg_obj[i] = -1;
bg_maxDepth = (layer_get_depth("Background") - 1);



//



for (var i = 0; i < bg_maxAmt; i++)
{
	if (bg_obj[i] != -1)
		fn_create(bg_obj[i], 0, 0);
}






/*
if (wrld == rm_wrld_bikini)
{
	child_obj[0] = obj_wrld_bg_px;
	child_obj[1] = obj_wrld_bg_spr;
}
*/



/*
if (wrld == rm_wrld_bikini)
{
	var _child;
	var _sky_col_0 = #6EBB9F //#368ECE //#84C8E1;
	var _sky_col_1 = #274998 //#3D7298;
	
	
	
	// sky
	_child = child_obj[0];
	
	_child.depth = (child_depthMax - 0);
	_child.draw_w = wrld_chara.cam_w;
	_child.draw_h = wrld_chara.cam_h;
	_child.draw_col[0] = _sky_col_0;
	_child.draw_col[1] = _sky_col_0;
	_child.draw_col[2] = _sky_col_1;
	_child.draw_col[3] = _sky_col_1;
	
	
	
	// pickles
	_child = child_obj[1];
	
	_child.depth = (child_depthMax - 1);
	_child.draw_spr = spr_wrld_bg_bikini_0;
	_child.draw_col = _sky_col_0;
	_child.draw_alp = 0.1;
	_child.draw_move_xTime = (120 * 60);
	_child.draw_move_yTime = _child.draw_move_xTime;
}
*/

























