
fn_game_start();


fn_obj_img( , , , , 0);
fn_obj_depth( , -15000);


// For toggling fullscreen
fscr = -1;
fscr_delay = 0;
fscr_delayMax = 30;


// For drawing the version number
verText_spr = spr_verText;
verText_w = fn_spr_w(verText_spr);
verText_h = fn_spr_h(verText_spr);
verText_x = (320 - 4 - verText_w);
verText_y = (240 - 4 - verText_h);
verText_col[0] = global.thm_col[global.thm_cur].grayLight;
verText_col[1] = global.thm_col[global.thm_cur].whiteLight;
verText_alp = 0.5;
