/// @descr [Draw GUI #0]

var l = ll;


for (var i = 0; i < lbl_amtMax; i++)
{
	for (var z = 0; z < 2; z++)
		/* lblSlctr */ fn_draw_text(lblSlctr_text[z], lblSlctr_x[l][i][z], lblSlctr_y[l][i], 1, 1, 0, lbl_col[l][i][0], lbl_col[l][i][1], (lblSlctr_alp[l, i] * lvl_alp[l] * draw_alp), fa_top, fa_left);
}
