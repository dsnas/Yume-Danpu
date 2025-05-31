
image_speed = 0;
image_index = 0;
image_alpha = 0;

fn_import();




randomize();
window_center();
var _caption = "Yume Danpu";
var i = irandom_range(1, 100);
if (i <= 5)
	_caption = choose("Danpu Nikki", "Yume Nikki", "Yume Dapnu", "Yume Danpy", "Yume Dangu", "Yume Fanpu", "Dume Yanpu", "Yume Champu");
window_set_caption(_caption);
display_set_gui_size(320, 240);
	
	
global.game_ver = "0.02";
global.fnt_main = font_add_sprite_ext(spr_fnt_main, "aáàâãbcçdeéèêfghiíìîjklmnoóòôõpqrstuúùûvwxyzAÁÀÂÃBCÇ₢DEÉÈÊFGHIÍÌÎJKLMNOÓÒÔÕPQRS$TUÚÙÛVWXYZ' ,.?!:;\"1234567890%()[]/_-—<>←→↑↓", false, -1);
	
fn_sett_start(); // start sett (settings)
fn_txtData_start(); // start txtData of the selected lang
	
fn_eff_start(); // start effs (effects)
fn_itm_start(); // start itms (items)
fn_thm_start(); // start thms (themes)
fn_chara_start(); // start chara (player)




fscr = -1;
fscr_delay = 0;
fscr_maxDelay = 30;

devVer_txt = "Development Version " + string(global.game_ver); // devVer (development version)
devVer_x = (320 - 4);
devVer_y = (240 - 4);
devVer_col = global.thm_col[global.chara_thm, 0];
devVer_alp = 0.25;
devVer_val = fa_bottom;
devVer_hal = fa_right;

fn_spawn(obj_game_dbg, 0, 0);
