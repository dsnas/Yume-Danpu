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

lang_flag_spr = spr_menu_main_lang_flag; // [lang lvl] flags
lang_flag_w = fn_spr_w(lang_flag_spr);
var _flag_xDist = round(draw_dist * 2.5);
var _flag_wAll = ((_flag_xDist * (opt_amt[l] - 1)) + lang_flag_w);
lang_flag_h = fn_spr_h(lang_flag_spr);

lbl_txt[l, 0] = fn_txtData("menu_main_lang_lbl_0"); // [lang lvl] title lbl
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

lang_slctr_spr = spr_menu_main_lang_slctr; // [lang lvl] slctr
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








/*
lang_flag_spr = spr_menu_main_flag; // [lang lvl] flags
lang_flag_w = fn_spr_w(lang_flag_spr);
lang_flag_h = fn_spr_h(lang_flag_spr);
var _flag_xDist = (draw_dist * 4);
var _flag_wAll = ((_flag_xDist * (opt_amt[l] - 1)) + lang_flag_w);
for (var f = 0; f < opt_amt[l]; f++)
{
	lang_flag_x[f] = 160 - (_flag_wAll / 2) + (_flag_xDist * f);
	lang_flag_y[f] = 120 - (lang_flag_h / 2);
}

var _wnd_xDist = round(draw_dist / 3); // [lang lvl] flags' wnd
var _wnd_yDist = round(draw_dist / 10);
for (var w = 0; w < opt_amt[l]; w++)
{
	wnd_act[l, w] = true;
	wnd_x[l, w] = (lang_flag_x[w] - _wnd_xDist);
	wnd_y[l, w] = (lang_flag_y[w] - _wnd_yDist);
	wnd_w[l, w] = (_wnd_xDist + lang_flag_w + _wnd_xDist);
	wnd_h[l, w] = (_wnd_yDist + lang_flag_h + _wnd_yDist);
}

lbl_txt[l, 0] = fn_txtData("menu_main_lang_lbl_0"); // [lang lvl] title lbl
lbl_w[l, 0] = fn_txt_w(lbl_txt[l, 0]);
lbl_x[l, 0] = (160 - (lbl_w[l, 0] / 2));
lbl_y[l, 0] = 80;
*/





lvlTrans_act = true;
lvlTrans_tgtLvl = LVL_LANG;




// name's Template. Menu Template.
