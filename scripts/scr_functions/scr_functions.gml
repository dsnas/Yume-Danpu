
//////// Functions that are basic for the game to work


// Functions related to objects
function fn_obj_create(_asset = id, _x = 0, _y = 0, _varStruct = {}) // Creates the specified object at the given position
{
	obj_id = instance_create_layer(_x, _y, "Instances", _asset, _varStruct);
	return obj_id;
}
function fn_obj_destroy(_asset = id) // Destroys the specified object
{
	instance_destroy(_asset);
}
function fn_obj_exists(_asset) // Returns whether if the specified object exists
{
	return instance_exists(_asset);
}
function fn_obj_img(_asset = id, _spd = 0, _idx = 0, _col = image_blend, _alp = image_alpha, _xSc = image_xscale, _ySc = image_yscale, _ang = image_angle) // Adjusts the specified object's image
{
	with (_asset)
	{
		image_speed = _spd;
		image_index = _idx;
		image_blend = _col;
		image_alpha = _alp;
		image_xscale = _xSc;
		image_yscale = _ySc;
		image_angle = _ang;
		
		// Disables animation
		if (global.config_rdcdMot == true) // Checks if the configing Reduced Motion is active
		{
			image_speed = 0;
			image_index = 0;
		}
	}
}
function fn_obj_depth(_asset = id, _val = -_asset.bbox_bottom)
{
	with (_asset)
		depth = _val;
}


// Functions related to audio, like sounds and music
function fn_aud_play(_asset, _volType, _vol = 1, _ofs = 0, _pit = 1, _loops = false) // Starts playing the specified audio
{
	var _id = audio_play_sound(_asset, 0, false);
	fn_aud_vol(_asset, _id, _volType, _vol);
	fn_aud_ofs(_asset, _id, _ofs);
	fn_aud_pit(_asset, _id, _pit);
	audio_sound_loop(_id, _loops);
	
	return _id;
}

function fn_aud_vol(_asset, _id, _volType, _vol = 1) // Changes the playing audio's volume to the fixed specified value
{
	_vol = fn_aud_volData(_asset, _vol);
	_vol *= global.config_volType[_volType];
	_vol *= global.config_volType[CONFIG_VOLTYPE.MASTER];
	
	audio_sound_gain(_id, _vol, 0);
}
function fn_aud_volData(_asset, _vol)
{
	// _vol MUST ONLY BE MULTIPLIED, NOT ADDED or SUBTRACTED
	
	
	switch (_asset)
	{
		// Menu sounds
			// Default theme
		case snd_thm_opt_move_0: // The sound that should be used as reference for all others
			_vol = 1;
			break;
		case snd_thm_opt_slct_0:
			_vol *= 1.35;
			break;
		case snd_thm_opt_cncl_0:
			_vol *= 0.9;
			break;
		case snd_thm_unlock_0_0:
		case snd_thm_unlock_1_0:
		case snd_thm_unlock_2_0:
			_vol *= 0.45;
			break;
			// Madotsuki theme
		case snd_thm_opt_move_1:
			_vol *= 0.4;
			break;
		case snd_thm_opt_slct_1:
			_vol *= 0.2;
			break;
		case snd_thm_opt_cncl_1:
			_vol *= 0.2;
			break;
		case snd_thm_opt_fail_1:
			_vol *= 0.4;
			break;
		
		
		// Player sounds
		case snd_player_fstep:
			_vol *= 0.75;
			break;
		
		
		// Item sounds
		case snd_itm_kart_eng:
			_vol *= 0.65;
			break;
		case snd_itm_kart_brk:
			_vol *= 0.5;
			break;
		case snd_itm_kart_hit:
			_vol *= 0.75;
			break;
		
		
		// Interaction
		case snd_hulapoca:
			_vol *= 0.5;
			break;
		case snd_penyplocde:
			_vol *= 0.35;
			break;
		
		
		// Macacolandia citizens
		case snd_entity_macaco_citizen_0:
			_vol *= 0.5;
			break;
		case snd_entity_macaco_citizen_2:
			_vol *= 0.3;
			break;
		case snd_entity_macaco_citizen_3:
			_vol *= 0.85;
			break;
		case snd_entity_macaco_citizen_4:
			_vol *= 0.65;
			break;
		case snd_entity_macaco_citizen_5:
			_vol *= 0.5;
			break;
		case snd_entity_macaco_citizen_6:
			_vol *= 0.35;
			break;
	}
	
	
	return _vol;
	// one of the WORST fucking FUNCTION i've EVER made in my LIFE. Jesus       !!!!!
}

function fn_aud_ofs(_asset, _id, _ofs = 0) // Changes the playing audio's offset to the fixed specified value
{
	_ofs = fn_aud_ofsData(_asset, _ofs);
	
	audio_sound_set_track_position(_id, _ofs);
}
function fn_aud_ofsData(_asset, _ofs)
{
	// _ofs MUST ONLY BE ADDED, NOT SUBTRACTED or MULTIPLIED
	
	
	switch (_asset)
	{
		// Menu sounds
			// Default theme
		case snd_thm_start_0:
			_ofs += 0.15;
			break;
		
		
		// Sounds of Macacolandia citizens
		case snd_entity_macaco_citizen_0:
			_ofs += 0.25;
			break;
		case snd_entity_macaco_citizen_1:
			_ofs += 0.25;
			break;
		case snd_entity_macaco_citizen_3:
			_ofs += 0.25;
			break;
		case snd_entity_macaco_citizen_6:
			_ofs += 0.25;
			break;
	}
	
	
	return _ofs;
	// one of the WORST fucking FUNCTION i've EVER made in my LIFE. Jesus       !!!!!
}

function fn_aud_pit(_asset, _id, _pit = 1)
{
	audio_sound_pitch(_id, _pit);
	
	// _pit MUST ONLY BE ADDED or SUBTRACTED, NOT MULTIPLIED
}

function fn_aud_stop(_id) // Stops playing the specified audio
{
	audio_stop_sound(_id);
}


// Functions related to sprites
function fn_spr_w(_asset) // Returns the width of the specified sprite
{
	if (_asset != -1)
		return sprite_get_width(_asset);
	else
	{
		fn_log("The function fn_spr_w() was called with an invalid sprite asset");
		return 0;
	}
}
function fn_spr_h(_asset) // Returns the height of the specified sprite
{
	if (_asset != -1)
		return sprite_get_height(_asset);
	else
	{
		fn_log("The function fn_spr_h() was called with an invalid sprite asset");
		return 0;
	}
}

// Functions related to text
function fn_text_w(_text) // Returns the width of the specified text)
{
	draw_set_font(global.GAME_FNT);
	return string_width(_text);
}
function fn_text_h(_text) // Returns the height of the specified text
{
	draw_set_font(global.GAME_FNT);
	return string_height(_text);
}




// Functions related to drawing
function fn_draw_text(_text, _x, _y, _col_0, _col_1, _alp = 1, _vAl = fa_top, _hAl = fa_left, _xSc = 1, _ySc = 1, _ang = 0) // Draws the specified text
{
	var _fnt = global.GAME_FNT;
	draw_set_font(_fnt);
	draw_set_valign(_vAl);
	draw_set_halign(_hAl);
	
	// Draws the shadow of the text
	var _shadow_col = global.thm_col[global.thm].shadow;
	var _shadow_alp = (global.thm_alp[global.thm].shadow * _alp);
	draw_text_ext_transformed_color((_x + 1), (_y + 1), _text, -1, 640, _xSc, _ySc, _ang, _shadow_col, _shadow_col, _shadow_col, _shadow_col, _shadow_alp);
	
	// Draws the text
	draw_text_ext_transformed_color(_x, _y, _text, -1, 640, _xSc, _ySc, _ang, _col_0, _col_0, _col_1, _col_1, _alp);
}

function fn_draw_rect(_x, _y, _w, _h, _col_0, _col_1, _col_2, _col_3, _alp) // Draws a rectangle with the specified size
{
	draw_sprite_general(spr_px, 0, 0, 0, 1, 1, _x, _y, _w, _h, 0, _col_0, _col_1, _col_2, _col_3, _alp);
}

function fn_draw_spr(_spr, _img, _x, _y, _col = c_white, _alp = 1, _xSc = 1, _ySc = 1, _ang = 0, _shadow_act = false) // Draws the specified sprite
{
	if (_spr != -1)
	{
		// Draws the shadow of the specified sprite
		if (_shadow_act == true)
		{
			var _shadow_col = global.thm_col[global.thm].shadow;
			var _shadow_alp = (global.thm_alp[global.thm].shadow * _alp);
			draw_sprite_ext(_spr, _img, (_x + 1), (_y + 1), _xSc, _ySc, _ang, _shadow_col, _shadow_alp);
		}
		
		// Draws the specified sprite
		draw_sprite_ext(_spr, _img, _x, _y, _xSc, _ySc, _ang, _col, _alp);
	}
	else
		fn_log("The function fn_draw_spr() was called with an invalid sprite ID");
}
function fn_draw_spr_stretch(_spr, _img, _x, _y, _w, _h, _col = c_white, _alp = 1) // Draws the specified sprite, but STRETCHED
{
	if (_spr != -1)
		draw_sprite_stretched_ext(_spr, _img, _x, _y, _w, _h, _col, _alp);
	else
		fn_log("The function fn_draw_spr_stretch() was called with an invalid sprite ID");
}
function fn_draw_spr_part(_spr, _img, _lt, _top, _w, _h, _x, _y, _col = c_white, _alp = 1, _xSc = 1, _ySc = 1) // Draws only a part of the specified sprite
{
	if (_spr != -1)
		draw_sprite_part_ext(_spr, _img, _lt, _top, _w, _h, _x, _y, _xSc, _ySc, _col, _alp);
	else
		fn_log("The function fn_draw_spr_part() was called with an invalid sprite ID");
}

function fn_draw_line(_x1, _y1, _x2, _y2, _col = c_white, _alp = 1, _thickness = 1) // Draws a line
{
	draw_set_color(_col);
	draw_set_alpha(_alp);
	draw_line_width(_x1, _y1, _x2, _y2, _thickness);
}

function fn_draw_self_setup() // Sets up variables for manual self-drawing
{
	self_imgSpd = 0;
	self_x = x;
	self_y = y;
	self_xSc = image_xscale;
	self_ySc = image_yscale;
	self_ang = image_angle;
	
	self_custom = false;
	self_ignoreRdcdMot = false;
}
function fn_draw_self() // Manually self-draws
{
	// Animates the object
	if (self_imgSpd > 0)
	{
		image_index += self_imgSpd;
		if (global.config_rdcdMot == true && self_ignoreRdcdMot == false)
			image_index = 0;
	}
	
	// Draws the object
	if (self_custom == false)
		fn_draw_spr(sprite_index, image_index, self_x, self_y, image_blend, image_alpha, self_xSc, self_ySc, self_ang, false);
}




// Functions related to the game's window
function fn_wnd_caption(_text)
{
	var _chance = irandom_range(1, 100);
	
	if (_text == "Yume Danpu")
	{
		if (_chance <= 5)
			_text = choose("Danpu Nikki", "Yume Nikki", "Yume Dapnu", "Yume Danpy", "Yume Dangu", "Yume Fanpu", "Dume Yanpu", "Yume Champu", "Yummy Danpu", "Yummy Nicky");
	}
	
	window_set_caption(_text);
}



// Functions related to math
function fn_lerp(_valCur, _valTgt, _spd)
{
	var _val = lerp(_valCur, _valTgt, _spd);
	
	// Checks if the configing Reduced Motion is on to skip lerp()'s animation
	if (global.config_rdcdMot == true)
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




// Other functions
function fn_log(_msg) // Sends a message to the log
{
	show_debug_message($"[{current_time}]  [{object_get_name(object_index)}]  {_msg}");
}

