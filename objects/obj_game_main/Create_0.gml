
image_speed = 0;
image_index = 0;
image_alpha = 0;


fn_game_start();


// For toggling fullscreen
fscr = -1;
fscr_delay = 0;
fscr_delayMax = 30;


// For drawing the version number
verNum_spr = spr_verNum;
verNum_w = fn_spr_w(verNum_spr);
verNum_h = fn_spr_h(verNum_spr);
verNum_x = (320 - 4 - verNum_w);
verNum_y = (240 - 4 - verNum_h);
verNum_col[0] = global.thm_col[global.thm_cur].grayLight;
verNum_col[1] = global.thm_col[global.thm_cur].whiteLight;
verNum_alp = 0.5;
