
function fn_master_create() // start game
{
	// this is the ugliest piece of code i have ever written in my whole life. what the fuck. i swear i'll try to make it better later
	
	randomize();
	window_center();
	window_set_caption("Yume Danpu");
	
	
	
	fn_sett_start();
	
	
	// i'm gonna do this later, it will take a really long time
	global.fnt_main = font_add_sprite_ext(spr_fnt_main, "abcfmqswçilyíéâùôAFGBHZLÇCNDVMNWÁÈÕÍÛÊÉÀÃ", 0, -2);
	
	
	fn_create(obj_inp, 0, 0);
	
	
	
	global.debug = true;
	show_debug_overlay(global.debug);
}



function fn_create(_obj, _x, _y)
{
	obj = instance_create_layer(_x, _y, "Instances", _obj);
}
function fn_destroy(_obj)
{
	instance_destroy(_obj);
}
function fn_exists(_obj)
{
	return instance_exists(_obj);
}



function fn_draw_px(_x, _y, _w, _h, _col_0, _col_1, _col_2, _col_3, _alp)
{
	draw_sprite_general(spr_px, 0, 0, 0, 1, 1, _x, _y, _w, _h, 0, _col_0, _col_1, _col_2, _col_3, _alp);
}
function fn_draw_spr(_spr, _img, _x, _y, _xSc, _ySc, _ang, _col, _alp)
{
	if (_spr != -1)
		draw_sprite_ext(_spr, _img, _x, _y, _xSc, _ySc, _ang, _col, _alp);
	else
		fn_debug("fn_draw_spr() called without a sprite to draw");
}
function fn_draw_self(_x, _y, _xSc, _ySc, _ang)
{
	fn_draw_spr(sprite_index, image_index, _x, _y, _xSc, _ySc, _ang, image_blend, image_alpha);
}



function fn_audio_play(_audio, _audio_loops, _audio_volId, _audio_gainLvl, _audio_gainTime)
{
	audio_id = audio_play_sound(_audio, 50, _audio_loops);
	fn_audio_gain(audio_id, _audio_volId, _audio_gainLvl, _audio_gainTime);
}
function fn_audio_gain(_audio_id, _audio_volId, _audio_gainLvl, _audio_gainTime)
{
	_audio_gainLvl = (global.sett_vol[VOL_MASTER] * (_audio_gainLvl * global.sett_vol[_audio_volId]));
	audio_sound_gain(_audio_id, _audio_gainLvl, _audio_gainTime);
}
function fn_audio_stop(_audio)
{
	audio_stop_sound(_audio);
}
function fn_audio_now(_audio_id)
{
	return audio_is_playing(_audio_id);
}



function fn_spr_w(_spr)
{
	return sprite_get_width(_spr);
}
function fn_spr_h(_spr)
{
	return sprite_get_height(_spr);
}



function fn_import()
{
	master = obj_master;
	inp = obj_inp;
	
	wrld = room;
	wrld_w = room_width;
	wrld_h = room_height;
	
	wrld_chara = obj_wrld_chara;
	
	wrld_rpt = obj_wrld_rpt;
	
	audio_id = -1;
}



function fn_debug(_msg)
{
	show_debug_message("[" + string(object_get_name(object_index)) + "] " + string(argument0));
}










/* npc
if (wrld == rm_wrld_debug) // debug
{
	if (x == 240 && y == 112)
	{
		move_delayed = false;
		move_maxDist = 99999999999999999999;
		move_spd = 0.5;
		move_time = 0;
		move_maxTime = 32;
		move_chaseChara = true;
		image_index = 1;
	}
}
*/

/* will use this as template for later


global.fnt_main = font_add_sprite_ext(spr_font_main, "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNMçÇáàâãéèêíìîóòôõúùûÁÀÂÃÉÈÊÍÌÎÓÒÔÕÚÙÛ1234567890 -.,'!?%<>()[]/←→↑↓", 0, -2);


function fn_sett_start()
{
	global.sett_lang = 0;
	
	global.sett_gfx = true;
	
	
	
	
	

	
	
	
	global.sett_showfps = false;
	global.sett_autowalk = false;
}







function audio_pitch(_audio, _pitch)
{
	audio_sound_pitch(_audio, _pitch);
}

function audio_stop(_audio)
{
	audio_stop_sound(_audio);
}

function audio_playing(_audio)
{
	return audio_is_playing(_audio);
}
*/
