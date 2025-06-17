
image_speed = 0;
image_index = 0;
image_alpha = 0;


draw_dist = 16;
draw_x = 0;
draw_y = 0;
global.game_fnt_h = 0
draw_alp = 1;


lvl_amtMax = 10; // lvl (Menu level, like "Start", "Options", "Controls", etc.)
lvl = lvl_amtMax; /*
(The default menu level is set to the maximum amount, so for() loops skip it because it's meant to be empty)
(That is why that, to close the menu, the level should be transitioned to the maximum amount, and why a transition sequence should be started in the Create event)
*/
for (var l = 0; l < (lvl_amtMax + 1); l++) // (This is the only for() loop that goes through the maximum amount level, as it just to start variables and not to draw anything)
	lvl_alp[l] = 0;


lvlTrans_act = false;		// lvlTrans (Transition sequence between levels) (trans rights, am i right?!!)
lvlTrans_lvlTgt = -1;		// (Target level of the transition)
lvlTrans_menuKill = false;	// (Destroy menu object when transition ends)
lvlTrans_rmTgt = -1;		// (Target room of the transition)
lvlTrans_alpSpd = 0.25;		// (Speed of the transition)
lvlTrans_gameKill = false;	// (Ends game when transition ends)


px_amtMax = 25; // pxs (Stretched pixels)
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


wnd_amtMax = 5; // wnds (Windows, the background rectangles that stay behind all text)
for (var l = 0; l < lvl_amtMax; l++)
{
	for (var i = 0; i < wnd_amtMax; i++)
	{
		wnd_act[l, i] = false;
		wnd_spr[l, i] = global.thm_wnd_spr[global.thm_cur];
		wnd_img[l, i] = 0;
		wnd_x[l, i] = 0;
		wnd_y[l, i] = 0;
		wnd_w[l, i] = 0;
		wnd_h[l, i] = 0;
		wnd_col[l, i] = c_white;
		wnd_alp[l, i] = 1;
	}
}


opt_amtMax = 25; // opts (Options)
for (var l = 0; l < lvl_amtMax; l++)
{
	opt_amt[l] = 0;
	optMove_pos[l] = 0; // (The index of the selected option) (Per-level due to lvlTrans, the transition sequence)
	
	for (var i = 0; i < opt_amtMax; i++)
	{
		opt_text[l, i] = "%%%"; // opt
		opt_w[l, i] = 0;
		opt_wMax[l] = 0;
		opt_h[l, i] = 0;
		opt_hMax[l] = 0;
		
		opt_x[l, i] = 0;
		opt_y[l, i] = 0;
		
		opt_colTgt[l][i][0][0] = global.thm_col[global.thm_cur, 2]; // (Level, option index, vertical extreme of the option, default/selected)
		opt_colTgt[l][i][1][0] = global.thm_col[global.thm_cur, 3];
		opt_colTgt[l][i][0][1] = global.thm_col[global.thm_cur, 0];
		opt_colTgt[l][i][1][1] = global.thm_col[global.thm_cur, 1];
		opt_col[l][i][0] = opt_colTgt[l][i][0][0]; // (current colors of the option)
		opt_col[l][i][1] = opt_colTgt[l][i][1][0];
		opt_colSpd = 1;
		
		opt_alp[l, i] = 1;
		opt_vAl[l, i] = fa_top;
		opt_hAl[l, i] = fa_left;
	}
}
opt_canMove = true; // (Determines if the player can move through the options)
opt_canSlct = true; // (Determines if the player can select an option)
opt_canCncl = true; // (Determines if the player can cancel the previous selection of an option)
opt_inpLt = 0; // (Left input)
opt_inpRt = 0; // (Right input)
opt_inpUp = 0; // (Up input)
opt_inpDn = 0; // (Down input)
opt_inpSlct = 0; // (Select input)
opt_inpCncl = 0; // (Cancel input)


for (var l = 0; l < lvl_amtMax; l++) // optSlctr (Option selector; Selection/Focus indicator)
{
	for (var i = 0; i < opt_amtMax; i++)
	{
		optSlctr_act[l, i] = true; // (Determines if the selector is active for this option)
		optSlctr_spr[l, i] = global.thm_optSlctr_spr[global.thm_cur];
		optSlctr_x[l, i] = 0;
		optSlctr_xFix[l, i] = 1; // (Fixes font sprite's empty space on the left)
		optSlctr_xDist[l, i] = global.thm_optSlctr_xDist[global.thm_cur];
		optSlctr_y[l, i] = 0;
		optSlctr_yFix_0[l, i] = 3; // (Fixes acute, grave, and circumflex accent diacritics)
		optSlctr_yFix_1[l, i] = 1; // (Fixes descenders)
		optSlctr_yDist[l, i] = global.thm_optSlctr_yDist[global.thm_cur];
		optSlctr_w[l, i] = 0;
		optSlctr_h[l, i] = 0;
		optSlctr_alp[l, i] = 0;
		optSlctr_alpSpd = opt_colSpd;
	}
}


lbl_amtMax = 25; // lbls (Labels, text that aren't options, but information, like "English", "Yes", "No", "R$", etc.)
for (var l = 0; l < lvl_amtMax; l++)
{
	for (var i = 0; i < lbl_amtMax; i++)
	{
		lbl_text[l, i] = "%%%";
		lbl_w[l, i] = 0;
		lbl_wMax[l] = 0;
		lbl_h[l, i] = 0;
		
		lbl_x[l, i] = 0;
		lbl_y[l, i] = 0;
		lbl_col[l][i][0] = global.thm_col[global.thm_cur, 0];
		lbl_col[l][i][1] = global.thm_col[global.thm_cur, 1];
		lbl_alp[l, i] = 1;
		lbl_vAl[l, i] = fa_top;
		lbl_hAl[l, i] = fa_left;
	}
}


for (var l = 0; l < lvl_amtMax; l++) // ttls (Titles, the name of the current level that stays at the top of the screen)
{
	ttl_text[l] = "%%%";
	
	ttlWnd_spr[l] = global.thm_wnd_spr[global.thm_cur];
	ttlWnd_x[l] = -draw_dist;
	ttlWnd_y[l] = -draw_dist;
	ttlWnd_w[l] = ((abs(ttlWnd_x[l]) * 2) + 320);
	ttlWnd_h[l] = (abs(ttlWnd_y[l]) + (draw_dist * 2));
	
	ttl_x[l] = (ttlWnd_x[l] + (ttlWnd_w[l] / 2));
	var _ttl_yDistFix = 1;
	ttl_y[l] = (draw_dist - (global.game_fnt_h / 2) - _ttl_yDistFix);
	ttl_col[l][0] = global.thm_col[global.thm_cur, 0];
	ttl_col[l][1] = global.thm_col[global.thm_cur, 1];
	ttl_vAl[l] = fa_top;
	ttl_hAl[l] = fa_center;
}






event_user(0); // [Child] [Create]
