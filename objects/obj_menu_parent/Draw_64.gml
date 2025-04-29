
for (var i = 0; i < bg_maxAmt; i++)
	fn_draw_spr_stretch(bg_spr[lvl, i], bg_img[lvl, i], bg_x[lvl, i], bg_y[lvl, i], bg_w[lvl, i], bg_h[lvl, i], bg_col[lvl, i], bg_alp[lvl, i]);

for (var i = 0; i < opt_maxAmt; i++)
	fn_draw_txt(opt_txt[lvl, i], opt_x[lvl, i], opt_y[lvl, i], 1, 1, 0, opt_col_0[lvl, i], opt_col_1[lvl, i], opt_col_2[lvl, i], opt_col_3[lvl, i], opt_alp[lvl, i]);
