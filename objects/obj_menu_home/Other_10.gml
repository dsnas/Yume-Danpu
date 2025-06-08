/// @descr [Create]
var l;

LVL_LANG = 0; // LVL LANG
l = LVL_LANG;
opt_amt[l] = 0;
opt_txt[l, SETT_LANG.EN] = "";
opt_txt[l, SETT_LANG.BR] = "";
for (var o = 0; o < opt_amtMax; o++)
{
	if (opt_txt[l, o] == "")
		opt_amt[l] += 1;
	else
		break;
}
fn_menu_lbl_txtdata(l, 0, "menu_home_lang_lbl_0");

lang_flag_spr = spr_menu_home_lang_flag; // [LVL LANG] flags
lang_flag_w = fn_spr_w(lang_flag_spr);
var _flag_xDist = round(draw_dist * 2.5);
var _flag_wAll = ((_flag_xDist * (opt_amt[l] - 1)) + lang_flag_w);
lang_flag_h = fn_spr_h(lang_flag_spr);

var _lbl_yDist = draw_dist * 1.5; // [LVL LANG] lbl (Title label #0)
var _lbl_hAll = (_lbl_yDist + lang_flag_h);

wnd_act[l, 0] = true; // [LVL LANG] wnd (Window)
var _wnd_wDist = round(draw_dist * 1.25);
wnd_w[l, 0] = (_flag_wAll + (_wnd_wDist * 2));
var _wnd_hDist = draw_dist;
wnd_h[l, 0] = (_wnd_hDist + _lbl_hAll + _wnd_hDist);
wnd_x[l, 0] = (160 - (wnd_w[l, 0] / 2));
wnd_y[l, 0] = (120 - (wnd_h[l, 0] / 2));

lbl_x[l, 0] = (wnd_x[l, 0] + (wnd_w[l, 0] / 2) - (lbl_w[l, 0] / 2)); // [LVL LANG] lbl (Title label #1)
var _lbl_yFix = 2;
lbl_y[l, 0] = (wnd_y[l, 0] + round(wnd_h[l, 0] / 2) - round(_lbl_hAll / 2) - _lbl_yFix);

lang_slctr_spr = spr_menu_home_lang_slctr; // [LVL LANG] slctr (Flag selector)
lang_slctr_col = global.thm_col[global.thm_cur, 0];

for (var f = 0; f < opt_amt[l]; f++) // [LVL LANG] flags and slctr (Flags and its selector)
{
	lang_flag_x[f] = wnd_x[l, 0] + round(wnd_w[l, 0] / 2) - round(_flag_wAll / 2) + (_flag_xDist * f); // [LVL LANG] flags
	lang_flag_y[f] = lbl_y[l, 0] + _lbl_yDist;
	lang_flag_alpDflt[f] = 0.35;
	lang_flag_alpSlct[f] = 1;
	lang_flag_alp[f] = lang_flag_alpDflt[f];
	
	lang_slctr_x[f] = (lang_flag_x[f] + (lang_flag_w / 2)); // [LVL LANG] slctr (Flag selector)
	lang_slctr_y[f] = (lang_flag_y[f] + lang_flag_h + round(_wnd_hDist / 3));
	lang_slctr_alp[f] = 0;
}




LVL_MAIN = 1; // LVL MAIN
l = LVL_MAIN;

main_logo_spr = spr_menu_home_logo;
main_logo_w = fn_spr_w(main_logo_spr);
main_logo_x = (160 - (main_logo_w / 2));
main_logo_y = (draw_dist * 2);

fn_menu_opt_txtdata(l, "menu_home_main_opt"); // [LVL MAIN] opts (Options #0)
var _opt_yDist = round(draw_dist * 1.25);
var _opt_hAll = ( (_opt_yDist * (opt_amt[l] - 1) ) + draw_hTxt);

wnd_act[l, 0] = true; // [LVL MAIN] opts wnd (Options window)
var _wnd_wAmt = draw_dist * 1.25;
wnd_w[l, 0] = (_wnd_wAmt + opt_wMax[l] + _wnd_wAmt);
var _wnd_hAmt = draw_dist * 0.75;
wnd_h[l, 0] = (_wnd_hAmt + _opt_hAll + _wnd_hAmt);
wnd_x[l, 0] = (160 - (wnd_w[l, 0] / 2));
wnd_y[l, 0] = (120 + (draw_dist * 3) - (wnd_h[l, 0] / 2));

for (var o = 0; o < opt_amt[l]; o++) // [LVL MAIN] opts (Options #1)
{
	opt_x[l, o] = (wnd_x[l, 0] + (wnd_w[l, 0] / 2) - (opt_w[l, o] / 2));
	opt_y[l, o] = (wnd_y[l, 0] + (wnd_h[l, 0] / 2) - (_opt_hAll / 2) + (_opt_yDist * o));
	
	fn_menu_optSlctr_drawdata(l, o);
}





var _lvlTrans_lvlTgt = LVL_LANG;
if (global.flag[0] == true)
	_lvlTrans_lvlTgt = LVL_MAIN;
fn_menu_lvlTrans(_lvlTrans_lvlTgt);
