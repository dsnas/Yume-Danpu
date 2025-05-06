/// @descr create

for (var z = 0; z < lvl_amtMax; z++)
{
	px_x[z, 0] = -draw_dist;
	px_y[z, 0] = -draw_dist;
	px_w[z, 0] = (draw_dist + 320 + draw_dist);
	px_h[z, 0] = (draw_dist + 240 + draw_dist);
	px_col[z, 0] = c_white;
	px_alp[z, 0] = 0;
}



LVL_MAIN = 0; // main lvl
var z = LVL_MAIN;



bg_act[z, 0] = true; // (main lvl) info box
bg_x[z, 0] = -(draw_dist / 2);
bg_y[z, 0] = (draw_dist / 2);
bg_w[z, 0] = 120;
bg_h[z, 0] = (draw_dist * 4);

main_chara_spr = wrld_chara.fac_spr[wrld_chara.FAC_DN];
main_chara_w = fn_spr_w(main_chara_spr);
main_chara_h = fn_spr_h(main_chara_spr);
main_chara_x = (bg_x[z, 0] + (bg_w[z, 0] / 2) - (main_chara_w / 2));
main_chara_y = (bg_y[z, 0] + (bg_h[z, 0] / 4));



bg_act[z, 1] = true; // (main lvl) options box
bg_x[z, 1] = (draw_dist / 2);
bg_y[z, 1] = (bg_y[z, 0] + bg_h[z, 0] + bg_y[z, 0]);
bg_w[z, 1] = (bg_w[z, 0] - abs(bg_x[z, 1]) - (bg_x[z, 1] * 2));
bg_h[z, 1] = 70;

menu_lvl_txtdata(z, "menu_inv_main");
for (var i = 0; i < opt_amt[z]; i++)
{
	opt_x[z, i] = (bg_x[z, 1] + (draw_dist / 4) + (bg_w[z, 1] / 3));
	opt_y[z, i] = (bg_y[z, 1] + (bg_h[z, 1] / 2) - (draw_dist * (opt_amt[z] / 2)) + (draw_dist * i));
	opt_col_0[z, i] = global.thm_col[global.chara_thm, 0];
	opt_col_1[z, i] = global.thm_col[global.chara_thm, 1];
}

main_optImg_spr	= spr_menu_inv_optIcon;
main_optImg_x = (bg_x[z, 1] + (draw_dist / 4) + ((bg_w[z, 1] / 3) / 2) + 1);
for (var i = 0; i < opt_amt[z]; i++)
{
	main_optImg_y[i] = (opt_y[z, i] + (draw_hTxt / 2));
}






// name's Template. Menu Template.






/* (unused) blur
blur = fx_create("_effect_gaussian_blur");
if (blur != -1)
{
	layer_set_fx("Instances", blur);
}
*/

/* (unused) info tab player picture frame
main_frame_spr	= global.thm_bg_spr[global.chara_thm];
main_frame_sc	= 2;
main_frame_w	= (fn_spr_w(main_frame_spr) * main_frame_sc);
main_frame_h	= (fn_spr_h(main_frame_spr) * main_frame_sc);
main_frame_x	= (bg_x[z, 0] + (draw_dist * 1.5));
main_frame_y	= (bg_y[z, 0] + (bg_h[z, 0] / 2) - (main_frame_h / 2));

main_chara_spr	= wrld_chara.fac_spr[wrld_chara.FAC_DN];
main_chara_lt	= 0;
main_chara_tp	= 5;
main_chara_w	= 16;
main_chara_h	= 16;
main_chara_x	= (main_frame_x + (4 * main_frame_sc));
main_chara_y	= (main_frame_y + (4 * main_frame_sc));

main_name_x		 = (main_frame_x + main_frame_w + (draw_dist / 2));
main_name_y		 = (main_frame_y + (main_frame_h / 2) - 2);
main_name_col[0] = global.thm_col[global.chara_thm, 0];
main_name_col[1] = global.thm_col[global.chara_thm, 1];
main_name_val	 = fa_middle;
*/

/* (unused) (main lvl) ccy (currency) and mny (money) box
bg_act[z, 2]	= true;
bg_w[z, 2]		= bg_w[z, 1];
bg_h[z, 2]		= (draw_dist * 2);
bg_x[z, 2]		= (bg_x[z, 1] + (bg_w[z, 1] / 2) - (bg_w[z, 2] / 2));
bg_y[z, 2]		= (bg_y[z, 1] + bg_h[z, 1] + bg_y[z, 0]);

main_ccy_txt	= "₢"; 
main_ccy_x		= (bg_x[z, 2] + (draw_dist / 4) + ((bg_w[z, 2] / 3) / 2) - 2);
main_ccy_y		= (bg_y[z, 2] + (bg_h[z, 2] / 2) - 2);
main_ccy_col[0]	= global.thm_col[global.chara_thm, 2];
main_ccy_col[1]	= global.thm_col[global.chara_thm, 3];
main_ccy_val	= fa_middle;
main_ccy_hal	= fa_center;

main_mny_x		= (bg_x[z, 2] + (draw_dist / 4) + (bg_w[z, 2] / 3));
main_mny_col[0]	= global.thm_col[global.chara_thm, 0];
main_mny_col[1]	= global.thm_col[global.chara_thm, 1];
*/

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
