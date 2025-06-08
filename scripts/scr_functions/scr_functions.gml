
function fn_import() // starts basic variables mostly used for referencing specific objects
{
	main	= obj_game_main;
	dbg		= obj_game_dbg;
	
	wrld_rm	= room;
	wrld_w	= room_width;
	wrld_h	= room_height;
	
	wrld_chara = obj_wrld_chara;
	wrld_rpt = obj_wrld_rpt;
	
	audio_id = -1;
}




function fn_spawn(_obj, _x, _y) // spawns/creates the specified object at the given position
{
	obj_id = instance_create_layer(_x, _y, "Instances", _obj);
}

function fn_kill(_obj) // kills/destroys the specified object
{
	instance_destroy(_obj);
}

function fn_exists(_obj) // returns whether if the specified object exists
{
	return instance_exists(_obj);
}



function fn_aud_play(_aud, _aud_volIdx, _aud_lps = 0, _aud_vol = 1, _aud_volDur = 0, _aud_pit = 1, _aud_ofs = 0) // (plays the specified audio with the given characteristics)
{
	aud = _aud;					// (audio)
	aud_volIdx = _aud_volIdx;	// (volume index) (index in the volume array from settings) (audio_vol will be multiplied to the volume in the array)
	aud_lps = _aud_lps;			// (loops)
	aud_vol = _aud_vol;			// (volume)
	aud_volDur = _aud_volDur;	// (volume duration) (duration of the volume fade-in)
	aud_pit = _aud_pit;			// (pitch)
	aud_ofs = _aud_ofs;			// (offset) (the time in seconds to start playing)
	
	fn_aud_fix(); // (adjusts the volume of the specified audio to be consistent with other sounds, and its offset)
	
	aud_id = audio_play_sound(aud, 0, aud_lps, 0, aud_ofs, aud_pit); // (plays audio)
	
	aud_vol = ((aud_vol * global.sett_vol[aud_volIdx]) * global.sett_vol[SETT_VOL.MAIN]);
	audio_sound_gain(aud_id, aud_vol, aud_volDur);
	
	audio_sound_pitch(aud_id, aud_pit);
	audio_sound_set_track_position(aud_id, aud_ofs);
}

function fn_aud_fix() // (adjusts the volume of the specified audio to be consistent with other sounds, but also its offset and pitch)
{
	// (!!!!!!!!!!!! aud_vol MUST BE MULTIPLIED, NOT ADDED OR SUBTRACTED!!!!!!!!!!)
	
	
	if (aud == mus_menu_home) // (main menu music)
		aud_vol *= 0.45;
	
	
	var _thm = global.thm_cur;
	if (aud == global.thm_snd_optMove[_thm]) // (menu sounds)
	{
		if (_thm == THM.DFLT) // (THE SOUND WHOSE VOLUME SHOULD BE USED AS THE REFERENCE POINT FOR ALL OTHERS)
			aud_vol *= 1; // (MUST BE ONE)
		if (_thm == THM.MADOT)
			aud_vol *= 0.4;
	}
	if (aud == global.thm_snd_optSlct[_thm])
	{
		if (_thm == THM.DFLT)
			aud_vol *= 1.35;
		if (_thm == THM.MADOT)
			aud_vol *= 0.2;
	}
	if (aud == global.thm_snd_optCncl[_thm])
	{
		if (_thm == THM.DFLT)
			aud_vol *= 0.9;
		if (_thm == THM.MADOT)
			aud_vol *= 0.2;
	}
	if (aud == global.thm_snd_optFail[_thm])
	{
		if (_thm == THM.MADOT)
			aud_vol *= 0.4;
	}
	
	
	if (aud == snd_wrld_chara_foot) // (player footsteps)
		aud_vol *= 0.75;
	
	
	if (aud == mus_wrld_macaco) // (Macacolandia's music)
		aud_vol *= 0.25;
	if (aud == snd_wrld_npc_macaco_citizen_0) // (Macacolandia citizens sounds)
	{
		aud_vol *= 0.5;
		aud_ofs = 0.25;
	}
	if (aud == snd_wrld_npc_macaco_citizen_1)
		aud_ofs = 0.25;
	if (aud == snd_wrld_npc_macaco_citizen_2)
		aud_vol *= 0.3;
	if (aud == snd_wrld_npc_macaco_citizen_3)
	{
		aud_vol *= 0.85;
		aud_ofs = 0.25;
	}
	if (aud == snd_wrld_npc_macaco_citizen_4)
		aud_vol *= 0.65;
	if (aud == snd_wrld_npc_macaco_citizen_5)
		aud_vol *= 0.5;
	if (aud == snd_wrld_npc_macaco_citizen_6)
	{
		aud_vol *= 0.35;
		aud_ofs = 0.25;
	}
	
	
	if (aud == mus_wrld_pikini)
		aud_vol *= 0.75;
	
	
	return aud_vol;
}

function fn_aud_stop(_aud_id)
{
	audio_stop_sound(_aud_id);
}

function fn_aud_playing(_aud_id) // (returns if audio is playing)
{
	return audio_is_playing(_aud_id);
}




function fn_draw_txt(_txt, _x, _y, _xSc, _ySc, _ang, _col_0, _col_1, _alp, _vAl, _hAl) // draws a text with the provided characteristics
{
	_xSc = (_xSc / 1);
	_ySc = (_ySc / 1);
	
	var _fnt = global.game_fnt;
	draw_set_font(_fnt);
	draw_set_valign(_vAl);
	draw_set_halign(_hAl);
	
	if (global.thm_shdw_act[global.thm_cur] == true)
	{
		var _col_shdw = global.thm_col[global.thm_cur, 4];
		draw_text_ext_transformed_color((_x + 1), (_y + 1), _txt, -1, 640, _xSc, _ySc, _ang, _col_shdw, _col_shdw, _col_shdw, _col_shdw, _alp);
	}
	
	draw_text_ext_transformed_color(_x, _y, _txt, -1, 640, _xSc, _ySc, _ang, _col_0, _col_0, _col_1, _col_1, _alp);
}

function fn_draw_px(_x, _y, _w, _h, _col_0, _col_1, _col_2, _col_3, _alp) // draws a stretched pixel, forming a rectangle, with the provided characteristics (performance is faster with "draw_sprite" than "draw_rectangle")
{
	draw_sprite_general(spr_px, 0, 0, 0, 1, 1, _x, _y, _w, _h, 0, _col_0, _col_1, _col_2, _col_3, _alp);
}

function fn_draw_spr(_spr, _img, _x, _y, _xSc, _ySc, _ang, _col, _alp, _shdw_act) // draws the specified sprite with the provided characteristics
{
	if (_spr != -1)
	{
		if (_shdw_act == true && global.thm_shdw_act[global.thm_cur] == true)
			/* shdw (shadow) */ draw_sprite_ext(_spr, _img, (_x + 1), (_y + 1), _xSc, _ySc, _ang, global.thm_col[global.thm_cur, 4], _alp);
		
		/* spr */ draw_sprite_ext(_spr, _img, _x, _y, _xSc, _ySc, _ang, _col, _alp);
	}
	else
		fn_dbg_log("fn_draw_spr() called without a sprite to draw");
}

function fn_draw_spr_stretch(_spr, _img, _x, _y, _w, _h, _col, _alp)
{
	if (_spr != -1)
		draw_sprite_stretched_ext(_spr, _img, _x, _y, _w, _h, _col, _alp);
	else
		fn_dbg_log("fn_draw_spr_stretch() called without a sprite to draw");
}

function fn_draw_spr_part(_spr, _img, _lt, _tp, _w, _h, _x, _y, _xSc, _ySc, _col, _alp)
{
	if (_spr != -1)
		draw_sprite_part_ext(_spr, _img, _lt, _tp, _w, _h, _x, _y, _xSc, _ySc, _col, _alp);
	else
		fn_dbg_log("fn_draw_spr_part() called without a sprite to draw");
}

function fn_draw_line(_x1, _y1, _x2, _y2, _col, _alp, _thickness)
{
	draw_set_color(_col);
	draw_set_alpha(_alp);
	draw_line_width(_x1, _y1, _x2, _y2, _thickness);
}

function fn_draw_self(_x, _y, _xSc, _ySc, _ang) // draws the object's own sprite
{
	fn_draw_spr(sprite_index, image_index, _x, _y, _xSc, _ySc, _ang, image_blend, image_alpha);
}




function fn_lerp(_valCur, _valTgt, _spd)
{
	var _val = lerp(_valCur, _valTgt, _spd);
	if (global.sett_rdcdMot == true) // rdcdMot (reduced motion)  →  skips animation and sets current value to target one
		_val = _valTgt;
	
	return _val;
}

function fn_lerp_col(_currCol, _tgtCol, _spd)
{
	var _currCol_hue = color_get_hue(_currCol);
	var _currCol_sat = color_get_saturation(_currCol);
	var _currCol_vAl = color_get_value(_currCol);
	
	var _tgtCol_hue = color_get_hue(_tgtCol);
	var _tgtCol_sat = color_get_saturation(_tgtCol);
	var _tgtCol_vAl = color_get_value(_tgtCol);
	
	var _col_hue = fn_lerp(_currCol_hue, _tgtCol_hue, _spd);
	var _col_sat = fn_lerp(_currCol_sat, _tgtCol_sat, _spd);
	var _col_vAl = fn_lerp(_currCol_vAl, _tgtCol_vAl, _spd);
	
	return make_color_hsv(_col_hue, _col_sat, _col_vAl);
}




function fn_spr_w(_spr) // returns the width of the specified spr
{
	if (_spr != -1)
		return sprite_get_width(_spr);
	else
	{
		fn_dbg_log("fn_spr_w() called without a sprite");
		return 0;
	}
}

function fn_spr_h(_spr) // returns the height of the specified spr
{
	if (_spr != -1)
		return sprite_get_height(_spr);
	else
	{
		fn_dbg_log("fn_spr_h() called without a sprite");
		return 0;
	}
}

function fn_txt_w(_txt) // returns the width of the specified txt
{
	draw_set_font(global.game_fnt);
	return string_width(_txt);
}

function fn_txt_h(_txt) // returns the height of the specified txt
{
	draw_set_font(global.game_fnt);
	var _txt_h = string_height(_txt);
	if (_txt_h % 2 == 1)
		_txt_h += 1;
	return _txt_h;
}



function fn_dbg_log(_msg) // sends a message to the debug log
{
	show_debug_message("[" + string(current_time) + "]  [" + string(object_get_name(object_index)) + "]  " + string(argument0));
}
