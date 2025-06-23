
// Loops through each level until the maximum amount is reached
for (var l = 0; l < lvl_amtMax; l++)
{
	// Draws rectangles, boxes, options, information and titles of the current level and the one the transition sequence may be going to
	if (l == lvl) || (l == lvlTrans_tgt)
	{
		fn_menu_evDrawGUI_0(l);
		
		
		// Draws rectangles
		for (var r = 0; r < rect_amtMax[l]; r++)
		{
			if (rect_w[l, r] > 0 && rect_h[l, r] > 0)
				fn_draw_rect((draw_x + rect_x[l, r]), (draw_y + rect_y[l, r]), rect_w[l, r], rect_h[l, r], rect_col[l, r], rect_col[l, r], rect_col[l, r], rect_col[l, r], (rect_alp[l, r] * lvl_alp[l] * draw_alp));
		}
		
		
		// Draws the boxes
		for (var b = 0; b < box_amtMax[l]; b++)
		{
			if (box_w[l, b] > 0 && box_h[l, b] > 0)
				fn_draw_spr_stretch(box_spr, 0, (draw_x + box_x[l, b]), (draw_y + box_y[l, b]), box_w[l, b], box_h[l, b], c_white, (box_alp[l, b] * lvl_alp[l] * draw_alp));
		}
		
		
		// Draws the options and their selector
		for (var o = 0; o < opt_amt[l]; o++)
		{
			if (opt_text[l, o] != "%%%")
			{
				// Draws the option selector
				if (optSlctr_act[l, o] == true)
				{
					optSlctr_alp[l, o] = fn_lerp(optSlctr_alp[l, o], (o == opt_move_pos[l]), opt_colSpd);
					fn_draw_spr_stretch(optSlctr_spr, 0, (draw_x + optSlctr_x[l, o]), (draw_y + optSlctr_y[l, o]), optSlctr_w[l, o], optSlctr_h[l, o], c_white, (optSlctr_alp[l, o] * lvl_alp[l] * draw_alp));
				}
			
				// Draws the options
				opt_col[l][o][0] = fn_lerp_col(opt_col[l][o][0], opt_colTgt[l][o][0][(o == opt_move_pos[l])], opt_colSpd);
				opt_col[l][o][1] = fn_lerp_col(opt_col[l][o][1], opt_colTgt[l][o][1][(o == opt_move_pos[l])], opt_colSpd);
				fn_draw_text(opt_text[l, o], (draw_x + opt_x[l, o]), (draw_y + opt_y[l, o]), opt_col[l][o][0], opt_col[l][o][1], (opt_alp[l, o] * lvl_alp[l] * draw_alp), opt_vAl[l, o], opt_hAl[l, o]);
			}
		}
		
		
		// Draws information
		for (var i = 0; i < info_amtMax[l]; i++)
		{
			if (info_text[l, i] != "%%%")
				fn_draw_text(info_text[l, i], (draw_x + info_x[l, i]), (draw_y + info_y[l, i]), info_col[l][i][0], info_col[l][i][1], (info_alp[l, i] * lvl_alp[l] * draw_alp), info_vAl[l, i], info_hAl[l, i]);
		}
		
		
		// Draws titles and their box
		if (ttl_text[l] != "%%%")
		{
			// Draws the title's box
			fn_draw_spr_stretch(box_spr, 0, (draw_x + ttlBox_x[l]), (draw_y + ttlBox_y[l]), ttlBox_w[l], ttlBox_h[l], c_white, (lvl_alp[l] * draw_alp));
			
			// Draws titles
			fn_draw_text(ttl_text[l], (draw_x + ttl_x[l]), (draw_y + ttl_y[l]), ttl_col[l][0], ttl_col[l][1], (lvl_alp[l] * draw_alp), ttl_vAl[l], ttl_hAl[l]);
		}
		
		
		fn_menu_evDrawGUI_1(l);
	}
}


