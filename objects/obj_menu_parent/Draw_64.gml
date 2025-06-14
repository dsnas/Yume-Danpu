
if (lvlTrans_act == true) // lvlTrans (Transition sequence between levels) (trans rights, am i right?!!)
{
	lvl_alp[lvl] = fn_lerp(lvl_alp[lvl], 0, lvlTrans_alpSpd);
	lvl_alp[lvlTrans_lvlTgt] = fn_lerp(lvl_alp[lvlTrans_lvlTgt], 1, lvlTrans_alpSpd);
	
	var _slack = 0.05;
	if (lvl_alp[lvl] <= _slack && lvl_alp[lvlTrans_lvlTgt] >= (1 - _slack))
	{
		lvl_alp[lvl] = 0;
		lvl_alp[lvlTrans_lvlTgt] = 1;
		
		if (lvlTrans_killMenu == true)
			fn_kill(id);
		if (lvlTrans_rmTgt != -1)
			room_goto(lvlTrans_rmTgt);
		
		lvl = lvlTrans_lvlTgt;
		lvlTrans_act = false;
		lvlTrans_lvlTgt = -1;
	}
}


for (var l = 0; l < lvl_amtMax; l++) // Draws pxs, wnds, opts, lbls and ttls
{
	if (l == lvl) || (l == lvlTrans_lvlTgt) // (Only draws at the same time the current level and the one the transition sequence is going to)
	{
		for (var i = 0; i < px_amtMax; i++) // Draws pxs (stretched pixels)
		{
			if (px_act[l, i] == true)
				fn_draw_px((draw_x + px_x[l, i]), (draw_y + px_y[l, i]), px_w[l, i], px_h[l, i], px_col[l, i], px_col[l, i], px_col[l, i], px_col[l, i], (px_alp[l, i] * lvl_alp[l] * draw_alp));
		}
		
		
		for (var i = 0; i < wnd_amtMax; i++) // Draws wnds (windows)
		{
			if (wnd_act[l, i] == true && wnd_spr[l, i] != -1)
				fn_draw_spr_stretch(wnd_spr[l, i], wnd_img[l, i], (draw_x + wnd_x[l, i]), (draw_y + wnd_y[l, i]), wnd_w[l, i], wnd_h[l, i], wnd_col[l, i], (wnd_alp[l, i] * lvl_alp[l] * draw_alp));
		}
		
		
		for (var o = 0; o < opt_amt[l]; o++) // Draws opts (options) and optSlctr (option selector)
		{
			if (optSlctr_act[l, o] == true)
			{
				/* optSlctr alp animation (Animate the option selector's alpha) */
				optSlctr_alp[l, o] = fn_lerp(optSlctr_alp[l, o], (o == opt_pos[l]), optSlctr_alpSpd);
				
				/* optSlctr */ fn_draw_spr_stretch(optSlctr_spr[l, o], 0, optSlctr_x[l, o], optSlctr_y[l, o], optSlctr_w[l, o], optSlctr_h[l, o], c_white, (optSlctr_alp[l, o] * lvl_alp[l] * draw_alp));
			}
			
			
			/* opt col slct animation (Animate the option's colors when selected) */
			opt_col[l][o][0] = fn_lerp_col(opt_col[l][o][0], opt_colTgt[l][o][0][(o == opt_pos[l])], opt_colSpd);
			opt_col[l][o][1] = fn_lerp_col(opt_col[l][o][1], opt_colTgt[l][o][1][(o == opt_pos[l])], opt_colSpd);
			
			/* opts */ fn_draw_txt(opt_txt[l, o], (draw_x + opt_x[l, o]), (draw_y + opt_y[l, o]), 1, 1, 0, opt_col[l][o][0], opt_col[l][o][1], (opt_alp[l, o] * lvl_alp[l] * draw_alp), opt_vAl[l, o], opt_hAl[l, o]);
		}
		
		
		for (var i = 0; i < lbl_amtMax; i++) // Draws lbls (labels)
		{
			if (lbl_txt[l, i] != "%%%")
				fn_draw_txt(lbl_txt[l, i], lbl_x[l, i], lbl_y[l, i], 1, 1, 0, lbl_col[l][i][0], lbl_col[l][i][1], (lbl_alp[l, i] * lvl_alp[l] * draw_alp), lbl_vAl[l, i], lbl_hAl[l, i]);
		}
		
		
		if (ttl_txt[l] != "%%%") // Draws ttls (titles)
		{
			/* ttlWnd */ fn_draw_spr_stretch(ttlWnd_spr[l], 0, (draw_x + ttlWnd_x[l]), (draw_y + ttlWnd_y[l]), ttlWnd_w[l], ttlWnd_h[l], c_white, (lvl_alp[l] * draw_alp));
			/* ttls */ fn_draw_txt(ttl_txt[l], ttl_x[l], ttl_y[l], 1, 1, 0, ttl_col[l][0], ttl_col[l][1], (lvl_alp[l] * draw_alp), ttl_vAl[l], ttl_hAl[l]);
			
		}
		
		
		
		
		ll = l;
		event_user(2); // [Child] [Draw GUI]
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