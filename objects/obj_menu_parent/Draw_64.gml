
var z = lvl;



for (var i = 0; i < px_amtMax; i++) // px
{
	if (px_act[z, i] == true)
		fn_draw_px((draw_x + px_x[z, i]), (draw_y + px_y[z, i]), px_w[z, i], px_h[z, i], px_col[z, i], px_col[z, i], px_col[z, i], px_col[z, i], (px_alp[z, i] * draw_alp));
}

for (var i = 0; i < win_amtMax; i++) // bg
{
	if (win_act[z, i] == true && win_spr[z, i] != -1)
		fn_draw_spr_stretch(win_spr[z, i], win_img[z, i], (draw_x + win_x[z, i]), (draw_y + win_y[z, i]), win_w[z, i], win_h[z, i], win_col[z, i], (win_alp[z, i] * draw_alp));
}

for (var i = 0; i < opt_amt[z]; i++) // opt and optSlctr
{
	if (opt_txt[z, i] != "%%%")
	{
		/* optSlctr */ fn_draw_spr_stretch(optSlctr_spr[z, i], 0, optSlctr_x[z, i], optSlctr_y[z, i], optSlctr_w[z, i], optSlctr_h[z, i], c_white, (optSlctr_alp[z, i] * draw_alp));
		
		/* opt */ fn_draw_txt(opt_txt[z, i], (draw_x + opt_x[z, i]), (draw_y + opt_y[z, i]), 1, 1, 0, opt_col_0[z, i], opt_col_1[z, i], (opt_alp[z, i] * draw_alp), opt_vAl[z, i], opt_hAl[z, i]);
	}
}

for (var i = 0; i < lbl_amtMax; i++) // lbl
{
	if (lbl_str[z, i] != "%%%")
		fn_draw_txt(lbl_str[z, i], lbl_x[z, i], lbl_y[z, i], 1, 1, 0, lbl_col_0[z, i], lbl_col_1[z, i], (lbl_alp[z, i] * draw_alp), lbl_vAl[z, i], lbl_hAl[z, i]);
}



// um pato de cada vez...
// yellow babies dancing in a circle
