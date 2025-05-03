
var z = lvl;

for (var i = 0; i < px_maxAmt; i++)
	fn_draw_px((draw_x + px_x[z, i]), (draw_y + px_y[z, i]), px_w[z, i], px_h[z, i], px_col[z, i], px_col[z, i], px_col[z, i], px_col[z, i], px_alp[z, i] * alp);

for (var i = 0; i < bg_maxAmt; i++)
{
	var _spr = bg_spr[z, i];
	if (_spr != -1)
		fn_draw_spr_stretch(_spr, bg_img[z, i], (draw_x + bg_x[z, i]), (draw_y + bg_y[z, i]), bg_w[z, i], bg_h[z, i], bg_col[z, i], bg_alp[z, i] * alp);
}

for (var i = 0; i < opt_amt[z]; i++)
	fn_draw_txt(opt_txt[z, i], (draw_x + opt_x[z, i]), (draw_y + opt_y[z, i]), 1, 1, 0, opt_col[z, i], opt_col[z, i], opt_col[z, i], opt_col[z, i], opt_alp[z, i] * alp, opt_val[z, i], opt_hal[z, i]);



// um pato de cada vez...
// yellow babies dancing in a circle
