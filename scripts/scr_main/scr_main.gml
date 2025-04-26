
function fn_import_img() // adjusts the default image variables to turn the instance invisible
{
	image_speed = 0;
	image_index = 0;
	image_alpha = 0;
}

function fn_import() // starts basic variables mostly used for referencing specific objects
{
	main	= obj_game_main;
	inp		= obj_game_inp;
	dbg		= obj_game_dbg;
	
	wrld	= room;
	wrld_w	= room_width;
	wrld_h	= room_height;
	
	wrld_chara = obj_wrld_chara;
	
	wrld_rpt = obj_wrld_rpt;
	
	audio_id = -1;
}



function fn_audio_play(_audio, _audio_loops, _audio_volId, _audio_gainLvl, _audio_gainTime) // plays the specified audio with the given characteristics
{
	audio_id = audio_play_sound(_audio, 1, _audio_loops);
	fn_audio_gain(audio_id, _audio_volId, _audio_gainLvl, _audio_gainTime);
}

function fn_audio_stop(_audio) // stops the specified audio
{
	audio_stop_sound(_audio);
}

function fn_audio_gain(_audio_id, _audio_volId, _audio_gainLvl, _audio_gainTime) // adjusts the volume of the specified audio
{
	_audio_gainLvl = (global.sett_vol[VOL_MASTER] * (_audio_gainLvl * global.sett_vol[_audio_volId]));
	audio_sound_gain(_audio_id, _audio_gainLvl, _audio_gainTime);
}

function fn_audio_pitch(_audio_id, _audio_pitch) // adjusts the pitch of the specified audio
{
	audio_sound_pitch(_audio_id, _audio_pitch);
}

function fn_audio_curr(_audio_id) // returns whether the specified audio is currently playing
{
	return audio_is_playing(_audio_id);
}



function fn_draw_txt(_txt, _x, _y, _xSc, _ySc, _ang, _col_0, _col_1, _col_2, _col_3, _alp) // draws a text with the provided characteristics
{
	draw_text_ext_transformed_color(_x, _y, _txt, -1, 640, _xSc, _ySc, _ang, _col_0, _col_1, _col_2, _col_3, _alp);
}

function fn_draw_px(_x, _y, _w, _h, _col_0, _col_1, _col_2, _col_3, _alp) // draws a rectangle with the provided characteristics (performance is faster with "draw_sprite" than "draw_rectangle")
{
	draw_sprite_general(spr_px, 0, 0, 0, 1, 1, _x, _y, _w, _h, 0, _col_0, _col_1, _col_2, _col_3, _alp);
}

function fn_draw_spr(_spr, _img, _x, _y, _xSc, _ySc, _ang, _col, _alp) // draws the specified sprite with the provided characteristics
{
	if (_spr != -1)
		draw_sprite_ext(_spr, _img, _x, _y, _xSc, _ySc, _ang, _col, _alp);
	else
		fn_dbg("fn_draw_spr() called without a sprite to draw");
}

function fn_draw_self(_x, _y, _xSc, _ySc, _ang) // draws the object's own sprite
{
	fn_draw_spr(sprite_index, image_index, _x, _y, _xSc, _ySc, _ang, image_blend, image_alpha);
}



function fn_dbg(_msg) // sends a message to the debug log
{
	show_debug_message("[" + string(object_get_name(object_index)) + "] " + string(argument0) + " [" + string(current_time) + "]");
}



function fn_create(_obj, _x, _y) // creates the specified object at the given position
{
	obj = instance_create_layer(_x, _y, "Instances", _obj);
}

function fn_destroy(_obj_id) // destroys the specified object
{
	instance_destroy(_obj_id);
}

function fn_exists(_obj) // returns whether if the specified object exists
{
	return instance_exists(_obj);
}



function fn_spr_w(_spr) // returns the width of the specified sprite
{
	return sprite_get_width(_spr);
}

function fn_spr_h(_spr) // returns the height of the specified sprite
{
	return sprite_get_height(_spr);
}
