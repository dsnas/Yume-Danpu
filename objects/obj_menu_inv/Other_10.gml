/// @descr create

draw_x = 0;
trans_stg = 1;
fn_audio_play(snd_menu_opt_slct, false, SETT_VOL_MENU, 1, 0);




LVL_MAIN = 0; // main lvl
var z = LVL_MAIN;
menu_lvl_opt_txtdata(z, "menu_inv_main_opt");

win_act[z, 0] = true; // (main lvl) lbls window
win_x[z, 0] = (draw_dist / 2);
win_y[z, 0] = (draw_dist / 2);
win_w[z, 0] = (draw_dist * 6);
win_h[z, 0] = (draw_dist * 7) + (draw_dist / 4);

main_chrFrm_spr = global.thm_chrFrm_spr[global.chara_thm]; // (main lvl) chrFrm
main_chrFrm_w = fn_spr_w(main_chrFrm_spr);
main_chrFrm_h = fn_spr_h(main_chrFrm_spr);
main_chrFrm_x = (win_x[z, 0] + (win_w[z, 0] / 2) - (main_chrFrm_w / 2));
main_chrFrm_y = (win_y[z, 0] + draw_dist);

main_chara_spr = wrld_chara.fac_spr[wrld_chara.FAC_DN]; // (main lvl) chara
main_chara_w = fn_spr_w(main_chara_spr);
main_chara_h = fn_spr_h(main_chara_spr);
main_chara_x = (main_chrFrm_x + (main_chrFrm_w / 2) - (main_chara_w / 2));
main_chara_y = (main_chrFrm_y + (main_chrFrm_h / 2) + (main_chara_h / 2) - 1);

lbl_str[z, 0] = global.chara_name_txt; // (main lvl) chrName
lbl_x[z, 0] = (main_chrFrm_x + (main_chrFrm_w / 2));
lbl_y[z, 0] = round(main_chrFrm_y + main_chrFrm_h + (draw_dist / 8));
lbl_col_0[z, 0] = global.thm_col[global.chara_thm, 0];
lbl_col_1[z, 0] = global.thm_col[global.chara_thm, 1];
lbl_vAl[z, 0] = fa_top;
lbl_hAl[z, 0] = fa_center;

lbl_str[z, 1] = string(global.chara_ccy[global.chara_awake]); // (main lvl) ccy
lbl_w[z, 1] = fn_txt_w(lbl_str[z, 1]);
lbl_x[z, 1] = (win_x[z, 0] + (win_w[z, 0] / 2) - fn_txt_w(opt_wMax[0]));
lbl_y[z, 1] = (lbl_y[z, 0] + draw_hTxt - 1);
lbl_y[z, 1] = round(lbl_y[z, 1] + ((win_h[z, 0] - (lbl_y[z, 1] - win_y[z, 0]) - (draw_dist / 4)) / 2) - (draw_hTxt / 2)); // i hate this
lbl_col_0[z, 1] = global.thm_col[global.chara_thm, 2];
lbl_col_1[z, 1] = global.thm_col[global.chara_thm, 3];
lbl_vAl[z, 1] = fa_top;
lbl_hAl[z, 1] = fa_left;

lbl_str[z, 2] = string(global.chara_mny[global.chara_awake]); // (main lvl) mny
lbl_x[z, 2] = (lbl_x[z, 1] + lbl_w[z, 1]);
lbl_y[z, 2] = lbl_y[z, 1];
lbl_col_0[z, 2] = global.thm_col[global.chara_thm, 2];
lbl_col_1[z, 2] = global.thm_col[global.chara_thm, 3];
lbl_vAl[z, 2] = fa_top;
lbl_hAl[z, 2] = fa_left;

main_mnyImg_spr = temp_spr_menu_mnyImg; // (main lvl) mnyImg
main_mnyImg_x = (lbl_x[z, 1] - draw_dist + 2);
main_mnyImg_y = (lbl_y[z, 1] + (draw_hTxt / 2));
main_mnyImg_col = global.thm_col[global.chara_thm, 0];

win_act[z, 1] = true; // (main lvl) opts window
win_x[z, 1] = (draw_dist / 2);
win_y[z, 1] = (win_y[z, 0] + win_h[z, 0] + win_y[z, 0]);
win_w[z, 1] = win_w[z, 0];
win_h[z, 1] = 70;

main_optImg_spr = spr_menu_inv_optImg; // (main lvl) optImgs
main_optImg_w = fn_spr_w(main_optImg_spr);
main_optImg_h = fn_spr_h(main_optImg_spr);
	main_optImg_xDistOpt = (draw_dist / 8);
	main_optImg_wOpt = (main_optImg_xDistOpt + opt_wMax[z]);
main_optImg_x = win_x[z, 1] + (win_w[z, 1] / 2) - (main_optImg_wOpt / 2) + (main_optImg_w / 2);
	main_optImg_yDist = draw_dist;
	main_optImg_hAll = (main_optImg_yDist * (opt_amt[z] - 1));
for (var i = 0; i < opt_amt[z]; i++)
	main_optImg_y[i] = win_y[z, 1] + (win_h[z, 1] / 2) - (main_optImg_hAll / 2) + (main_optImg_yDist * i) - 1;
main_optImg_alp = 1;

for (var i = 0; i < opt_amt[z]; i++) // (main lvl) opts
{
	opt_x[z, i] = (main_optImg_x + main_optImg_xDistOpt);
	opt_y[z, i] = (main_optImg_y[i] - (draw_hTxt / 2));
	
	optSlctr_act[z, i] = true;
	menu_optSlctr_drawData(z, i);
	optSlctr_x[z, i] = (optSlctr_x[z, i] - main_optImg_xDistOpt - main_optImg_w);
	optSlctr_w[z, i] = (optSlctr_w[z, i] + main_optImg_xDistOpt + main_optImg_w);
}


/*
main_optImg_spr = spr_menu_inv_optImg; // (main lvl) optImgs
main_optImg_w = fn_spr_w(main_optImg_spr);
main_optImg_h = fn_spr_h(main_optImg_spr);
var _optImg_yDist = draw_dist;
var _optImg_hAll = (_optImg_yDist * (opt_amt[z] - 1));
var _optImg_xDist = (draw_dist / 4);
var _opt_wAll = (main_optImg_w + _optImg_xDist + opt_wMax[z]);
main_optImg_x = (win_x[z, 1] + (win_w[z, 1] / 2) - (_opt_wAll / 2));
for (var i = 0; i < opt_amt[z]; i++)
	main_optImg_y[i] = (win_y[z, 1] + (win_h[z, 1] / 2) - (_optImg_hAll / 2) + (_optImg_yDist * i) - 1);
main_optImg_alp = 0;

for (var i = 0; i < opt_amt[z]; i++) // (main lvl) opts
{
	opt_x[z, i] = (main_optImg_x + main_optImg_w + _optImg_xDist) //main_optImg_x + (draw_dist / 2);
	opt_y[z, i] = (main_optImg_y[i] - (draw_hTxt / 2));
	
	optSlctr_act[z, i] = true;
	menu_optSlctr_data(z, i);
	//optSlctr_x[z, i] = optSlctr_x[z, i] - _optImg_xDist - main_optImg_w;
	//optSlctr_w[z, i] = optSlctr_w[z, i] + _optImg_xDist + main_optImg_w
}
*/




LVL_EFF = 1; // eff lvl (effects level)
var z = LVL_EFF;
for (var i = 0; i < 10; i++)
{
	opt_txt[z, i] = "" + string(choose("Salenis", "Supgue", "Banany", "Idvekestine", "Burgard", "Gurda", "Orction", "Keep Turd", "Sausy Meg", "dsans style", "Honk"));
	/*
	var abc = irandom(5);
	while (abc != 0)
	{
		opt_txt[z, i] += string("!");
		abc -= 1;
	}
	*/
	menu_lvl_optSize(z, i);

	opt_amt[z] += 1;
}

win_act[z, 1] = true; // (eff lvl) title box
win_x[z, 1] = (draw_dist * 2);
win_y[z, 1] = (draw_dist * 2);
win_w[z, 1] = (320 - (win_x[z, 1] * 2));
win_h[z, 1] = (240 - win_y[z, 1] - draw_dist);

var _hPos = 0;
var _vPos = 0;
for (var i = 0; i < opt_amt[z]; i++)
{
	var _xDist = (draw_dist * 2);
	opt_x[z, i] = (win_x[z, 1] + ((win_w[z, 1] / 2) * _hPos) + _xDist);
	opt_y[z, i] = (win_y[z, 1] + draw_dist + (draw_dist * _vPos));
	
	_hPos += 1;
	if (_hPos == 2)
	{
		_hPos = 0;
		_vPos += 1;
	}
}




/* (old) chara name txt, before i made lbl
main_chrName_txt = global.chara_name_txt;
main_chrName_x = (main_chrFrm_x + (main_chrFrm_w / 2));
main_chrName_y = (main_chrFrm_y + main_chrFrm_h + (draw_dist / 8));
if (global.chara_thm == 1)
	main_chrName_y -= (draw_dist / 2);
main_chrName_y = round(main_chrName_y);
main_chrName_col[0] = global.thm_col[global.chara_thm, 0];
main_chrName_col[1] = global.thm_col[global.chara_thm, 1];
main_chrName_vAl = fa_top;
main_chrName_hAl = fa_center;
*/

/* (old) (eff lvl) get opts' positions [1]
for (var i = 0; i < 10; i++)
{
	opt_txt[z, i] = "Salenis";
	var abc = irandom(5);
	while (abc != 0)
	{
		opt_txt[z, i] += string("!");
		abc -= 1;
	}
	menu_lvl_optSize(z, i);
	
	opt_amt[z] += 1;
}

var _opt_hAmt = 2;
var h = 0;
var v = 0;
for (var i = 0; i < 10; i++)
{	
	var _win_wSplit = (win_w[z, 0] / _opt_hAmt);
	
	opt_x[z, i] = win_x[z, 0] + (_win_wSplit * h) + (_win_wSplit / 2) - (opt_wMax[z] / 2);
	opt_y[z, i] = (win_y[z, 0] + draw_dist + (draw_dist * v));
	
	h += 1;
	if (h == _opt_hAmt)
	{
		h = 0;
		v += 1;
	}
}
*/

/* (old) (eff lvl) get opts' positions [0]
var _opt_hAmt = 3;
var _opt_vPos = 0;

var h = 0;
var v = 0;
for (var i = 0; i < 12; i++)
{
	opt_txt[z, i] = "Salenis";
	
	opt_x[z, i] = (win_x[z, 0] + (draw_dist * 2));
	opt_x[z, i] += ((win_w[z, 0] / _opt_hAmt) * h);
	
	opt_y[z, i] = (win_y[z, 0] + draw_dist);
	
	h += 1;
	if (h == _opt_hAmt)
		h = 0;
	
	opt_amt[z] += 1;
}
*/

/* (old) (main lvl) ccy and mny txt, before i made lbl
main_ccy_txt = string(global.chara_ccy[global.chara_awake]);
main_ccy_x = (win_x[z, 0] + (win_w[z, 0] / 2) - (fn_txt_w(opt_wMax[0]) / 1));
main_ccy_y = (main_chrName_y + draw_hTxt - 1);
main_ccy_y = main_ccy_y + ((win_h[z, 0] - (main_ccy_y - win_y[z, 0]) - (draw_dist / 4)) / 2) - (draw_hTxt / 2); // i hate this
main_ccy_y = round(main_ccy_y);
main_ccy_col[0] = global.thm_col[global.chara_thm, 2];
main_ccy_col[1] = global.thm_col[global.chara_thm, 3];
main_ccy_vAl = fa_top;
main_ccy_hAl = fa_left;

main_mny_txt = string(global.chara_mny[global.chara_awake]);
main_mny_x = (main_ccy_x + fn_txt_w(main_ccy_txt));
main_mny_y = main_ccy_y;
main_mny_col[0] = global.thm_col[global.chara_thm, 0];
main_mny_col[1] = global.thm_col[global.chara_thm, 1];
main_mny_vAl = fa_top;
main_mny_hAl = fa_left;
*/

/* (unused) chara portrait fade bg
main_chrwin_w = (win_w[z, 0] - (draw_dist * 3));
main_chrwin_hDist = (draw_dist / 2);
main_chrwin_h = (main_chara_h + main_chrwin_hDist);
main_chrwin_x = (win_x[z, 0] + (win_w[z, 0] / 2) - (main_chrwin_w / 2));
main_chrwin_y = (win_y[z, 0] + draw_dist);
main_chrwin_col = global.thm_col[global.chara_thm, 3];
*/

/* (unused) blur
blur = fx_create("_effect_gaussian_blur");
if (blur != -1)
{
	layer_set_fx("Instances", blur);
}
*/

/* (unused) info tab player picture frame
main_frame_spr	= global.thm_win_spr[global.chara_thm];
main_frame_sc	= 2;
main_frame_w	= (fn_spr_w(main_frame_spr) * main_frame_sc);
main_frame_h	= (fn_spr_h(main_frame_spr) * main_frame_sc);
main_frame_x	= (win_x[z, 0] + (draw_dist * 1.5));
main_frame_y	= (win_y[z, 0] + (win_h[z, 0] / 2) - (main_frame_h / 2));

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
main_name_vAl	 = fa_middle;
*/

/* (unused) (main lvl) ccy (currency) and mny (money) box
win_act[z, 2]	= true;
win_w[z, 2]		= win_w[z, 1];
win_h[z, 2]		= (draw_dist * 2);
win_x[z, 2]		= (win_x[z, 1] + (win_w[z, 1] / 2) - (win_w[z, 2] / 2));
win_y[z, 2]		= (win_y[z, 1] + win_h[z, 1] + win_y[z, 0]);

main_ccy_txt	= "₢"; 
main_ccy_x		= (win_x[z, 2] + (draw_dist / 4) + ((win_w[z, 2] / 3) / 2) - 2);
main_ccy_y		= (win_y[z, 2] + (win_h[z, 2] / 2) - 2);
main_ccy_col[0]	= global.thm_col[global.chara_thm, 2];
main_ccy_col[1]	= global.thm_col[global.chara_thm, 3];
main_ccy_vAl	= fa_middle;
main_ccy_hAl	= fa_center;

main_mny_x		= (win_x[z, 2] + (draw_dist / 4) + (win_w[z, 2] / 3));
main_mny_col[0]	= global.thm_col[global.chara_thm, 0];
main_mny_col[1]	= global.thm_col[global.chara_thm, 1];
*/

/* (unused) num
main_optNum_txt[i]	= "00";
main_optNum_x		= (win_x[z, 0] + win_w[z, 0] - draw_dist);
main_optNum_y[i]	= opt_y[z, i];
main_optNum_col		= #9F9F9F;
main_optNum_hAl		= fa_center;
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
