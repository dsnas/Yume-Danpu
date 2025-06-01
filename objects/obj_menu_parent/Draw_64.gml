
if (lvlTrans_act == true)
{
	lvl_alp[lvl] = fn_lerp(lvl_alp[lvl], 0, lvlTrans_alpSpd);
	lvl_alp[lvlTrans_tgtLvl] = fn_lerp(lvl_alp[lvlTrans_tgtLvl], 1, lvlTrans_alpSpd);
	
	var _slack = 0.05;
	if (lvl_alp[lvl] <= _slack && lvl_alp[lvlTrans_tgtLvl] >= (1 - _slack))
	{
		lvl_alp[lvl] = 0;
		lvl_alp[lvlTrans_tgtLvl] = 1;
		
		lvl = lvlTrans_tgtLvl;
		lvlTrans_tgtLvl = -1;
		if (lvlTrans_kill == true)
			fn_kill(id);
		
		lvlTrans_act = false;
	}
}




for (var l = 0; l < lvl_amtMax; l++)
{
	if (l == lvl) || (l == lvlTrans_tgtLvl)
	{
		for (var i = 0; i < px_amtMax; i++) // px
		{
			if (px_act[l, i] == true)
				fn_draw_px((draw_x + px_x[l, i]), (draw_y + px_y[l, i]), px_w[l, i], px_h[l, i], px_col[l, i], px_col[l, i], px_col[l, i], px_col[l, i], (px_alp[l, i] * lvl_alp[l] * draw_alp));
		}

		for (var i = 0; i < wnd_amtMax; i++) // wnd
		{
			if (wnd_act[l, i] == true && wnd_spr[l, i] != -1)
				fn_draw_spr_stretch(wnd_spr[l, i], wnd_img[l, i], (draw_x + wnd_x[l, i]), (draw_y + wnd_y[l, i]), wnd_w[l, i], wnd_h[l, i], wnd_col[l, i], (wnd_alp[l, i] * lvl_alp[l] * draw_alp));
		}

		for (var i = 0; i < opt_amt[l]; i++) // opt and optSlctr
		{
			if (opt_txt[l, i] != "%%%")
			{
				if (lvlTrans_tgtLvl == -1) || (lvlTrans_tgtLvl != -1 && l == lvlTrans_tgtLvl)
					optSlctr_alp[l, i] = fn_lerp(optSlctr_alp[l, i], (i == opt_pos[l]), optSlctr_alpSpd); // optSlctr alp animation
				/* optSlctr */ fn_draw_spr_stretch(optSlctr_spr[l, i], 0, optSlctr_x[l, i], optSlctr_y[l, i], optSlctr_w[l, i], optSlctr_h[l, i], c_white, (optSlctr_alp[l, i] * lvl_alp[l] * draw_alp));
				
				
				var _tgtCol_0 = opt_colDflt[l][i][0]; // opt col animation
				var _tgtCol_1 = opt_colDflt[l][i][1];
				if (i == opt_pos[l])
				{
					_tgtCol_0 = opt_colSlct[l][i][0];
					_tgtCol_1 = opt_colSlct[l][i][1];
				}
				opt_col[l][i][0] = fn_lerp_col(opt_col[l][i][0], _tgtCol_0, opt_colSpd);
				opt_col[l][i][1] = fn_lerp_col(opt_col[l][i][1], _tgtCol_1, opt_colSpd);
				/* opt */ fn_draw_txt(opt_txt[l, i], (draw_x + opt_x[l, i]), (draw_y + opt_y[l, i]), 1, 1, 0, opt_col[l][i][0], opt_col[l][i][1], (opt_alp[l, i] * lvl_alp[l] * draw_alp), opt_vAl[l, i], opt_hAl[l, i]);
			}
		}

		for (var i = 0; i < lbl_amtMax; i++) // lbl
		{
			if (lbl_txt[l, i] != "%%%")
				fn_draw_txt(lbl_txt[l, i], lbl_x[l, i], lbl_y[l, i], 1, 1, 0, lbl_col[l][i][0], lbl_col[l][i][1], (lbl_alp[l, i] * lvl_alp[l] * draw_alp), lbl_vAl[l, i], lbl_hAl[l, i]);
		}
		
		ll = l;
		event_user(2); // [draw gui] inside lvls loop
	}
}




// um pato de cada vez...
// yellow babies dancing in a circle

/* (old) lvlTrans
trans_stg = -1; // trans (fade in/out transition animation) (trans rights, am i right?!!)
trans_alpAmt = 1;
trans_lvl = -1; // lvl to adjust during the trans (transition)
trans_oooooooooooooooooooooooooooooooo = 0; // God .   All these  Letters  really  Do  make me wanna  Jump  from the  Balcony  of my  Apartment Building  .
destroy_stg = -1;

if (destroy_stg == 0) // destroy
{
	trans_stg = 0;
	destroy_stg = 1;
}

if (trans_stg == 0) // fade-out trans (transition animation)
{
	lvl_alp[lvl] -= trans_alpAmt;
	if (trans_lvl != -1)
		lvl_alp[trans_lvl] += trans_alpAmt;
	
	if (lvl_alp[lvl] <= 0 && ((trans_lvl == -1) || (trans_lvl != -1 && lvl_alp[trans_lvl] >= 1)))
	{
		//draw_alp = 0;
		//trans_stg = 1;
		trans_stg = -1;
		if (trans_lvl != -1)
		{
			lvl = trans_lvl;
			trans_lvl = -1;
		}
		if (destroy_stg == 1)
			fn_kill(id);
	}
}
else if (trans_stg == 1) // fade-in trans (transition animation)
{
	draw_alp += trans_alpAmt;
	lvl_alp[lvl] += trans_alpAmt;
	if (draw_alp >= 1)
	{
		draw_alp = 1;
		trans_stg = -1;
	}
}
*/