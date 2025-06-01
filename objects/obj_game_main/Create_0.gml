
image_speed = 0;
image_index = 0;
image_alpha = 0;

fn_import();




randomize();
window_set_position(display_get_width() / 1.5, display_get_height / 4);
//window_center();
var _caption = "Yume Danpu";
var i = irandom_range(1, 100);
if (i <= 5)
	_caption = choose("Danpu Nikki", "Yume Nikki", "Yume Dapnu", "Yume Danpy", "Yume Dangu", "Yume Fanpu", "Dume Yanpu", "Yume Champu");
window_set_caption(_caption);
display_set_gui_size(320, 240);

global.game_ver = "0.02";
global.game_fnt = font_add_sprite_ext(spr_game_fnt, "aáàâãbcçdeéèêfghiíìîjklmnoóòôõpqrstuúùûvwxyzAÁÀÂÃBCÇ₢DEÉÈÊFGHIÍÌÎJKLMNOÓÒÔÕPQRS$TUÚÙÛVWXYZ' ,.?!:;\"1234567890%()[]/_-—<>←→↑↓", false, -1);

fn_sett_start(); // start sett (settings)
fn_txtData_start(); // start txtData of the selected lang

fn_eff_start(); // start effs (effects)
fn_itm_start(); // start itms (items)
fn_thm_start(); // start thms (themes)
fn_chara_start(); // start chara (player)

fn_mus_start(); // start mus (starts/resets the array that will store the music's information)

room_goto(temp_rm_menu_main);
fn_spawn(obj_game_dbg, 0, 0);




fscr = -1;
fscr_delay = 0;
fscr_maxDelay = 30;

verNum_spr = spr_verNum;
verNum_w = fn_spr_w(verNum_spr);
verNum_h = fn_spr_h(verNum_spr);
verNum_x = (320 - 4 - verNum_w);
verNum_y = (240 - 4 - verNum_h);
for (var v = 0; v < 2; v++)
{
	var c = 0;
	if (v == 1)
		c = 2;
	verNum_col[v] = global.thm_col[global.chara_thm, c];
}
verNum_alp = 0.5;
