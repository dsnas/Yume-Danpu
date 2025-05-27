
image_speed = 0;
image_index = 0;
image_alpha = 0;

fn_import();


draw_dist = 16;
draw_x = 0;
draw_y = 0;
draw_hTxt = fn_txt_h("Salenis");
draw_alp = 0;


lvl = 0; // level (like play, settings, controls or credits)
lvl_amtMax = 10;


px_amtMax = 25; // px (stretched pixels)
for (var z = 0; z < lvl_amtMax; z++)
{
	for (var i = 0; i < px_amtMax; i++)
	{
		px_act[z, i] = false;
		px_x[z, i] = 0;
		px_y[z, i] = 0;
		px_w[z, i] = 0;
		px_h[z, i] = 0;
		px_col[z, i] = c_black;
		px_alp[z, i] = 1;
	}
}


win_amtMax = 5; // win (windows) (those boxes that stay behind the text)
for (var z = 0; z < lvl_amtMax; z++)
{
	for (var i = 0; i < win_amtMax; i++)
	{
		win_act[z, i] = false;
		win_spr[z, i] = global.thm_win_spr[global.chara_thm];
		win_img[z, i] = 0;
		win_x[z, i] = 0;
		win_y[z, i] = 0;
		win_w[z, i] = 0;
		win_h[z, i] = 0;
		win_col[z, i] = c_white;
		win_alp[z, i] = 1;
	}
}


opt_amtMax = 25; // opt (options)
for (var z = 0; z < lvl_amtMax; z++)
{
	opt_amt[z] = 0;
	
	for (var i = 0; i < opt_amtMax; i++)
	{
		opt_txt[z, i] = "%%%";
		opt_w[z, i] = 0;
		opt_h[z, i] = 0;
		opt_wMax[z] = 0;
		
		opt_x[z, i] = 0;
		opt_y[z, i] = 0;
		opt_col_0[z, i] = global.thm_col[global.chara_thm, 2];
		opt_col_1[z, i] = global.thm_col[global.chara_thm, 3];
		opt_colSpd = 0.4;
		opt_alp[z, i] = 1;
		opt_vAl[z, i] = fa_top;
		opt_hAl[z, i] = fa_left;
		
		optSlctr_act[z, i] = false; // optSlctr (option selector, selection/focus indicator)
		optSlctr_spr[z, i] = global.thm_optSlctr_spr[global.chara_thm];
		optSlctr_x[z, i] = 0;
		optSlctr_xDistFix[z, i] = 1; // (font sprite's extra pixels on the sides)
		optSlctr_xDist[z, i] = global.thm_optSlctr_xDist[global.chara_thm];
		optSlctr_y[z, i] = 0;
		optSlctr_yDistFix_0[z, i] = 3; // (acute, grave, and circumflex accent diacritics)
		optSlctr_yDistFix_1[z, i] = 1; // (descenders)
		optSlctr_yDist[z, i] = global.thm_optSlctr_yDist[global.chara_thm];
		optSlctr_w[z, i] = 0;
		optSlctr_h[z, i] = 0;
		optSlctr_alp[z, i] = 0;
		optSlctr_alpSpd = 0.25;
	}
}
opt_move = true;
opt_pos = 0;


lbl_amtMax = 25; // lbl (labels) (text that aren't options, but information)
for (var z = 0; z < lvl_amtMax; z++)
{
	for (var i = 0; i < lbl_amtMax; i++)
	{
		lbl_str[z, i] = "%%%";
		lbl_w[z, i] = 0;
		lbl_h[z, i] = 0;
		
		lbl_x[z, i] = 0;
		lbl_y[z, i] = 0;
		lbl_col_0[z, i] = global.thm_col[global.chara_thm, 0];
		lbl_col_1[z, i] = global.thm_col[global.chara_thm, 1];
		lbl_alp[z, i] = 1;
		lbl_vAl[z, i] = fa_top;
		lbl_hAl[z, i] = fa_left;
	}
}


trans_stg = -1; // trans (fade in/out transition animation) (trans rights, am i right?!!)
trans_alpAmt = 0.125;
trans_lvl = -1; // lvl to adjust during the trans (transition)
trans_oooooooooooooooooooooooooooooooo = 0; // God .   All these  Letters  really  Do  make me wanna  Jump  from the  Balcony  of my  Apartment Building  .

destroy_stg = -1;


event_user(0); // (child) create
