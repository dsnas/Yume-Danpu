/// @descr [Draw GUI #1]

var l = ll;


fn_menu_config_lbl_textdata(l);

for (var i = 0; i < lbl_amtMax; i++)
{
	if (lbl_text[l, i] != "%%%")
	{
		/* (Animates the label's colors when selected) */
		lbl_col[l][i][0] = fn_lerp_col(lbl_col[l][i][0], opt_colTgt[l][i][0][(i == optMove_pos[l])], opt_colSpd);
		lbl_col[l][i][1] = fn_lerp_col(lbl_col[l][i][1], opt_colTgt[l][i][1][(i == optMove_pos[l])], opt_colSpd);
		
		/* (Animates the label selector's alpha when selected) */
		lblSlctr_alp[l, i] = fn_lerp(lblSlctr_alp[l, i], (i == optMove_pos[l]), opt_colSpd);
	}
}
