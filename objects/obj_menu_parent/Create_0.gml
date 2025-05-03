
image_speed = 0;
image_index = 0;
image_alpha = 0;

draw_x = 0;
draw_y = 0;
draw_dist = 32;
draw_hTxt = fn_txt_h("Salenis");



lvl = 0; // level (like play, settings, controls or credits)
lvl_maxAmt = 10;

alp = 1;



px_maxAmt = 25; // px (stretched pixels)
for (var z = 0; z < lvl_maxAmt; z++)
{
	for (var i = 0; i < px_maxAmt; i++)
	{
		px_x[z, i] = 0;
		px_y[z, i] = 0;
		px_w[z, i] = 0;
		px_h[z, i] = 0;
		px_col[z, i] = c_black;
		px_alp[z, i] = 1;
	}
}



bg_maxAmt = 5; // bg (backgrounds) (those gray boxes that stay behind the text)
for (var z = 0; z < lvl_maxAmt; z++) // options
{
	for (var i = 0; i < bg_maxAmt; i++)
	{
		bg_spr[z, i] = -1;
		bg_img[z, i] = 0;
		bg_x[z, i] = 0;
		bg_y[z, i] = 0;
		bg_w[z, i] = 0;
		bg_h[z, i] = 0;
		bg_col[z, i] = c_white;
		bg_alp[z, i] = 1;
	}
}



opt_maxAmt = 25; // opt (options)
for (var z = 0; z < lvl_maxAmt; z++)
{
	for (var i = 0; i < opt_maxAmt; i++)
	{
		opt_txt[z, i] = "";
		opt_w[z, i] = 0;
		opt_h[z, i] = 0;
		opt_wMax[z] = 0;
		
		opt_x[z, i] = 0;
		opt_y[z, i] = 0;
		opt_col[z, i] = c_white;
		opt_alp[z, i] = 1;
		opt_val[z, i] = fa_top;
		opt_hal[z, i] = fa_left;
		
		opt_pos = 0;
		opt_pos_x[z, i] = 0;
		opt_pos_y[z, i] = 0;
		opt_pos_col[z, i] = c_white;
		opt_pos_alp[z, i] = 1;
	}
	
	opt_amt[z] = 0;
}
opt_move = true;


event_user(0); // (child) create
