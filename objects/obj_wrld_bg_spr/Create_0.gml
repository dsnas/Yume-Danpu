
depth = 0;
alarm[0] = 1;


draw_act = false;

draw_spr = -1;
draw_img = 0;
draw_x = 0;
draw_y = 0;
draw_xSc = 1;
draw_ySc = 1;
draw_ang = 0;
draw_col = c_white;
draw_alp = 0.5;

draw_rpt = true; // (background repeats)
draw_rpt_amt = 0;
draw_rpt_amtAuto = true;
draw_rpt_xDist = 640;
draw_rpt_yDist = 480;
draw_rpt_autoDist = false;

draw_move = true; // (background moves)
draw_move_xSpd = 0;
draw_move_ySpd = 0;
draw_move_xDur = (60 * 60);
draw_move_yDur = draw_move_xDur;
draw_move_autoSpd = true; // (if the movement speed should be retrieved based on the repetition amount and movement duration)
