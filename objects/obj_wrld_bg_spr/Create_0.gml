
fn_import();

depth = 0;
active = false;

draw_spr = -1;
draw_img = 0;
draw_x = 0;
draw_y = 0;
draw_xSc = 1;
draw_ySc = 1;
draw_ang = 0;
draw_col = c_white;
draw_alp = 0.5;

draw_rpt = true; // repetition
draw_rpt_amt = 0;
draw_rpt_autoAmt = true;
draw_rpt_xDist = 0;
draw_rpt_yDist = 0;
draw_rpt_autoDist = true;

draw_move = true; // movement
draw_move_xSpd = 0;
draw_move_ySpd = 0;
draw_move_autoSpd = true;
draw_move_xTime = (60 * 60);
draw_move_yTime = draw_move_xTime;

alarm[0] = 1;
