/// @descr [Create]

lblSlctr_text[0] = "< "; // (Setup label arrows)
lblSlctr_text[1] = " >";
lblSlctr_w = fn_text_w(lblSlctr_text[0]);
for (var l = 0; l < lvl_amtMax; l++)
{
	for (var i = 0; i < lbl_amtMax; i++)
	{
		for (var z = 0; z < 2; z++)
			lblSlctr_x[l][i][z] = 0;
		lblSlctr_y[l, i] = 0;
		
		lblSlctr_alp[l, i] = 0;
	}
}




LVL_MAIN = 0; // LVL MAIN
var l = LVL_MAIN;
fn_menu_config_lbl_textdata(l);

px_act[l, 0] = true; // [LVL MAIN] (Dark translucent background)
px_x[l, 0] = 0;
px_y[l, 0] = 0;
px_w[l, 0] = 320;
px_h[l, 0] = 240;
px_col[l, 0] = global.thm_col[global.thm, 4];
px_alp[l, 0] = 0.5;

fn_menu_ttl_textdata(l, "menu_config_main_ttl"); // [LVL MAIN] (Title window and text)

fn_menu_lbl_sizedata(l, 0); // [LVL MAIN] (Label #0)
var _lblSlctr_xDist = (draw_dist * 2);

fn_menu_opt_textdata(l, "menu_config_main_opt"); // [LVL MAIN] (Options #0)
var _opt_wAll = (opt_wMax[l] + _lblSlctr_xDist + (lblSlctr_w * 2) + lbl_wMax[l]);

wnd_act[l, 0] = true; // [LVL MAIN] (Options window)
var _wnd_wDist = (draw_dist * 2);
wnd_w[l, 0] = (_opt_wAll + (_wnd_wDist * 2));
var _wnd_hDist = (draw_dist * 2);
wnd_h[l, 0] = (240 - fn_menu_ttlWnd_hDiff(l) - (_wnd_hDist * 2));
wnd_x[l, 0] = (160 - (wnd_w[l, 0] / 2));
wnd_y[l, 0] = (120 - (wnd_h[l, 0] / 2) + (fn_menu_ttlWnd_hDiff(l) / 2));

var _opt_yDist = draw_dist; // [LVL MAIN] (Options #1)
var _opt_hAll = (_opt_yDist * (opt_amt[l] - 1) + opt_hMax[l]);
for (var o = 0; o < opt_amt[l]; o++)
{
	opt_x[l, o] = (wnd_x[l, 0] + (wnd_w[l, 0] / 2) - (_opt_wAll / 2));
	opt_y[l, o] = (wnd_y[l, 0] + (wnd_h[l, 0] / 2) - (_opt_hAll / 2) + (_opt_yDist * o));
	
	fn_menu_opt_slctr_drawdata(l, o);
}

lblSlctr_x[l][0][0] = (opt_x[l, 0] + opt_wMax[l] + _lblSlctr_xDist); // [LVL MAIN] (Label arrows)
lblSlctr_x[l][0][1] = (lblSlctr_x[l][0][0] + lblSlctr_w + lbl_w[l, 0]);
lblSlctr_y[l, 0] = opt_y[l, 0];

lbl_x[l, 0] = (lblSlctr_x[l][0][0] + lblSlctr_w); // [LVL MAIN] (Label #1)
lbl_y[l, 0] = opt_y[l, 0];




LVL_LANG = 1; // LVL LANG (Languages) (Temporarily unused)
LVL_GFX = 2; // LVL VID (Video settings)
LVL_AUD = 3; // LVL AUD (Audio settings)
LVL_INP = 4; // LVL INP (Controls)
LVL_A11Y = 5; // LVL A11Y (Accessibility)

for (var l = 0; l < lvl_amtMax; l++)
{
	config_textKey[l] = "%%%";
	/* (Temporarily unused)
	if (l == LVL_LANG)
	{
		config_textKey[l] = "lang";
	}
	*/
	if (l == LVL_GFX)
	{
		config_textKey[l] = "vid";
	}
	
	
	if /*(l == LVL_LANG) && (Temporarily unused) */ (l == LVL_GFX)
	{
		px_act[l, 0] = true; // (Dark translucent background)
		px_x[l, 0] = 0;
		px_y[l, 0] = 0;
		px_w[l, 0] = 320;
		px_h[l, 0] = 240;
		px_col[l, 0] = global.thm_col[global.thm, 4];
		px_alp[l, 0] = 0.75;
		
		fn_menu_ttl_textdata(l, "menu_config_" + string(config_textKey[l]) + "_ttl"); // (Title window and label)
		
		wnd_act[l, 0] = true; // [LVL MAIN] (Options window)
		var _wnd_wDist = (draw_dist * 3);
		wnd_w[l, 0] = (320 - (_wnd_wDist * 2));
		var _wnd_hDist = draw_dist;
		wnd_h[l, 0] = (240 - fn_menu_ttlWnd_hDiff(l) - (_wnd_hDist * 2));
		wnd_x[l, 0] = (160 - (wnd_w[l, 0] / 2));
		wnd_y[l, 0] = (120 - (wnd_h[l, 0] / 2) + (fn_menu_ttlWnd_hDiff(l) / 2));
		
		fn_menu_opt_textdata(l, "menu_config_" + string(config_textKey[l]) + "_opt");
		var _opt_xDistWnd = (draw_dist * 2); // [LVL MAIN] (Options)
		var _opt_yDistWnd = (draw_dist * 2);
		var _opt_yDist = draw_dist;
		for (var o = 0; o < opt_amt[l]; o++)
		{
			opt_x[l, o] = (wnd_x[l, 0] + _opt_xDistWnd);
			opt_y[l, o] = (wnd_y[l, 0] + _opt_yDistWnd + (_opt_yDist * o));
	
			fn_menu_opt_slctr_drawdata(l, o);
			
			fn_menu_config_lbl_textdata(l);
			
			
		}
	}
}




fn_menu_lvlTrans_start(LVL_MAIN);




// name's Template. Menu Template.
