
fn_menu_evDrawGUI_0(lvl);


// Draws the rectangles, boxes, options, information and titles
for (var l = 0; l < lvl_amtMax; l++) // Loops through each level until the maximum amount is reached
{
	if (lvl_alp[l] > 0)
	{
		fn_menu_evDrawGUI_1(l);
		
		
		// Draws the rectangles
		for (var r = 0; r < rect_amt[l]; r++)
			fn_draw_rect((draw_x + rect_x[l, r]), (draw_y + rect_y[l, r]), rect_w[l, r], rect_h[l, r], rect_col[l, r], rect_col[l, r], rect_col[l, r], rect_col[l, r], (rect_alp[l, r] * lvl_alp[l] * draw_alp));
		
		
		// Draws the boxes
		for (var b = 0; b < box_amt[l]; b++)
			fn_draw_spr_stretch(box_spr, 0, (draw_x + box_x[l, b]), (draw_y + box_y[l, b]), box_w[l, b], box_h[l, b], c_white, (box_alp[l, b] * lvl_alp[l] * draw_alp));
		
		
		// Draws the options and their selector
		for (var o = 0; o < opt_amt[l]; o++)
		{
			// Draws the option selector
			if (opt_slctr_act[l, o] == true)
			{
				opt_slctr_alp[l, o] = fn_lerp(opt_slctr_alp[l, o], (o == opt_move_pos[l]), (opt_colSpd * 1));
				fn_draw_spr_stretch(opt_slctr_spr, opt_slctr_img, (draw_x + opt_slctr_x[l, o]), (draw_y + opt_slctr_y[l, o]), opt_slctr_w[l, o], opt_slctr_h[l, o], c_white, (opt_slctr_alp[l, o] * lvl_alp[l] * draw_alp));
			}
			
			
			// Draws the options
			opt_col[l][o][0] = fn_lerp_col(opt_col[l][o][0], opt_colTgt[l][o][0][(o == opt_move_pos[l])], opt_colSpd);
			opt_col[l][o][1] = fn_lerp_col(opt_col[l][o][1], opt_colTgt[l][o][1][(o == opt_move_pos[l])], opt_colSpd);
			fn_draw_text(opt_text[l, o], (draw_x + opt_x[l, o]), (draw_y + opt_y[l, o]), opt_col[l][o][0], opt_col[l][o][1], (opt_alp[l, o] * lvl_alp[l] * draw_alp), opt_vAl[l, o], opt_hAl[l, o]);
			
			
			// Draws the options' settings and their selector
			if (opt_config_text[l, o] != "%%%")
			{
				// Draws the options' settings
				fn_menu_opt_config_getSize(l, o);
				opt_config_alp[l, o] = fn_lerp(opt_config_alp[l, o], (0.5 + ((o == opt_move_pos[l]) * 0.5)), opt_colSpd);
				
				fn_draw_text(opt_config_text[l, o], opt_config_x[l, o], opt_config_y[l, o], opt_config_col[l][o][0], opt_config_col[l][o][1], (opt_config_alp[l, o] * lvl_alp[l] * draw_alp), fa_top, fa_left);
				
				
				// Draws the selector of the options' settings
				if (o < array_length(opt_config_slctr_act[l]) && opt_config_slctr_act[l, o] == true)
				{
					if (opt_config_slctr_shkDelay_dur[l, o] <= 0)
					{
						opt_config_slctr_shk_dist[l, o] += opt_config_slctr_shk_spd[l, o];
						if (opt_config_slctr_shk_dist[l, o] >= opt_config_slctr_shk_distMax[l, o])
							opt_config_slctr_shk_dist[l, o] = 0;
						
						opt_config_slctr_shkDelay_dur[l, o] = opt_config_slctr_shkDelay_durMax[l, o];
					}
					opt_config_slctr_shkDelay_dur[l, o] -= 1;
					
					opt_config_slctr_x[l][o][0] = (opt_config_x[l, o] - opt_config_slctr_w[l, o] - (opt_config_slctr_shk_dist[l, o] * (!global.config_rdcdMot)));
					opt_config_slctr_x[l][o][1] = (opt_config_x[l, o] + opt_config_w[l, o] + (opt_config_slctr_shk_dist[l, o] * (!global.config_rdcdMot)));
					
					opt_config_slctr_alp[l, o] = fn_lerp(opt_config_slctr_alp[l, o], (o == opt_move_pos[l]), opt_colSpd);
					for (var i = 0; i < 2; i++)
						fn_draw_text(opt_config_slctr_text[l][o][i], opt_config_slctr_x[l][o][i], opt_config_slctr_y[l, o], opt_config_slctr_col[l][o][0], opt_config_slctr_col[l][o][1], (opt_config_slctr_alp[l, o] * lvl_alp[l] * draw_alp));
				}
			}
			
			
			// Draws the option's description
			if (opt_desc_text[l, o] != "%%%")
			{
				opt_desc_alp[l, o] = fn_lerp(opt_desc_alp[l, o], (o == opt_move_pos[l]), opt_colSpd);
				fn_draw_text(opt_desc_text[l, o], opt_desc_x[l, o], opt_desc_y[l, o], opt_desc_col[l][o][0], opt_desc_col[l][o][1], (opt_desc_alp[l, o] * lvl_alp[l] * draw_alp), opt_desc_vAl[l, o], opt_desc_hAl[l, o]);
			}
		}
		
		
		// Draws the information
		for (var i = 0; i < info_amt[l]; i++)
			fn_draw_text(info_text[l, i], (draw_x + info_x[l, i]), (draw_y + info_y[l, i]), info_col[l][i][0], info_col[l][i][1], (info_alp[l, i] * lvl_alp[l] * draw_alp), info_vAl[l, i], info_hAl[l, i]);
		
		
		// Draws the titles and their box
		if (ttl_text[l] != "%%%")
		{
			// Draws the title's box
			fn_draw_spr_stretch(box_spr, 0, (draw_x + ttl_box_x[l]), (draw_y + ttl_box_y[l]), ttl_box_w[l], ttl_box_h[l], c_white, (lvl_alp[l] * draw_alp));
			
			// Draws titles
			fn_draw_text(ttl_text[l], (draw_x + ttl_x[l]), (draw_y + ttl_y[l]), ttl_col[l][0], ttl_col[l][1], (lvl_alp[l] * draw_alp), ttl_vAl[l], ttl_hAl[l]);
		}
		
		
		fn_menu_evDrawGUI_2(l);
	}
}


// Animates the option selector
if (global.config_rdcdMot == false) // Checks if the Reduced Motion setting is disabled
	opt_slctr_img += global.thm_opt_slctr_imgSpd[global.thm];
else
	opt_slctr_img = 0;

