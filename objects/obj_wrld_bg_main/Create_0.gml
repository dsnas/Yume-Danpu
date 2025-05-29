
image_speed = 0;
image_index = 0;
image_alpha = 0;

fn_import();



bg_maxAmt = 25;
for (var i = 0; i < bg_maxAmt; i++)
	bg_obj[i] = -1;
bg_maxDepth = (layer_get_depth("Background") - 1);



if (wrld == rm_wrld_macaco) // macacolandia
{
	bg_obj[0] = obj_wrld_bg_spr;
}
if (wrld == rm_wrld_pikini) // fenda bo pikini
{
	bg_obj[0] = obj_wrld_bg_px;
	bg_obj[1] = obj_wrld_bg_spr;
}



for (var i = 0; i < bg_maxAmt; i++)
{
	if (bg_obj[i] != -1)
	{
		fn_spawn(bg_obj[i], 0, 0);
		obj.depth = (bg_maxDepth - i);
	}
}



if (wrld == rm_wrld_macaco) // macacolandia
{
	bg_obj[0].draw_spr = spr_wrld_bg_macaco_0; // macaco
	bg_obj[0].draw_xSc = 1;
	bg_obj[0].draw_ySc = bg_obj[0].draw_xSc;
	bg_obj[0].draw_alp = 0.25;
	bg_obj[0].draw_move_xTime = (120 * 60);
	bg_obj[0].draw_move_yTime = bg_obj[0].draw_move_xTime;
}
if (wrld == rm_wrld_pikini) // fenda bo pikini
{
	var _sky_col_0 = #6EBB9F //#368ECE //#84C8E1;
	var _sky_col_1 = #274998 //#3D7298;
	
	bg_obj[0].draw_col[0] = _sky_col_0; // sky
	bg_obj[0].draw_col[1] = _sky_col_0;
	bg_obj[0].draw_col[2] = _sky_col_1;
	bg_obj[0].draw_col[3] = _sky_col_1;
	
	bg_obj[1].draw_spr = spr_wrld_bg_pikini_0; // pickles
	bg_obj[1].draw_col = _sky_col_0;
	bg_obj[1].draw_alp = 0.15;
	bg_obj[1].draw_move_xTime = (120 * 60);
	bg_obj[1].draw_move_yTime = bg_obj[1].draw_move_xTime;
}





/*
if (wrld == rm_wrld_bikini)
{
	child_obj[0] = obj_wrld_wnd_px;
	child_obj[1] = obj_wrld_wnd_spr;
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
	_child.draw_spr = spr_wrld_wnd_bikini_0;
	_child.draw_col = _sky_col_0;
	_child.draw_alp = 0.1;
	_child.draw_move_xTime = (120 * 60);
	_child.draw_move_yTime = _child.draw_move_xTime;
}
*/

























