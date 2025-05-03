
event_inherited();
var z = lvl;

if (lvl == LVL_MAIN)
{
	for (var i = 0; i < opt_amt[z]; i++)
	{
		fn_draw_spr(main_optImg_spr, i, main_optImg_x, main_optImg_y[i], 2, 2, 0, c_white, alp); // opt img
		
		
		
		/* (unused) num
		fn_draw_txt(main_optNum_txt[i], main_optNum_x, main_optNum_y[i], 1, 1, 0, main_optNum_col, main_optNum_col, main_optNum_col, main_optNum_col, alp, fa_top, main_optNum_hal); // opt num
		*/
		
		/* (unused) dot
		fn_draw_spr_stretch(unused_spr_menu_inv_optDot, 0, main_optDot_x[i], main_optDot_y[i], main_optDot_w[i], 2, main_optDot_col, alp);
		*/
		
		/* (unused) line
		fn_draw_line(main_optLine_x[i, 0], main_optLine_y[i, 0], main_optLine_x[i, 1], main_optLine_y[i, 1], main_optLine_col[i], main_optLine_alp[i], 2);
		*/
	}
}
