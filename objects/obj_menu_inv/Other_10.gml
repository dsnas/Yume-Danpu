/// @descr [Create]

LVL_MAIN = 0; // main lvl
var l = LVL_MAIN;
fn_menu_opt_textdata(l, "menu_inv_main_opt");

px_act[l, 0] = true; // [main lvl] (dark translucent background)
px_x[l, 0] = 0;
px_y[l, 0] = 0;
px_w[l, 0] = 320;
px_h[l, 0] = 240;
px_col[l, 0] = global.thm_col[global.thm_cur, 4];
px_alp[l, 0] = 0.5;

wnd_act[l, 0] = true; // [main lvl] lbls wnd (labels/information wnd)
wnd_x[l, 0] = (draw_dist / 2);
wnd_y[l, 0] = (draw_dist / 2);
wnd_w[l, 0] = (draw_dist * 6);
wnd_h[l, 0] = (draw_dist * 7) + (draw_dist / 4);

main_chrFrm_spr = global.thm_chrFrm_spr[global.thm_cur]; // [main lvl] chrFrm (player's picture fliste)
main_chrFrm_w = fn_spr_w(main_chrFrm_spr);
main_chrFrm_h = fn_spr_h(main_chrFrm_spr);
main_chrFrm_x = (wnd_x[l, 0] + (wnd_w[l, 0] / 2) - (main_chrFrm_w / 2));
main_chrFrm_y = (wnd_y[l, 0] + draw_dist);

main_chara_spr = wrld_chara.move_spr[wrld_chara.MOVE_DIR_DN]; // [main lvl] chara
main_chara_w = fn_spr_w(main_chara_spr);
main_chara_h = fn_spr_h(main_chara_spr);
main_chara_x = (main_chrFrm_x + (main_chrFrm_w / 2) - (main_chara_w / 2));
main_chara_y = (main_chrFrm_y + (main_chrFrm_h / 2) + (main_chara_h / 2) - 1);

lbl_text[l, 0] = global.chara_name_text; // (main lvl) chrName
lbl_x[l, 0] = (main_chrFrm_x + (main_chrFrm_w / 2));
lbl_y[l, 0] = round(main_chrFrm_y + main_chrFrm_h + (draw_dist / 8));
lbl_col[l][0][0] = global.thm_col[global.thm_cur, 0];
lbl_col[l][0][1] = global.thm_col[global.thm_cur, 1];
lbl_vAl[l, 0] = fa_top;
lbl_hAl[l, 0] = fa_center;

lbl_text[l, 1] = string(global.chara_ccy[global.chara_awake]); // (main lvl) ccy
lbl_w[l, 1] = fn_text_w(lbl_text[l, 1]);

lbl_text[l, 2] = string(global.chara_mny[global.chara_awake]); // (main lvl) mny
lbl_w[l, 2] = fn_text_w(lbl_text[l, 2]);

main_mnyImg_spr = spr_menu_inv_mnyImg; // (main lvl) mnyImg
main_mnyImg_w = fn_spr_w(main_mnyImg_spr);
var _xDist = (draw_dist / 3);
var _wAll = (_xDist + lbl_w[l, 1] + lbl_w[l, 2]);
main_mnyImg_x = (wnd_x[l, 0] + (wnd_w[l, 0] / 2) - (_wAll / 2) + (main_mnyImg_w / 2));
main_mnyImg_y = (lbl_y[l, 0] + global.game_fnt_h + draw_dist - 1);
main_mnyImg_col = global.thm_col[global.thm_cur, 0];
main_mnyImg_alp = 1;

lbl_x[l, 1] = (main_mnyImg_x + _xDist); // (main lvl) ccy
lbl_y[l, 1] = (main_mnyImg_y - (global.game_fnt_h / 2));
lbl_col[l][1][0] = global.thm_col[global.thm_cur, 2];
lbl_col[l][1][1] = global.thm_col[global.thm_cur, 3];
lbl_vAl[l, 1] = fa_top;
lbl_hAl[l, 1] = fa_left;

lbl_x[l, 2] = (lbl_x[l, 1] + lbl_w[l, 1]); // (main lvl) mny
lbl_y[l, 2] = lbl_y[l, 1];
lbl_col[l][2][0] = global.thm_col[global.thm_cur, 0];
lbl_col[l][2][1] = global.thm_col[global.thm_cur, 1];
lbl_vAl[l, 2] = fa_top;
lbl_hAl[l, 2] = fa_left;

wnd_act[l, 1] = true; // (main lvl) opts wnd
wnd_x[l, 1] = (draw_dist / 2);
wnd_y[l, 1] = (wnd_y[l, 0] + wnd_h[l, 0] + wnd_y[l, 0]);
wnd_w[l, 1] = wnd_w[l, 0];
wnd_h[l, 1] = 70;

main_optImg_spr = spr_menu_inv_optImg; // (main lvl) optImgs
main_optImg_w = fn_spr_w(main_optImg_spr);
var _optImg_xDist = (draw_dist / 8);
var _optImg_wAll = (_optImg_xDist + opt_wMax[l]);
main_optImg_x = wnd_x[l, 1] + (wnd_w[l, 1] / 2) - (_optImg_wAll / 2) + (main_optImg_w / 2);
var _optImg_yDist = draw_dist;
var _optImg_yFix = 1;
var _optImg_hAll = (_optImg_yDist * (opt_amt[l] - 1));
for (var i = 0; i < opt_amt[l]; i++)
	main_optImg_y[i] = (wnd_y[l, 1] + (wnd_h[l, 1] / 2) - (_optImg_hAll / 2) + (_optImg_yDist * i) - _optImg_yFix);
main_optImg_alp = 1;

for (var i = 0; i < opt_amt[l]; i++) // (main lvl) opts
{
	opt_x[l, i] = (main_optImg_x + _optImg_xDist);
	opt_y[l, i] = (main_optImg_y[i] - (global.game_fnt_h / 2));
	
	fn_menu_optSlctr_drawdata(l, i);
	optSlctr_x[l, i] = (optSlctr_x[l, i] - _optImg_xDist - main_optImg_w - 1);
	optSlctr_w[l, i] = (optSlctr_w[l, i] + _optImg_xDist + main_optImg_w + 1);
}




LVL_LIST_EFF = 1; // lvl eff (Effects level)
LVL_LIST_ITM = 2; // lvl itm (Items level)
LVL_LIST_THM = 3; // lvl thm (Themes level)

for (var l = 0; l < lvl_amtMax; l++) // [lvl eff/itm/thm]
{
	list_amtMax[l] = 0;
	list_hasArr[l] = -1;
	list_nameArr[l] = -1;
	list_descArr[l] = -1;
	list_lblKey_text[l] = "%%%";
	if (l == LVL_LIST_EFF) // [lvl eff] Get data
	{
		list_amtMax[l] = global.eff_amtMax;
		list_hasArr[l] = global.eff_has;
		list_nameArr[l] = global.eff_name_text;
		list_descArr[l] = global.eff_desc_text;
		list_lblKey_text[l] = "eff";
	}
	else if (l == LVL_LIST_ITM) // [lvl itm] Get data
	{
		list_amtMax[l] = global.itm_amtMax;
		list_hasArr[l] = global.itm_has;
		list_nameArr[l] = global.itm_name_text;
		list_descArr[l] = global.itm_desc_text;
		list_lblKey_text[l] = "itm";
	}
	else if (l == LVL_LIST_THM) // [lvl thm] Get data
	{
		list_amtMax[l] = global.thm_amtMax;
		list_hasArr[l] = global.thm_has;
		list_nameArr[l] = global.thm_name_text;
		list_descArr[l] = global.thm_desc_text;
		list_lblKey_text[l] = "thm";
	}
	
	
	if (l == LVL_LIST_EFF) || (l == LVL_LIST_ITM) || (l == LVL_LIST_THM)
	{
		for (var i = 0; i < list_amtMax[l]; i++) // opts  →  Get text
		{
			if (array_get(list_hasArr[l], i) == true)
			{
				fn_log(array_get(list_nameArr[l], i));
				opt_text[l, i] = array_get(list_nameArr[l], i);
			}
			else
				opt_text[l, i] = "----------";
	
			fn_menu_opt_sizedata(l, i);
		}
		opt_amt[l] = list_amtMax[l];
		
		px_act[l, 0] = true; // Dark translucent background
		px_x[l, 0] = 0;
		px_y[l, 0] = 0;
		px_w[l, 0] = 320;
		px_h[l, 0] = 240;
		px_col[l, 0] = global.thm_col[global.thm_cur, 4];
		px_alp[l, 0] = 0.75;
		
		fn_menu_ttl_textdata(l, "menu_inv_" + string(list_lblKey_text[l]) + "_ttl"); // ttl (Title window and label)
		
		wnd_act[l, 1] = true; // opts wnd (Options window)
		wnd_x[l, 1] = (draw_dist * 2);
		wnd_y[l, 1] = (ttlWnd_y[l] + ttlWnd_h[l] + draw_dist);
		wnd_w[l, 1] = (320 - (wnd_x[l, 1] * 2));
		wnd_h[l, 1] = (240 - wnd_y[l, 1] - draw_dist);
		
		var _opt_xPos = 0; // opts (Options)  →  Get positions
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
			
			fn_menu_optSlctr_drawdata(l, i); // optSlctr (Option selector)
		}
		
		if (array_get(list_hasArr[l], optMove_pos[l]) == true) // desc (Description)
			lbl_text[l, 1] = array_get(list_descArr[l], optMove_pos[l]);
		lbl_x[l, 1] = (wnd_x[l, 1] + draw_dist);
		lbl_y[l, 1] = (wnd_y[l, 1] + wnd_h[l, 1] - draw_dist);
		lbl_col[l][1][0] = global.thm_col[global.thm_cur, 0];
		lbl_col[l][1][1] = global.thm_col[global.thm_cur, 1];
		lbl_alp[l, 1] = 1;
		lbl_vAl[l, 1] = fa_bottom;
	}
}




fn_menu_lvlTrans_start(LVL_MAIN);

fn_aud_play(global.thm_snd_optSlct[global.thm_cur], CONFIG_VOLTYPE.MENU);
