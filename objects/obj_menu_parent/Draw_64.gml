
for (var z = 0; z < lvl_amtMax; z++) // opt alp animation
{
	for (var i = 0; i < opt_amtMax; i++)
	{
		var _col_0 = opt_col_0[z, i];
		var _col_1 = opt_col_1[z, i];
		
		var _tgtCol_0 = global.thm_col[global.chara_thm, 2];
		var _tgtCol_1 = global.thm_col[global.chara_thm, 3];
		if (i == opt_pos)
		{
			_tgtCol_0 = global.thm_col[global.chara_thm, 0];
			_tgtCol_1 = global.thm_col[global.chara_thm, 1];
		}
		
		opt_col_0[z, i] = fn_lerp_col(_col_0, _tgtCol_0, opt_col_slctSpd);
		opt_col_1[z, i] = fn_lerp_col(_col_1, _tgtCol_1, opt_col_slctSpd);
	}
}



var z = lvl;



for (var i = 0; i < px_amtMax; i++) // px
	fn_draw_px((draw_x + px_x[z, i]), (draw_y + px_y[z, i]), px_w[z, i], px_h[z, i], px_col[z, i], px_col[z, i], px_col[z, i], px_col[z, i], px_alp[z, i] * draw_alp);

for (var i = 0; i < bg_amtMax; i++) // bg
{
	var _spr = bg_spr[z, i];
	if (_spr != -1)
		fn_draw_spr_stretch(_spr, bg_img[z, i], (draw_x + bg_x[z, i]), (draw_y + bg_y[z, i]), bg_w[z, i], bg_h[z, i], bg_col[z, i], bg_alp[z, i] * draw_alp);
}

for (var i = 0; i < opt_amt[z]; i++) // opt
{
	fn_draw_txt(opt_txt[z, i], (draw_x + opt_x[z, i]), (draw_y + opt_y[z, i]), 1, 1, 0, opt_col_0[z, i], opt_col_1[z, i], (opt_alp[z, i] * draw_alp), opt_val[z, i], opt_hal[z, i]);
}



// um pato de cada vez...
// yellow babies dancing in a circle
