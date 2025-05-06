
event_inherited();
var z = lvl;



if (lvl == LVL_MAIN) // main lvl
{
	for (var i = 0; i < opt_amt[z]; i++)
	{
		//fn_draw_spr(main_chara_spr, 0, main_chara_x, main_chara_y, );
		
		
		for (var c = 0; c < 2; c++) // (main lvl) opt img
		{
			var _optImg_x = (draw_x + main_optImg_x); // normal
			var _optImg_y = (draw_y + main_optImg_y[i]);
			var _optImg_col = opt_col_0[z, i];
			if (c == 0)
			{
				_optImg_x += 1; // shdw (shadow)
				_optImg_y += 1;
				_optImg_col = global.thm_col[global.chara_thm, 4];
			}
			fn_draw_spr(main_optImg_spr, i, _optImg_x, _optImg_y, 1, 1, 0, _optImg_col, (opt_alp[z, i] * draw_alp));
		}
		
		
		
		
		
		/* (unused) info
				 chara //	fn_draw_spr_part(main_chara_spr, 0, main_chara_lt, main_chara_tp, main_chara_w, main_chara_h, (draw_x + main_chara_x), (draw_y + main_chara_y), 2, 2, c_white, draw_alp);
		name ///	fn_draw_txt(global.chara_name_txt, main_name_x, main_name_y, 1, 1, 0, main_name_col[0], main_name_col[1], draw_alp, main_name_val, fa_left);
		 frame 	//fn_draw_spr(main_frame_spr, 0, main_frame_x, main_frame_y, main_frame_sc, main_frame_sc, 0, c_white, draw_alp);
		*/
		
		/* (unused)
		 ccy  fn_draw_txt(main_ccy_txt, main_ccy_x, main_ccy_y, 1, 1, 0, main_ccy_col[0], main_ccy_col[1], draw_alp, main_ccy_val, main_ccy_hal);
		 mny  fn_draw_txt(global.chara_mny, main_mny_x, main_ccy_y, 1, 1, 0, main_mny_col[0], main_mny_col[1], draw_alp, main_ccy_val, fa_left);
		*/
		
		/* (unused) num
		fn_draw_txt(main_optNum_txt[i], main_optNum_x, main_optNum_y[i], 1, 1, 0, main_optNum_col, main_optNum_col, main_optNum_col, main_optNum_col, alp, fa_top, main_optNum_hal); // opt num
		*/
		
		/* (unused) dot
		fn_draw_spr_stretch(unused_spr_menu_inv_optDot, 0, main_optDot_x[i], main_optDot_y[i], main_optDot_w[i], 2, main_optDot_col, alp);
		*/
		
		/* (unused) line
		fn_draw_line(main_optLine_x[i, 0], main_optLine_y[i, 0], main_optLine_x[i, 1], main_optLine_y[i, 1], main_optLine_col[i], main_optLine_alp[i], 2);
		*/
		
		/* (test)
		var _ss = "Salenis";
		var _ss_h = fn_txt_h(_ss);
		fn_dbg(_ss_h);
		fn_draw_txt(_ss, 150, 70, 1, 1, 0, c_lime, c_lime, 1, fa_top, fa_left);
		*/
	}
}
