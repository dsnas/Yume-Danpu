/// @descr create

draw_x = 0;
trans_stg = 1;

for (var z = 0; z < lvl_amtMax; z++)
{
	px_x[z, 0] = -draw_dist;
	px_y[z, 0] = -draw_dist;
	px_w[z, 0] = (draw_dist + 320 + draw_dist);
	px_h[z, 0] = (draw_dist + 240 + draw_dist);
	px_col[z, 0] = global.thm_col[global.chara_thm, 4];
	px_alp[z, 0] = global.thm_pxAlp[global.chara_thm];
}



LVL_MAIN = 0; // main lvl
var z = LVL_MAIN;
menu_lvl_txtdata(z, "menu_inv_main");



bg_act[z, 0] = true; // (main lvl) info box
bg_x[z, 0] = (draw_dist / 2);
bg_y[z, 0] = (draw_dist / 2);
bg_w[z, 0] = (draw_dist * 6);
bg_h[z, 0] = (draw_dist * 7) + (draw_dist / 4);

main_chrFrm_spr = global.thm_chrFrm_spr[global.chara_thm];
main_chrFrm_w = fn_spr_w(main_chrFrm_spr);
main_chrFrm_h = fn_spr_h(main_chrFrm_spr);
main_chrFrm_x = (bg_x[z, 0] + (bg_w[z, 0] / 2) - (main_chrFrm_w / 2));
main_chrFrm_y = (bg_y[z, 0] + draw_dist);

main_chara_spr = wrld_chara.fac_spr[wrld_chara.FAC_DN];
main_chara_w = fn_spr_w(main_chara_spr);
main_chara_h = fn_spr_h(main_chara_spr);
main_chara_x = (main_chrFrm_x + (main_chrFrm_w / 2) - (main_chara_w / 2));
main_chara_y = (main_chrFrm_y + (main_chrFrm_h / 2) + (main_chara_h / 2) - 1);

main_chrName_txt = global.chara_name_txt;
main_chrName_x = (main_chrFrm_x + (main_chrFrm_w / 2));
main_chrName_y = (main_chrFrm_y + main_chrFrm_h + (draw_dist / 8));
if (global.chara_thm == 1)
	main_chrName_y -= (draw_dist / 2);
main_chrName_y = round(main_chrName_y);
main_chrName_col[0] = global.thm_col[global.chara_thm, 0];
main_chrName_col[1] = global.thm_col[global.chara_thm, 1];
main_chrName_val = fa_top;
main_chrName_hal = fa_center;

info_txt[z, 0] = string(global.chara_ccy[global.chara_awake]);
info_x[z, 0] = (bg_x[z, 0] + (bg_w[z, 0] / 2) - (fn_txt_w(opt_wMax[0]) / 1));
info_y[z, 0] = (main_chrName_y + draw_hTxt - 1);
info_y[z, 0] = (info_y[z, 0] + ((bg_h[z, 0] - (info_y[z, 0] - bg_y[z, 0]) - (draw_dist / 4)) / 2) - (draw_hTxt / 2)); // i hate this
info_y[z, 0] = round(info_y[z, 0]);
info_col_0[z, 0] = global.thm_col[global.chara_thm, 2];
info_col_1[z, 0] = global.thm_col[global.chara_thm, 3];
info_val[z, 0] = fa_top;
info_hal[z, 0] = fa_left;

info_txt[z, 1] = string(global.chara_mny[global.chara_awake]);
info_x[z, 1] = (info_x[z, 0] + fn_txt_w(info_txt[z, 0]));
info_y[z, 1] = info_y[z, 0];
info_col_0[z, 1] = global.thm_col[global.chara_thm, 0];
info_col_1[z, 1] = global.thm_col[global.chara_thm, 1];
info_val[z, 1] = fa_top;
info_hal[z, 1] = fa_left;

main_mnyImg_spr = temp_spr_menu_mnyImg;
main_mnyImg_x = (info_x[z, 0] - draw_dist + 2);
main_mnyImg_y = (info_y[z, 0] + (draw_hTxt / 2));
main_mnyImg_col = global.thm_col[global.chara_thm, 0];



bg_act[z, 1] = true; // (main lvl) options box
bg_x[z, 1] = (draw_dist / 2);
bg_y[z, 1] = (bg_y[z, 0] + bg_h[z, 0] + bg_y[z, 0]);
bg_w[z, 1] = bg_w[z, 0];
bg_h[z, 1] = 70;

for (var i = 0; i < opt_amt[z]; i++)
{
	opt_x[z, i] = info_x[z, 0];
	opt_y[z, i] = (bg_y[z, 1] + (bg_h[z, 1] / 2) - (draw_dist * (opt_amt[z] / 2)) + (draw_dist * i));
}

main_optImg_spr	= spr_menu_optImg;
main_optImg_x = main_mnyImg_x;
for (var i = 0; i < opt_amt[z]; i++)
{
	main_optImg_y[i] = (opt_y[z, i] + (draw_hTxt / 2));
}




fn_audio_play(snd_menu_opt_slct, false, SETT_VOL_MENU, 1, 0);

// name's Template. Menu Template.






/* (unused) (main lvl) old ccy and mny txt, before i made info
main_ccy_txt = string(global.chara_ccy[global.chara_awake]);
main_ccy_x = (bg_x[z, 0] + (bg_w[z, 0] / 2) - (fn_txt_w(opt_wMax[0]) / 1));
main_ccy_y = (main_chrName_y + draw_hTxt - 1);
main_ccy_y = main_ccy_y + ((bg_h[z, 0] - (main_ccy_y - bg_y[z, 0]) - (draw_dist / 4)) / 2) - (draw_hTxt / 2); // i hate this
main_ccy_y = round(main_ccy_y);
main_ccy_col[0] = global.thm_col[global.chara_thm, 2];
main_ccy_col[1] = global.thm_col[global.chara_thm, 3];
main_ccy_val = fa_top;
main_ccy_hal = fa_left;

main_mny_txt = string(global.chara_mny[global.chara_awake]);
main_mny_x = (main_ccy_x + fn_txt_w(main_ccy_txt));
main_mny_y = main_ccy_y;
main_mny_col[0] = global.thm_col[global.chara_thm, 0];
main_mny_col[1] = global.thm_col[global.chara_thm, 1];
main_mny_val = fa_top;
main_mny_hal = fa_left;
*/

/* (unused) chara portrait fade bg
main_chrBg_w = (bg_w[z, 0] - (draw_dist * 3));
main_chrBg_hDist = (draw_dist / 2);
main_chrBg_h = (main_chara_h + main_chrBg_hDist);
main_chrBg_x = (bg_x[z, 0] + (bg_w[z, 0] / 2) - (main_chrBg_w / 2));
main_chrBg_y = (bg_y[z, 0] + draw_dist);
main_chrBg_col = global.thm_col[global.chara_thm, 3];
*/

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
