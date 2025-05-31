/// @descr [create]

LVL_MAIN = 0; // main lvl
var l = LVL_MAIN;
menu_opt_txtData(l, "menu_inv_main_opt");

px_act[l, 0] = true; // [main lvl] dark translucent background
px_x[l, 0] = 0;
px_y[l, 0] = 0;
px_w[l, 0] = 320;
px_h[l, 0] = 240;
px_col[l, 0] = c_black;
px_alp[l, 0] = 0.5;

wnd_act[l, 0] = true; // (main lvl) lbls wnd
wnd_x[l, 0] = (draw_dist / 2);
wnd_y[l, 0] = (draw_dist / 2);
wnd_w[l, 0] = (draw_dist * 6);
wnd_h[l, 0] = (draw_dist * 7) + (draw_dist / 4);

main_chrFrm_spr = global.thm_chrFrm_spr[global.chara_thm]; // (main lvl) chrFrm
main_chrFrm_w = fn_spr_w(main_chrFrm_spr);
main_chrFrm_h = fn_spr_h(main_chrFrm_spr);
main_chrFrm_x = (wnd_x[l, 0] + (wnd_w[l, 0] / 2) - (main_chrFrm_w / 2));
main_chrFrm_y = (wnd_y[l, 0] + draw_dist);

main_chara_spr = wrld_chara.move_spr[wrld_chara.MOVE_DN]; // (main lvl) chara
main_chara_w = fn_spr_w(main_chara_spr);
main_chara_h = fn_spr_h(main_chara_spr);
main_chara_x = (main_chrFrm_x + (main_chrFrm_w / 2) - (main_chara_w / 2));
main_chara_y = (main_chrFrm_y + (main_chrFrm_h / 2) + (main_chara_h / 2) - 1);

lbl_txt[l, 0] = global.chara_name_txt; // (main lvl) chrName
lbl_x[l, 0] = (main_chrFrm_x + (main_chrFrm_w / 2));
lbl_y[l, 0] = round(main_chrFrm_y + main_chrFrm_h + (draw_dist / 8));
lbl_col[l][0][0] = global.thm_col[global.chara_thm, 0];
lbl_col[l][0][1] = global.thm_col[global.chara_thm, 1];
lbl_vAl[l, 0] = fa_top;
lbl_hAl[l, 0] = fa_center;

lbl_txt[l, 1] = string(global.chara_ccy[global.chara_awake]); // (main lvl) ccy
lbl_w[l, 1] = fn_txt_w(lbl_txt[l, 1]);

lbl_txt[l, 2] = string(global.chara_mny[global.chara_awake]); // (main lvl) mny
lbl_w[l, 2] = fn_txt_w(lbl_txt[l, 2]);

main_mnyImg_spr = temp_spr_menu_mnyImg; // (main lvl) mnyImg
main_mnyImg_w = fn_spr_w(main_mnyImg_spr);
var _xDist = (draw_dist / 3);
var _wAll = (_xDist + lbl_w[l, 1] + lbl_w[l, 2]);
main_mnyImg_x = (wnd_x[l, 0] + (wnd_w[l, 0] / 2) - (_wAll / 2) + (main_mnyImg_w / 2));
main_mnyImg_y = (lbl_y[l, 0] + draw_hTxt + draw_dist - 1);
main_mnyImg_col = global.thm_col[global.chara_thm, 0];
main_mnyImg_alp = 1;

lbl_x[l, 1] = (main_mnyImg_x + _xDist); // (main lvl) ccy
lbl_y[l, 1] = (main_mnyImg_y - (draw_hTxt / 2));
lbl_col[l][1][0] = global.thm_col[global.chara_thm, 2];
lbl_col[l][1][1] = global.thm_col[global.chara_thm, 3];
lbl_vAl[l, 1] = fa_top;
lbl_hAl[l, 1] = fa_left;

lbl_x[l, 2] = (lbl_x[l, 1] + lbl_w[l, 1]); // (main lvl) mny
lbl_y[l, 2] = lbl_y[l, 1];
lbl_col[l][2][0] = global.thm_col[global.chara_thm, 0];
lbl_col[l][2][1] = global.thm_col[global.chara_thm, 1];
lbl_vAl[l, 2] = fa_top;
lbl_hAl[l, 2] = fa_left;

wnd_act[l, 1] = true; // (main lvl) opts wnd
wnd_x[l, 1] = (draw_dist / 2);
wnd_y[l, 1] = (wnd_y[l, 0] + wnd_h[l, 0] + wnd_y[l, 0]);
wnd_w[l, 1] = wnd_w[l, 0];
wnd_h[l, 1] = 70;

main_optImg_spr = spr_menu_inv_optImg; // (main lvl) optImgs
main_optImg_w = fn_spr_w(main_optImg_spr);
var _xDist = (draw_dist / 8);
var _wAll = (_xDist + opt_wMax[l]);
main_optImg_x = wnd_x[l, 1] + (wnd_w[l, 1] / 2) - (_wAll / 2) + (main_optImg_w / 2);
var _yDist = draw_dist;
var _yDistFix = 1;
var _hAll = (_yDist * (opt_amt[l] - 1));
for (var i = 0; i < opt_amt[l]; i++)
	main_optImg_y[i] = (wnd_y[l, 1] + (wnd_h[l, 1] / 2) - (_hAll / 2) + (_yDist * i) - _yDistFix);
main_optImg_alp = 1;

	fn_dbg_log(opt_amt[l]);

for (var i = 0; i < opt_amt[l]; i++) // (main lvl) opts
{
	opt_x[l, i] = (main_optImg_x + _xDist);
	opt_y[l, i] = (main_optImg_y[i] - (draw_hTxt / 2));
	
	optSlctr_act[l, i] = true;
	menu_optSlctr_drawData(l, i);
	optSlctr_x[l, i] = (optSlctr_x[l, i] - _xDist - main_optImg_w - 1);
	optSlctr_w[l, i] = (optSlctr_w[l, i] + _xDist + main_optImg_w + 1);
}




LVL_EFF = 1; // eff lvl (effects level)
LVL_ITM = 2; // itm lvl (items level)
LVL_THM = 3; // thm lvl (themes level)

for (var l = 0; l < lvl_amtMax; l++) // eff/itm/thm lvl  →  made so new levels can be added easily
{
	ram_amtMax[l] = 0;
	ram_invArr[l] = -1;
	ram_nameArr[l] = -1;
	ram_descArr[l] = -1;
	ram_lblKey_txt[l] = "%%%";
	if (l == LVL_EFF) // (eff lvl) get info
	{
		ram_amtMax[l] = global.eff_amtMax;
		ram_invArr[l] = global.chara_effInv;
		ram_nameArr[l] = global.eff_name_txt;
		ram_descArr[l] = global.eff_desc_txt;
		ram_lblKey_txt[l] = "eff";
	}
	else if (l == LVL_ITM) // (itm lvl) get info
	{
		ram_amtMax[l] = global.itm_amtMax;
		ram_invArr[l] = global.chara_itmInv;
		ram_nameArr[l] = global.itm_name_txt;
		ram_descArr[l] = global.itm_desc_txt;
		ram_lblKey_txt[l] = "itm";
	}
	else if (l == LVL_THM) // (thm lvl) get info
	{
		ram_amtMax[l] = global.thm_amtMax;
		ram_invArr[l] = global.chara_thmInv;
		ram_nameArr[l] = global.thm_name_txt;
		ram_descArr[l] = global.thm_desc_txt;
		ram_lblKey_txt[l] = "thm";
	}
	
	
	if (l == LVL_EFF) || (l == LVL_ITM) || (l == LVL_THM)
	{
		for (var i = 0; i < ram_amtMax[l]; i++) // opts  →  get text
		{
			if (array_get(ram_invArr[l], i) == true)
			{
				fn_dbg_log(array_get(ram_nameArr[l], i));
				opt_txt[l, i] = array_get(ram_nameArr[l], i);
			}
			else
			{
				opt_txt[l, i] = "----------";
				opt_colDflt[l][i][0] = opt_colDflt[l][i][1];
				opt_colSlct[l][i][0] = opt_colSlct[l][i][1];
			}
	
			menu_opt_sizeData(l, i);
		}
		opt_amt[l] = ram_amtMax[l];
		
		px_act[l, 0] = true; // dark translucent background
		px_x[l, 0] = 0;
		px_y[l, 0] = 0;
		px_w[l, 0] = 320;
		px_h[l, 0] = 240;
		px_col[l, 0] = c_black;
		px_alp[l, 0] = 0.75;
		
		wnd_act[l, 0] = true; // lbl wnd
		wnd_x[l, 0] = -draw_dist;
		wnd_y[l, 0] = -draw_dist;
		wnd_w[l, 0] = ((abs(wnd_x[l, 0]) * 2) + 320);
		wnd_h[l, 0] = (abs(wnd_y[l, 0]) + (draw_dist * 2));
		
		lbl_txt[l, 0] = fn_txtData("menu_inv_" + string(ram_lblKey_txt[l]) + "_lbl_0"); // title lbl
		lbl_w[l, 0] = fn_txt_w(lbl_txt[l, 0]);
		lbl_x[l, 0] = wnd_x[l, 0] + (wnd_w[l, 0] / 2) - (lbl_w[l, 0] / 2);
		var _yDistFix = 1;
		lbl_y[l, 0] = (draw_dist - (draw_hTxt / 2) - _yDistFix);
		
		wnd_act[l, 1] = true; // opts wnd
		wnd_x[l, 1] = (draw_dist * 2);
		wnd_y[l, 1] = (wnd_y[l, 0] + wnd_h[l, 0] + draw_dist);
		wnd_w[l, 1] = (320 - (wnd_x[l, 1] * 2));
		wnd_h[l, 1] = (240 - wnd_y[l, 1] - draw_dist);
		
		var _opt_xPos = 0; // opts  →  get positions
		var _opt_yPos = 0;
		for (var i = 0; i < opt_amt[l]; i++)
		{
			opt_x[l, i] = (wnd_x[l, 1] + ((wnd_w[l, 1] / 2) * _opt_xPos) + (draw_dist * 2));
			opt_y[l, i] = (wnd_y[l, 1] + draw_dist + (draw_dist * _opt_yPos));
			_opt_xPos += 1;
			if (_opt_xPos == 2)
			{
				_opt_xPos = 0;
				_opt_yPos += 1;
			}
			
			menu_optSlctr_drawData(l, i);
		}
		
		if (array_get(ram_invArr[l], opt_pos[l]) == true) // desc (description)
			lbl_txt[l, 1] = array_get(ram_descArr[l], opt_pos[l]);
		lbl_x[l, 1] = (wnd_x[l, 1] + draw_dist);
		lbl_y[l, 1] = (wnd_y[l, 1] + wnd_h[l, 1] - draw_dist);
		lbl_col[l][1][0] = global.thm_col[global.chara_thm, 0];
		lbl_col[l][1][1] = global.thm_col[global.chara_thm, 1];
		lbl_alp[l, 1] = 1;
		lbl_vAl[l, 1] = fa_bottom;
	}
}




lvlTrans_act = true;
lvlTrans_tgtLvl = LVL_MAIN;

fn_aud_play(global.thm_snd_optSlct[global.chara_thm], SETT_VOL.MENU);
