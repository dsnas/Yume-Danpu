
for (var i = 0; i < bg_maxAmt; i++)
{
	var _spr = bg_spr[lvl, i];
	if (_spr != -1)
		fn_draw_spr_stretch(_spr, bg_img[lvl, i], bg_x[lvl, i], bg_y[lvl, i], bg_w[lvl, i], bg_h[lvl, i], bg_col[lvl, i], bg_alp[lvl, i]);
}

for (var i = 0; i < opt_amt[lvl]; i++)
	fn_draw_txt(opt_txt[lvl, i], opt_x[lvl, i], opt_y[lvl, i], 1, 1, 0, opt_col[lvl, i], opt_col[lvl, i], opt_col[lvl, i], opt_col[lvl, i], opt_alp[lvl, i]);



// um pato de cada vez...
// yellow babies dancing in a circle



/*



*/