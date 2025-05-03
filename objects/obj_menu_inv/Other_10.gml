/// @descr create

LVL_MAIN = 0;



var z = LVL_MAIN;

var b = 0;
bg_spr[z, b] = spr_menu_bg_0;
bg_x[z, b] = -8;
bg_y[z, b] = -8;
bg_w[z, b] = 240;
bg_h[z, b] = 80;

var b = 1;
bg_spr[z, b] = spr_menu_bg_0;
bg_x[z, b] = (draw_dist / 2);
bg_y[z, b] = bg_y[z, (b - 1)] + bg_h[z, (b - 1)] + (draw_dist / 2);
bg_w[z, b] = 180;
bg_h[z, b] = 140;

menu_lvl_txtdata(z, "menu_inv_main");
for (var i = 0; i < opt_amt[z]; i++)
{
	opt_x[z, i] = (bg_x[z, b] + 8 + (bg_w[z, b] / 3));
	opt_y[z, i] = (bg_y[z, b] + (bg_h[z, b] / 2) - (draw_dist * 1.5) + (draw_dist * i));
}

main_optImg_spr	= spr_menu_inv_optIcon;
main_optImg_x	= (bg_x[z, b] + 8 + (bg_w[z, b] / 3) / 2);
for (var i = 0; i < opt_amt[z]; i++)
	main_optImg_y[i] = (opt_y[z, i] + (draw_hTxt / 1.5));



// name's Template. Menu Template.



/* (unused) num
main_optNum_txt[i]	= "00";
main_optNum_x		= (bg_x[z, 0] + bg_w[z, 0] - draw_dist);
main_optNum_y[i]	= opt_y[z, i];
main_optNum_col		= #9F9F9F;
main_optNum_hal		= fa_center;
*/
	
/* (unused) dot
main_optDot_xAmt = (main_optImg_xAmt / 4);
main_optDot_x[i] = opt_x[z, i] + opt_w[z, i] + main_optDot_xAmt;
main_optDot_y[i] = main_optImg_y[i] + 2;
main_optDot_w[i] = (main_optNum_x[i] - fn_txt_w(main_optNum_txt[i]) - main_optDot_xAmt - main_optDot_x[i]);
main_optDot_col = #9F9F9F;
*/
	
/* (unused) line
main_optLine_xAmt = (main_optImg_xAmt / 4);
main_optLine_x[i, 0] = opt_x[z, i] + opt_w[z, i] + main_optLine_xAmt;
main_optLine_y[i, 0] = main_optImg_y[i];
main_optLine_x[i, 1] = main_optNum_x[i] - fn_txt_w(main_optNum_txt[i]) - main_optLine_xAmt;
main_optLine_y[i, 1] = main_optLine_y[i, 0];
main_optLine_col[i] = #9F9F9F; //#343434;
main_optLine_alp[i] = 0.25 * alp;
*/
