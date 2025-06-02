/// @descr [create]
/// [wrld] pse menu (Pause menu) (tambem conhecido como "pois-é menu")

LVL_MAIN = 0;
var l = LVL_MAIN;
fn_menu_opt_txtdata(l, "menu_pse_main_opt");

px_act[l, 0] = true; // [main lvl] dark translucent background
px_x[l, 0] = 0;
px_y[l, 0] = 0;
px_w[l, 0] = 320;
px_h[l, 0] = 240;
px_col[l, 0] = c_black;
px_alp[l, 0] = 0.75;

wnd_act[l, 0] = true; // [main lvl] lbl wnd
wnd_x[l, 0] = -draw_dist;
wnd_y[l, 0] = -draw_dist;
wnd_w[l, 0] = ((abs(wnd_x[l, 0]) * 2) + 320);
var _wnd_hDist = (draw_dist * 2);
wnd_h[l, 0] = (abs(wnd_y[l, 0]) + _wnd_hDist);

lbl_txt[l, 0] = fn_txtdata("menu_pse_main_lbl_0"); // [main lvl] title lbl
lbl_w[l, 0] = fn_txt_w(lbl_txt[l, 0]);
lbl_x[l, 0] = wnd_x[l, 0] + (wnd_w[l, 0] / 2) - (lbl_w[l, 0] / 2);
var _lbl_yDistFix = 1;
lbl_y[l, 0] = ((_wnd_hDist / 2) - (draw_hTxt / 2) - _lbl_yDistFix);

var _opt_yDist = draw_dist; // [main lvl] opts
var _opt_yFix = 1;
var _opt_hAll = (_opt_yDist * (opt_amt[l] - 1) + draw_hTxt);

wnd_act[l, 1] = true;
var _wnd_xDist = (draw_dist * 3); // [main lvl] lbls wnd
var _wnd_yDist = (draw_dist * 2);
wnd_w[l, 1] = (opt_wMax[l] + _wnd_xDist);
wnd_h[l, 1] = (_opt_hAll + _wnd_yDist);
wnd_x[l, 1] = (160 - (wnd_w[l, 1] / 2));
wnd_y[l, 1] = (120 + (_wnd_hDist / 2) - (wnd_h[l, 1] / 2));

for (var i = 0; i < opt_amt[l]; i++)
{
	opt_x[l, i] = (wnd_x[l, 1] + (wnd_w[l, 1] / 2) - (opt_w[l, i] / 2));
	opt_y[l, i] = (wnd_y[l, 1] + (wnd_h[l, 1] / 2) - (_opt_hAll / 2) - _opt_yFix + (_opt_yDist * i));
	
	fn_menu_optSlctr_drawdata(l, i);
}




fn_menu_lvlTrans(LVL_MAIN);

scrSv_spr = -1;
if (global.sett_lowGFX == false) // (if the low graphics option is enabled) (taking a screenshot of the game can freeze the game for half a second)
{
	scrSv_fname = "menu_pause_scrSv.png"; // (takes a screenshot of the game to use as the background, since all objects will temporarily deactivate and disappear)
	surface_save(application_surface, working_directory + string(scrSv_fname));
	scrSv_spr = sprite_add(scrSv_fname, 1, false, false, 0, 0);
	scrSv_xSc = 0.5;
	scrSv_ySc = 0.5;
}

instance_deactivate_all(true); // (deactivates all objects in the room, excluding the main persistent ones)
instance_activate_object(obj_game_main);
instance_activate_object(obj_game_dbg);
audio_pause_all(); // (pauses all currently playing audio)

fn_aud_play(global.thm_snd_optSlct[global.chara_thm], SETT_VOL.MENU);
