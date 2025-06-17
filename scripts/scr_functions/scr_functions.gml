
//////// Functions that are basic for the game to work


// Functions related to audio
function fn_aud_play(_aud, _aud_volIdx, _aud_lps = 0, _aud_vol = 1, _aud_volDur = 0, _aud_pit = 1, _aud_ofs = 0)	// (Starts playing the specified audio)
{
	aud = _aud;					// Audio
	aud_volIdx = _aud_volIdx;	// 
	aud_lps = _aud_lps;			// Determines if the audio should loop
	aud_vol = _aud_vol;			// Volume
	aud_volDur = _aud_volDur;	// Duration in frames of the volume fade-in
	aud_pit = _aud_pit;			// Pitch
	aud_ofs = _aud_ofs;			// Offset, the time in seconds of the audio to start playing
	
	fn_aud_fix();
	
	aud_id = audio_play_sound(aud, 0, aud_lps, 0, aud_ofs, aud_pit); // (plays audio)
	
	aud_vol = ((aud_vol * global.sett_vol[aud_volIdx]) * global.sett_vol[VOL_IDX.MASTER]);
	audio_sound_gain(aud_id, aud_vol, aud_volDur);
	
	audio_sound_pitch(aud_id, aud_pit);
	audio_sound_set_track_position(aud_id, aud_ofs);
}
function fn_aud_fix()																								// (Adjusts the volume of the audio to be consistent with other sounds, and its offset and pitch)
{
	// (!!!!!!!!!!!! aud_vol MUST BE MULTIPLIED, NOT ADDED OR SUBTRACTED!!!!!!!!!!)
	
	
	if (aud == mus_menu_home) // (main menu music)
		aud_vol *= 0.45;
	
	
	var _thm_cur = global.thm_cur;
	if (aud == global.thm_opt_move_snd[_thm_cur]) // (menu sounds)
	{
		if (_thm_cur == THM_IDX.DFLT) // (THE SOUND WHOSE VOLUME SHOULD BE USED AS THE REFERENCE POINT FOR ALL OTHERS)
			aud_vol *= 1; // (MUST BE ONE)
		if (_thm_cur == THM_IDX.MADOT)
			aud_vol *= 0.4;
	}
	if (aud == global.thm_opt_slct_snd[_thm_cur])
	{
		if (_thm_cur == THM_IDX.DFLT)
			aud_vol *= 1.35;
		if (_thm_cur == THM_IDX.MADOT)
			aud_vol *= 0.2;
	}
	if (aud == global.thm_opt_cncl_snd[_thm_cur])
	{
		if (_thm_cur == THM_IDX.DFLT)
			aud_vol *= 0.9;
		if (_thm_cur == THM_IDX.MADOT)
			aud_vol *= 0.2;
	}
	if (aud == global.thm_opt_fail_snd[_thm_cur])
	{
		if (_thm_cur == THM_IDX.MADOT)
			aud_vol *= 0.4;
	}
	
	
	if (aud == snd_player_fstep) // (player footsteps)
		aud_vol *= 0.75;
	
	
	if (aud == mus_macaco) // (Macacolandia's music)
		aud_vol *= 0.25;
	if (aud == snd_entity_macaco_citizen_0) // (Macacolandia citizens sounds)
	{
		aud_vol *= 0.5;
		aud_ofs = 0.25;
	}
	if (aud == snd_entity_macaco_citizen_1)
		aud_ofs = 0.25;
	if (aud == snd_entity_macaco_citizen_2)
		aud_vol *= 0.3;
	if (aud == snd_entity_macaco_citizen_3)
	{
		aud_vol *= 0.85;
		aud_ofs = 0.25;
	}
	if (aud == snd_entity_macaco_citizen_4)
		aud_vol *= 0.65;
	if (aud == snd_entity_macaco_citizen_5)
		aud_vol *= 0.5;
	if (aud == snd_entity_macaco_citizen_6)
	{
		aud_vol *= 0.35;
		aud_ofs = 0.25;
	}
	
	
	if (aud == mus_wrld_pikini)
		aud_vol *= 0.75;
	
	
	return aud_vol;
}
function fn_aud_stop(_aud_id) // (Stops playing the specified audio)
{
	audio_stop_sound(_aud_id);
}
function fn_aud_playing(_aud_id) // (Returns if the specified audio is currently playing)
{
	return audio_is_playing(_aud_id);
}

// Functions related to objects
function fn_obj_create(_obj, _x = 0, _y = 0)	// Creates the specified object at the given position
{
	obj_id = instance_create_layer(_x, _y, "Instances", _obj);
}
function fn_obj_destroy(_obj)					// Destroys the specified object
{
	instance_destroy(_obj);
}
function fn_obj_exists(_obj)					// Returns whether if the specified object exists
{
	return instance_exists(_obj);
}
function fn_obj_imgSpd(_obj, _imgSpd)			// Adjusts the specified object's image speed to the given value
{
	with (_obj)
	{
		image_speed = _imgSpd;
	
		/* (Reduced Motion) */
		if (global.sett_rdcdMot == true) // (Disables animation)
		{
			image_speed = 0;
			image_index = 0;
		}
	}
}

// Functions related to sprites
function fn_spr_w(_spr)		// Returns the width of the specified sprite
{
	if (_spr != -1)
		return sprite_get_width(_spr);
	else
	{
		fn_dbg_log("The function fn_spr_w() was called with an invalid sprite ID");
		return 0;
	}
}
function fn_spr_h(_spr)		// Returns the height of the specified sprite
{
	if (_spr != -1)
		return sprite_get_height(_spr);
	else
	{
		fn_dbg_log("The function fn_spr_h() was called with an invalid sprite ID");
		return 0;
	}
}

// Functions related to text
function fn_text_w(_text)	// Returns the width of the specified text)
{
	draw_set_font(global.game_fnt);
	return string_width(_text);
}
function fn_text_h(_text)	// Returns the height of the specified text
{
	draw_set_font(global.game_fnt);
	return string_height(_text);
}




// Functions related to drawing
function fn_draw_text(_text, _x, _y, _col_0, _col_1, _alp = 1, _vAl = fa_top, _hAl = fa_left, _xSc = 1, _ySc = 1, _ang = 0)		// Draws the specified text
{
	var _fnt = global.game_fnt;
	draw_set_font(_fnt);
	draw_set_valign(_vAl);
	draw_set_halign(_hAl);
	
	if (global.thm_shdw_act[global.thm_cur] == true)
	{
		var _col_shdw = global.thm_col[global.thm_cur, 4];
		draw_text_ext_transformed_color((_x + 1), (_y + 1), _text, -1, 640, _xSc, _ySc, _ang, _col_shdw, _col_shdw, _col_shdw, _col_shdw, _alp);
	}
	
	draw_text_ext_transformed_color(_x, _y, _text, -1, 640, _xSc, _ySc, _ang, _col_0, _col_0, _col_1, _col_1, _alp);
}

function fn_draw_rect(_x, _y, _w, _h, _col_0, _col_1, _col_2, _col_3, _alp)														// Draws a rectangle 
{
	draw_sprite_general(spr_px, 0, 0, 0, 1, 1, _x, _y, _w, _h, 0, _col_0, _col_1, _col_2, _col_3, _alp);
}

function fn_draw_spr(_spr, _img, _x, _y, _col = c_white, _alp = 1, _xSc = 1, _ySc = 1, _ang = 0, _shdw_act = false)				// Draws the specified sprite
{
	if (_spr != -1)
	{
		// Draws the shadow of the specified sprite
		if (_shdw_act == true && global.thm_shdw_act[global.thm_cur] == true)
			draw_sprite_ext(_spr, _img, (_x + 1), (_y + 1), _xSc, _ySc, _ang, global.thm_col[global.thm_cur, 4], _alp);
		
		// Draws the specified sprite
		draw_sprite_ext(_spr, _img, _x, _y, _xSc, _ySc, _ang, _col, _alp);
	}
	else
		fn_dbg_log("The function fn_draw_spr() was called with an invalid sprite ID");
}
function fn_draw_spr_stretch(_spr, _img, _x, _y, _w, _h, _col = c_white, _alp = 1)												// Draws the specified sprite, but STRETCHED
{
	if (_spr != -1)
		draw_sprite_stretched_ext(_spr, _img, _x, _y, _w, _h, _col, _alp);
	else
		fn_dbg_log("The function fn_draw_spr_stretch() was called with an invalid sprite ID");
}
function fn_draw_spr_part(_spr, _img, _lt, _top, _w, _h, _x, _y, _col = c_white, _alp = 1, _xSc = 1, _ySc = 1)					// Draws only a part of the specified sprite
{
	if (_spr != -1)
		draw_sprite_part_ext(_spr, _img, _lt, _top, _w, _h, _x, _y, _xSc, _ySc, _col, _alp);
	else
		fn_dbg_log("The function fn_draw_spr_part() was called with an invalid sprite ID");
}

function fn_draw_line(_x1, _y1, _x2, _y2, _col, _alp, _thickness)																// Draws a line
{
	draw_set_color(_col);
	draw_set_alpha(_alp);
	draw_line_width(_x1, _y1, _x2, _y2, _thickness);
}

function fn_draw_self_setup()	// Sets up variables for manual self-drawing
{
	self_x = x;
	self_y = y;
	self_xSc = 1;
	self_ySc = 1;
	self_ang = 0;
}
function fn_draw_self()			// Manually self-draws
{
	fn_draw_spr(sprite_index, image_index, self_x, self_y, image_blend, image_alpha, self_xSc, self_ySc, self_ang, false);
}




// Functions related to math
function fn_lerp(_valCur, _valTgt, _spd)
{
	var _val = lerp(_valCur, _valTgt, _spd);
	
	// Checks if the setting Reduced Motion is on to skip lerp()'s animation
	if (global.sett_rdcdMot == true)
		_val = _valTgt;
	
	return _val;
}
function fn_lerp_col(_colCur, _colTgt, _spd)
{
	var _colCur_hue = color_get_hue(_colCur);
	var _colCur_sat = color_get_saturation(_colCur);
	var _colCur_vAl = color_get_value(_colCur);
	
	var _colTgt_hue = color_get_hue(_colTgt);
	var _colTgt_sat = color_get_saturation(_colTgt);
	var _colTgt_vAl = color_get_value(_colTgt);
	
	var _col_hue = fn_lerp(_colCur_hue, _colTgt_hue, _spd);
	var _col_sat = fn_lerp(_colCur_sat, _colTgt_sat, _spd);
	var _col_vAl = fn_lerp(_colCur_vAl, _colTgt_vAl, _spd);
	
	return make_color_hsv(_col_hue, _col_sat, _col_vAl);
}




// Functions related to debugging
function fn_dbg_log(_msg)	// Sends a message to the debug log
{
	show_debug_message("[" + string(current_time) + "]  [" + string(object_get_name(object_index)) + "]  " + string(_msg));
}
