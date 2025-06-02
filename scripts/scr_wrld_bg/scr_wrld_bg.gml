
function fn_wrld_bg_create_0() // create event based on the world the player is currently in [0]
{
	if (wrld_rm == rm_wrld_macaco) // Macacolandia
	{
		bg_obj[0] = obj_wrld_bg_spr;
	}
	if (wrld_rm == rm_wrld_pikini) // Fenda bo Pikini
	{
		bg_obj[0] = obj_wrld_bg_px;
		bg_obj[1] = obj_wrld_bg_spr;
	}
}
function fn_wrld_bg_create_1() // create event based on the world the player is currently in [1]
{
	if (wrld_rm == rm_wrld_macaco) // Macacolandia
	{
		bg_obj[0].draw_spr = spr_wrld_bg_macaco_0; // monkey
		bg_obj[0].draw_xSc = 1;
		bg_obj[0].draw_ySc = bg_obj[0].draw_xSc;
		bg_obj[0].draw_alp = 0.25;
		bg_obj[0].draw_move_xTime = (120 * 60);
		bg_obj[0].draw_move_yTime = bg_obj[0].draw_move_xTime;
	}
	if (wrld_rm == rm_wrld_pikini) // Fenda bo Pikini
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
}
function fn_wrld_bg_step() // step event based on the world the player is currently in
{
	if (wrld_rm == rm_wrld_pikini) // Fenda bo Pikini
	{
		bg_obj[0].draw_x = wrld_chara.cam_x;
		bg_obj[0].draw_y = wrld_chara.cam_y;	
		bg_obj[0].draw_w = wrld_chara.cam_w;
		bg_obj[0].draw_h = wrld_chara.cam_h;
	}
}
