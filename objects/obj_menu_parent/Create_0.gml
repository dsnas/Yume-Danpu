
image_speed = 0;
image_index = 0;
image_alpha = 0;

fn_import();


draw_dist = 16;
draw_x = 0;
draw_y = 0;
draw_hTxt = fn_txt_h("Salenis");
draw_alp = 1;


lvl_amtMax = 10; // lvl (level) (like play, settings, controls or credits)
lvl = lvl_amtMax;
for (var l = 0; l < (lvl_amtMax + 1); l++)
	lvl_alp[l] = 0;

lvlTrans_act = false; // lvlTrans (transition between levels) (trans rights, am i right?!!)
lvlTrans_alpSpd = 0.25;
lvlTrans_tgtLvl = -1; // (target level)
lvlTrans_tgtOptPos = 0; // (target option position)
lvlTrans_kill = false;


px_amtMax = 25; // px (stretched pixels)
for (var l = 0; l < lvl_amtMax; l++)
{
	for (var i = 0; i < px_amtMax; i++)
	{
		px_act[l, i] = false;
		px_x[l, i] = 0;
		px_y[l, i] = 0;
		px_w[l, i] = 0;
		px_h[l, i] = 0;
		px_col[l, i] = c_black;
		px_alp[l, i] = 1;
	}
}


wnd_amtMax = 5; // wnd (window) (those boxes that stay behind the text)
for (var l = 0; l < lvl_amtMax; l++)
{
	for (var i = 0; i < wnd_amtMax; i++)
	{
		wnd_act[l, i] = false;
		wnd_spr[l, i] = global.thm_wnd_spr[global.chara_thm];
		wnd_img[l, i] = 0;
		wnd_x[l, i] = 0;
		wnd_y[l, i] = 0;
		wnd_w[l, i] = 0;
		wnd_h[l, i] = 0;
		wnd_col[l, i] = c_white;
		wnd_alp[l, i] = 1;
	}
}


opt_amtMax = 25; // opt (option) and optSlctr (option selector, selection/focus indicator)
for (var l = 0; l < lvl_amtMax; l++)
{
	opt_amt[l] = 0;
	
	for (var i = 0; i < opt_amtMax; i++)
	{
		opt_txt[l, i] = "%%%"; // opt
		
		opt_w[l, i] = 0;
		opt_h[l, i] = 0;
		opt_wMax[l] = 0;
		
		opt_x[l, i] = 0;
		opt_y[l, i] = 0;
		opt_colDflt[l][i][0] = global.thm_col[global.chara_thm, 2]; // (colors of the option when the it's not selected)
		opt_colDflt[l][i][1] = global.thm_col[global.chara_thm, 3]; // (colors of the option when the it's not selected)
		opt_colSlct[l][i][0] = global.thm_col[global.chara_thm, 0]; // (colors of the option when it's selected)
		opt_colSlct[l][i][1] = global.thm_col[global.chara_thm, 1]; // (colors of the option when it's selected)
		opt_col[l][i][0] = opt_colDflt[l][i][0]; // (current colors of the option)
		opt_col[l][i][1] = opt_colDflt[l][i][1];
		opt_colSpd = 0.35;
		opt_alp[l, i] = 1;
		opt_vAl[l, i] = fa_top;
		opt_hAl[l, i] = fa_left;
		
		optSlctr_act[l, i] = false; // optSlctr
		optSlctr_spr[l, i] = global.thm_optSlctr_spr[global.chara_thm];
		optSlctr_x[l, i] = 0;
		optSlctr_xDistFix[l, i] = 1; // (fixes font sprite's empty space on the left)
		optSlctr_xDist[l, i] = global.thm_optSlctr_xDist[global.chara_thm];
		optSlctr_y[l, i] = 0;
		optSlctr_yDistFix_0[l, i] = 3; // (fixes acute, grave, and circumflex accent diacritics)
		optSlctr_yDistFix_1[l, i] = 1; // (fixes descenders)
		optSlctr_yDist[l, i] = global.thm_optSlctr_yDist[global.chara_thm];
		optSlctr_w[l, i] = 0;
		optSlctr_h[l, i] = 0;
		optSlctr_alp[l, i] = 0;
		optSlctr_alpSpd = opt_colSpd;
		
		opt_pos[l] = 0; // opt pos (the position of the selected option in its array) (per lvl due to lvlTrans)
	}
}
opt_move = true;


lbl_amtMax = 25; // lbl (label) (text that aren't options, but information)
for (var l = 0; l < lvl_amtMax; l++)
{
	for (var i = 0; i < lbl_amtMax; i++)
	{
		lbl_txt[l, i] = "%%%";
		lbl_w[l, i] = 0;
		lbl_h[l, i] = 0;
		
		lbl_x[l, i] = 0;
		lbl_y[l, i] = 0;
		lbl_col[l][i][0] = global.thm_col[global.chara_thm, 0];
		lbl_col[l][i][1] = global.thm_col[global.chara_thm, 1];
		lbl_alp[l, i] = 1;
		lbl_vAl[l, i] = fa_top;
		lbl_hAl[l, i] = fa_left;
	}
}




event_user(0); // (child) create
