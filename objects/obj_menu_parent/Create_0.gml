
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
		px_x[z, i] = 0;
		px_y[z, i] = 0;
		px_w[z, i] = 0;
		px_h[z, i] = 0;
		px_col[z, i] = c_black;
		px_alp[z, i] = 1;
	}
}



bg_amtMax = 5; // bg (backgrounds) (those gray boxes that stay behind the text)
for (var z = 0; z < lvl_amtMax; z++) // options
{
	for (var i = 0; i < bg_amtMax; i++)
	{
		bg_act[z, i] = false;
		bg_spr[z, i] = global.thm_bg_spr[global.chara_thm];
		bg_img[z, i] = 0;
		bg_x[z, i] = 0;
		bg_y[z, i] = 0;
		bg_w[z, i] = 0;
		bg_h[z, i] = 0;
		bg_col[z, i] = c_white;
		bg_alp[z, i] = 1;
	}
}



opt_amtMax = 25; // opt (options)
for (var z = 0; z < lvl_amtMax; z++)
{
	opt_amt[z] = 0;
	
	for (var i = 0; i < opt_amtMax; i++)
	{
		opt_txt[z, i] = "";
		opt_w[z, i] = 0;
		opt_h[z, i] = 0;
		opt_wMax[z] = 0;
		
		opt_x[z, i] = 0;
		opt_y[z, i] = 0;
		opt_col_0[z, i] = global.thm_col[global.chara_thm, 2];
		opt_col_1[z, i] = global.thm_col[global.chara_thm, 3];
		opt_colSpd = 0.5;
		opt_alp[z, i] = 1;
		opt_val[z, i] = fa_top;
		opt_hal[z, i] = fa_left;
	}
}
opt_move = true;
opt_pos = 0;



trans_stg = -1; // trans (fade in/out transition animation) (trans rights, am i right?!!)
trans_alpAmt = 0.1;
trans_oooooooooooooooooooooooooooooooo = 0; // God .   All these  Letters  really  Do  make me wanna  Jump  from the  Balcony  of my  Apartment Building  .



destroy_stg = -1;



event_user(0); // (child) create
