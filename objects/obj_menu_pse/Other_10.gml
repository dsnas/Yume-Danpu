/// @descr [Create]
/// [wrld] pse menu (Pause menu) (tambem conhecido como "pois-é menu")

LVL_MAIN = 0;
var l = LVL_MAIN;
fn_menu_opt_textdata(l, "menu_pse_main_opt");

px_act[l, 0] = true; // [lvl MAIN] dark translucent background
px_x[l, 0] = 0;
px_y[l, 0] = 0;
px_w[l, 0] = 320;
px_h[l, 0] = 240;
px_col[l, 0] = global.thm_col[global.thm_cur, 4];
px_alp[l, 0] = 0.75;

ttl_text[l] = fn_lang_textData("menu_pse_main_ttl"); // [lvl MAIN] ttl (Title)

var _opt_yDist = draw_dist; // [lvl MAIN] opts (Options)
var _opt_yFix = 1;
var _opt_hAll = (_opt_yDist * (opt_amt[l] - 1) + global.game_fnt_h);

wnd_act[l, 1] = true;
var _wnd_xDist = (draw_dist * 3); // [lvl MAIN] lbls wnd (Labels window)
var _wnd_yDist = (draw_dist * 2);
var _wnd_hDist = (draw_dist * 2);
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




fn_menu_lvlTrans_start(LVL_MAIN);

scrSv_spr = -1;
if (global.sett_lowGfx == false) // (Checks if the low graphics setting is enabled, since taking a screenshot of the screen can freeze the game for half a second)
{
	scrSv_fname = "menu_pause_scrSv.png"; // (Takes a screenshot of the game to use as the background, since all objects will temporarily deactivate and disappear)
	surface_save(application_surface, working_directory + string(scrSv_fname));
	scrSv_spr = sprite_add(scrSv_fname, 1, false, false, 0, 0);
	scrSv_xSc = 0.5;
	scrSv_ySc = 0.5;
}

instance_deactivate_all(true); // (Deactivates all objects in the room, excluding the main persistent ones)
instance_activate_object(obj_game_main);
instance_activate_object(obj_game_dbg);
audio_pause_all(); // (Pauses all currently playing audio)

fn_aud_play(global.thm_snd_optSlct[global.thm_cur], VOL_IDX.MENU);
