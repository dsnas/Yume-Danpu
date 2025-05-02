
image_speed = 0;
image_index = 0;
image_alpha = 0;



draw_dist = 32;



lvl = 0; // level (like play, settings, controls or credits)
lvl_maxAmt = 10;



opt_maxAmt = 25;
for (var z = 0; z < lvl_maxAmt; z++) // options
{
	for (var i = 0; i < opt_maxAmt; i++)
	{
		opt_txt[z, i] = "";
		opt_w[z, i] = 0;
		opt_h[z, i] = 0;
		
		opt_x[z, i] = 0;
		opt_y[z, i] = 0;
		opt_col[z, i] = c_white;
		opt_alp[z, i] = 1;
	}
	
	opt_amt[z] = 0;
}
opt_move = true;
opt_move_pos = 0;



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



event_user(0); // (child) create



















/*
px_maxAmt = 5; // stretched pixels
	for (var i = 0; i < px_maxAmt; i++) // loops through each px
	{
		px_x[z, i] = 0;
		px_y[z, i] = 0;
		px_w[z, i] = 0;
		px_y[z, i] = 0;
		px_col_0[z, i] = c_black;
		px_col_1[z, i] = px_col_0[z, i];
		px_col_2[z, i] = px_col_0[z, i];
		px_col_3[z, i] = px_col_0[z, i];
		px_alp[z, i] = 1;
	}
	
	
	
	bg_maxAmt = 5; // backgrounds
	for (var i = 0; i < bg_maxAmt; i++) // loops through each bg
	{
		bg_spr[z, i] = -1; // draw info
		bg_img[z, i] = 0;
		bg_x[z, i] = 0;
		bg_y[z, i] = 0;
		bg_w[z, i] = 0;
		bg_h[z, i] = 0;
		bg_col[z, i] = c_white;
		bg_alp[z, i] = 1;
		
		bg_fade_in[z, i] = true;
		bg_fade_out[z, i] = true;
		bg_fade_stage = 0;
	}
*/


/*
	opt_maxAmt = 25; // options
	for (var i = 0; i < opt_maxAmt; i++) // loops through each opt
	{
		opt_txt[z, i] = ""; // draw info
		opt_x[z, i] = 0;
		opt_y[z, i] = 0;
		opt_col_0[z, i] = c_white;
		opt_col_1[z, i] = opt_col_0[z, i];
		opt_col_2[z, i] = opt_col_0[z, i];
		opt_col_3[z, i] = opt_col_0[z, i];
		opt_alp[z, i] = 1;
		
		opt_w[z, i] = 0; // for finding positions (read-only)
		opt_h[z, i] = 0;
		opt_wMax[z, i] = 0;
	}
	
	opt_pos = 0; // move (movement) info
	opt_move = true;
	opt_move_inp[z, 0] = 0;
	opt_move_inp[z, 1] = 0;
	
	opt_amt[z] = 0;
	*/