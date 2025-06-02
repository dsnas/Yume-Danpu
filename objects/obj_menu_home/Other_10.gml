/// @descr [create]

LVL_LANG = 0; // lang lvl
var l = LVL_LANG;
opt_txt[l, SETT_LANG.EN] = "";
opt_txt[l, SETT_LANG.BR] = "";
for (var i = 0; i < opt_amtMax; i++)
{
	if (opt_txt[l, i] == "")
	{
		opt_amt[l] += 1;
		
		opt_moveDflt_inp[l][i][0] = SETT_INP.LT;
		opt_moveDflt_inp[l][i][1] = SETT_INP.RT;
	}
	else
		break;
}
fn_menu_lbl_txtdata(l, 0, "menu_main_lang_lbl_0");

lang_flag_spr = spr_menu_home_lang_flag; // [lang lvl] flags
lang_flag_w = fn_spr_w(lang_flag_spr);
var _flag_xDist = round(draw_dist * 2.5);
var _flag_wAll = ((_flag_xDist * (opt_amt[l] - 1)) + lang_flag_w);
lang_flag_h = fn_spr_h(lang_flag_spr);

lbl_txt[l, 0] = fn_txtdata("menu_main_lang_lbl_0"); // [lang lvl] title lbl
lbl_w[l, 0] = fn_txt_w(lbl_txt[l, 0]);
var _lbl_yDist = draw_dist * 1.5;
var _lbl_hAll = (_lbl_yDist + lang_flag_h);

wnd_act[l, 0] = true; // [lang lvl] wnd
var _wnd_wDist = round(draw_dist * 1.25);
wnd_w[l, 0] = (_flag_wAll + (_wnd_wDist * 2));
var _wnd_hDist = draw_dist;
wnd_h[l, 0] = (_wnd_hDist + _lbl_hAll + _wnd_hDist);
wnd_x[l, 0] = (160 - (wnd_w[l, 0] / 2));
wnd_y[l, 0] = (120 - (wnd_h[l, 0] / 2));

lbl_x[l, 0] = (wnd_x[l, 0] + (wnd_w[l, 0] / 2) - (lbl_w[l, 0] / 2)); // [lang lvl] title lbl
var _lbl_yFix = 2;
lbl_y[l, 0] = (wnd_y[l, 0] + round(wnd_h[l, 0] / 2) - round(_lbl_hAll / 2) - _lbl_yFix);

lang_slctr_spr = spr_menu_home_lang_slctr; // [lang lvl] slctr
lang_slctr_col = global.thm_col[global.chara_thm, 0];

for (var f = 0; f < opt_amt[l]; f++) // [lang lvl] flags and slctr
{
	lang_flag_x[f] = wnd_x[l, 0] + round(wnd_w[l, 0] / 2) - round(_flag_wAll / 2) + (_flag_xDist * f); // [lang lvl] flags
	lang_flag_y[f] = lbl_y[l, 0] + _lbl_yDist;
	lang_flag_alpDflt[f] = 0.35;
	lang_flag_alpSlct[f] = 1;
	lang_flag_alp[f] = lang_flag_alpDflt[f];
	
	lang_slctr_x[f] = (lang_flag_x[f] + (lang_flag_w / 2)); // [lang lvl] slctr
	lang_slctr_y[f] = (lang_flag_y[f] + lang_flag_h + round(_wnd_hDist / 3));
	lang_slctr_alp[f] = 1;
}




fn_menu_lvlTrans(LVL_LANG);
