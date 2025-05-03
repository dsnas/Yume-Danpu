
image_speed = 0;
image_index = 0;
image_alpha = 0;

randomize();
window_center();

var _caption = "Yume Danpu";
var i = irandom_range(1, 100);
if (i <= 5)
	_caption = choose("Yume Dapnu", "Yume Danpy", "Yume Dangu", "Yume Fanpu", "Dume Yanpu");
window_set_caption(_caption);



global.fnt_main = font_add_sprite_ext(spr_fnt_main, "aáàâãbcçdeéèêfghiíìîjklmnoóòôõpqrstuúùûvwxyzAÁÀÂÃBCÇDEÉÈÊFGHIÍÌÎJKLMNOÓÒÔÕPQRSTUÚÙÛVWXYZ' ,.?!:;\"1234567890%()[]/_-<>←→↑↓", false, -2);
fn_sett_start();
fn_txtdata_start();



fn_create(obj_game_dbg, 0, 0);



fscr = -1;
fscr_delay = 0;
fscr_maxDelay = 30;
