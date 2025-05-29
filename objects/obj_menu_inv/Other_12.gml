/// @descr draw gui  →  inside lvls loop

if (ll == LVL_MAIN) // main lvl
{
	/* (main) chrFrm */		fn_draw_spr(main_chrFrm_spr, 0, (draw_x + main_chrFrm_x), (draw_y + main_chrFrm_y), 1, 1, 0, c_white, (lvl_alp[ll] * draw_alp), false);
	/* (main) chara */		fn_draw_spr(main_chara_spr, 0, (draw_x + main_chara_x), (draw_y + main_chara_y), 1, 1, 0, c_white, (lvl_alp[ll] * draw_alp), false);
	/* (main) mnyImg */		fn_draw_spr(main_mnyImg_spr, 0, (draw_x + main_mnyImg_x), (draw_y + main_mnyImg_y), 1, 1, 0, main_mnyImg_col, (main_mnyImg_alp * lvl_alp[ll] * draw_alp), true);
			
	for (var i = 0; i < opt_amt[ll]; i++)
		/* (main) optImg */	fn_draw_spr(main_optImg_spr, i, (draw_x + main_optImg_x), (draw_y + main_optImg_y[i]), 1, 1, 0, opt_col[ll][i][0], (main_optImg_alp * lvl_alp[ll] * draw_alp), true);
}
