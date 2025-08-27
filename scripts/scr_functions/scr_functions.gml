
//////// Functions that are basic for the game to work



// Functions related to the window
function fn_wnd_name(_text)
{
	if (_text == global.game.wnd_name)
	{
		if (irandom_range(1, 100) <= 5)
			_text = choose("Danpu Nikki", "Yume Nikki", "Yume Dapnu", "Yume Danpy", "Yume Dangu", "Yume Fanpu", "Dume Yanpu", "Yume Champu", "Yummy Danpu", "Yummy Nicky", "Yum Dnampy", "Yume Dhanpy");
	}
	
	window_set_caption(_text);
}



// Functions related to key inputs
function fn_key_pressed(_key_idx) // Returns if the specified keybind has been pressed
{
	var _key_inp = keyboard_check_pressed(global.config_key[_key_idx].dflt);
	if (_key_inp == false)
		_key_inp = keyboard_check_pressed(global.config_key[_key_idx].alt);
	return _key_inp;
}
function fn_key_held(_key_idx) // Returns if the specified keybind is currently being held
{
	var _key_inp = keyboard_check(global.config_key[_key_idx].dflt);
	if (_key_inp == false)
		_key_inp = keyboard_check(global.config_key[_key_idx].alt);
	return _key_inp;
}
function fn_key_quick() // Provides several variables to make input-checking tasks quicker
{
	press_lt = fn_key_pressed(CONFIG_KEY.LT);
	press_rt = fn_key_pressed(CONFIG_KEY.RT);
	press_up = fn_key_pressed(CONFIG_KEY.UP);
	press_dn = fn_key_pressed(CONFIG_KEY.DN);
	press_slct = fn_key_pressed(CONFIG_KEY.SLCT);
	press_cncl = fn_key_pressed(CONFIG_KEY.CNCL);
	press_inv = fn_key_pressed(CONFIG_KEY.MENU_INV);
	press_pse = fn_key_pressed(CONFIG_KEY.MENU_PSE);
	press_fscr = fn_key_pressed(CONFIG_KEY.FSCR);
	press_atwlk = fn_key_pressed(CONFIG_KEY.ATWLK);
	
	hold_lt = fn_key_held(CONFIG_KEY.LT);
	hold_rt = fn_key_held(CONFIG_KEY.RT);
	hold_up = fn_key_held(CONFIG_KEY.UP);
	hold_dn = fn_key_held(CONFIG_KEY.DN);
}




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
function fn_obj_img(_asset = id, _spd = 0, _idx = 0, _col = c_white, _alp = 1, _xSc = 1, _ySc = 1, _ang = 0) // Adjusts the specified object's image
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
function fn_obj_depth(_asset = id, _val = -_asset.y)
{
	_asset.depth = _val;
}




// Functions related to drawing
	// Text
function fn_draw_text(_text, _x, _y, _col_0, _col_1, _alp = 1, _vAl = fa_top, _hAl = fa_left, _xSc = 1, _ySc = 1, _ang = 0)
{
	var _fnt = global.game.fnt;
	draw_set_font(_fnt);
	draw_set_valign(_vAl);
	draw_set_halign(_hAl);
	
	var _shadow_col = global.player_thm[global.player_thmCurr].col.shadow;
	var _shadow_alp = (global.player_thm[global.player_thmCurr].alp.shadow * _alp);
	draw_text_ext_transformed_color((_x + 1), (_y + 1), _text, -1, 640, _xSc, _ySc, _ang, _shadow_col, _shadow_col, _shadow_col, _shadow_col, _shadow_alp);
	
	draw_text_ext_transformed_color(_x, _y, _text, -1, 640, _xSc, _ySc, _ang, _col_0, _col_0, _col_1, _col_1, _alp);
}

	// Rectangles
function fn_draw_rect(_x, _y, _w, _h, _col_0, _col_1, _col_2, _col_3, _alp)
{
	draw_sprite_general(spr_px, 0, 0, 0, 1, 1, _x, _y, _w, _h, 0, _col_0, _col_1, _col_2, _col_3, _alp);
}

	// Sprites
function fn_draw_spr(_spr, _img, _x, _y, _col = c_white, _alp = 1, _xSc = 1, _ySc = 1, _ang = 0, _shadow_act = false)
{
	if (_spr != -1)
	{
		if (_shadow_act == true)
		{
			var _shadow_col = global.player_thm[global.player_thmCurr].col.shadow;
			var _shadow_alp = (global.player_thm[global.player_thmCurr].alp.shadow * _alp);
			draw_sprite_ext(_spr, _img, (_x + 1), (_y + 1), _xSc, _ySc, _ang, _shadow_col, _shadow_alp);
		}
		draw_sprite_ext(_spr, _img, _x, _y, _xSc, _ySc, _ang, _col, _alp);
	}
	else
		fn_log("The function fn_draw_spr() was called with an invalid sprite ID");
}
function fn_draw_spr_stretch(_spr, _img, _x, _y, _w, _h, _col = c_white, _alp = 1)
{
	if (_spr != -1)
		draw_sprite_stretched_ext(_spr, _img, _x, _y, _w, _h, _col, _alp);
	else
		fn_log("The function fn_draw_spr_stretch() was called with an invalid sprite ID");
}
function fn_draw_spr_part(_spr, _img, _lt, _top, _w, _h, _x, _y, _col = c_white, _alp = 1, _xSc = 1, _ySc = 1)
{
	if (_spr != -1)
		draw_sprite_part_ext(_spr, _img, _lt, _top, _w, _h, _x, _y, _xSc, _ySc, _col, _alp);
	else
		fn_log("The function fn_draw_spr_part() was called with an invalid sprite ID");
}

	// Lines
function fn_draw_line(_x1, _y1, _x2, _y2, _col = c_white, _alp = 1, _thickness = 1)
{
	draw_set_color(_col);
	draw_set_alpha(_alp);
	draw_line_width(_x1, _y1, _x2, _y2, _thickness);
}




// Functions related to audio, like music and sounds
function fn_aud_play(_asset, _style, _vol = 1, _ofs = 0, _pch = 1, _loops = false) // Plays the specified audio
{
	var _id = audio_play_sound(_asset, 0, false);
	fn_aud_vol(_asset, _id, _style, _vol);
	fn_aud_ofs(_asset, _id, _ofs);
	fn_aud_pch(_asset, _id, _pch);
	audio_sound_loop(_id, _loops);
	
	return _id;
}
function fn_aud_stop(_id) // Stops the audio with the specified ID (or asset)
{
	audio_stop_sound(_id);
}

	// Volume
function fn_aud_vol(_asset, _id, _style, _vol = 1)
{
	_vol = fn_aud_volData(_asset, _vol);
	_vol *= global.config_aud_style[_style].vol;
	_vol *= global.config_aud_style[CONFIG_AUD_STYLE.MASTER].vol;
	audio_sound_gain(_id, _vol, 0);
}
function fn_aud_volData(_asset, _vol)
{
	// _vol MUST ONLY BE MULTIPLIED, NOT ADDED or SUBTRACTED
	
	switch (_asset)
	{
		// Player
		case snd_player_fstep:
			_vol *= 0.75;
			break;
		
			// Themes
				// Default theme
		case snd_player_thm_opt_move_0: // The sound that should be used as reference for all others
			_vol = 1;
			break;
		case snd_player_thm_opt_slct_0:
			_vol *= 1.35;
			break;
		case snd_player_thm_opt_cncl_0:
			_vol *= 0.9;
			break;
		case snd_player_thm_unlock_0_0:
		case snd_player_thm_unlock_1_0:
		case snd_player_thm_unlock_2_0:
			_vol *= 0.45;
			break;
		case snd_player_thm_equip_0_0:
		case snd_player_thm_equip_1_0:
			_vol *= 0.65;
			break;
				// Madotsuki theme
		case snd_player_thm_opt_move_2:
			_vol *= 0.4;
			break;
		case snd_player_thm_opt_slct_2:
			_vol *= 0.2;
			break;
		case snd_player_thm_opt_cncl_2:
			_vol *= 0.2;
			break;
		case snd_player_thm_opt_fail_2:
			_vol *= 0.4;
			break;
		
			// Items
		case snd_player_itm_kart:
			_vol *= 0.5;
			break;
		case snd_player_itm_kart_turn:
			_vol *= 0.35;
			break;
		case snd_player_itm_kart_hit:
			_vol *= 0.65;
			break;
		
		
		// Props
		case snd_hulapoca:
			_vol *= 1.25;
			break;
		case snd_penyplocde:
			_vol *= 1.25;
			break;
		case snd_ponkawonka:
			_vol *= 1.25;
			break;
		case snd_prop_noise_weird:
			_vol *= 1.5;
			break;
		
		
		// Main menu
		case mus_menu_home:
			_vol *= 0.45;
			break;
		
		
		// Nexus
		case mus_nexus:
			_vol *= 0.35;
			break;
		
		
		// Macacolandia
		case mus_macaco:
			_vol *= 0.25;
			break;
		case snd_entity_macaco_monkey_0:
			_vol *= 0.5;
			break;
		case snd_entity_macaco_monkey_2:
			_vol *= 0.3;
			break;
		case snd_entity_macaco_monkey_3:
			_vol *= 0.85;
			break;
		case snd_entity_macaco_monkey_4:
			_vol *= 0.65;
			break;
		case snd_entity_macaco_monkey_5:
			_vol *= 0.5;
			break;
		case snd_entity_macaco_monkey_6:
			_vol *= 0.35;
			break;
		
		
		// Debug World
		case mus_dbgwrld:
			_vol *= 0.75;
			break;
	}
	
	return _vol;
	// one of the WORST fucking FUNCTIONS i've EVER made in my LIFE.  Jesus       !!!!!
}

	// Offset
function fn_aud_ofs(_asset, _id, _ofs = 0)
{
	_ofs = fn_aud_ofsData(_asset, _ofs);
	audio_sound_set_track_position(_id, _ofs);
}
function fn_aud_ofsData(_asset, _ofs)
{
	// _ofs MUST ONLY BE ADDED, NOT SUBTRACTED or MULTIPLIED
	
	switch (_asset)
	{
		// Player
			// Themes
				// Default theme
		case snd_player_thm_start_0:
			_ofs += 0.15;
			break;
		
		
		// Macacolandia citizens
		case snd_entity_macaco_monkey_0:
			_ofs += 0.25;
			break;
		case snd_entity_macaco_monkey_1:
			_ofs += 0.25;
			break;
		case snd_entity_macaco_monkey_3:
			_ofs += 0.25;
			break;
		case snd_entity_macaco_monkey_6:
			_ofs += 0.25;
			break;
	}
	
	return _ofs;
	// one of the WORST fucking FUNCTIONS i've EVER made in my LIFE Part II: The Hype Never Dies.  Jesus       !!!!!
}

	// Pitch
function fn_aud_pch(_asset, _id, _pch = 1)
{
	_pch = fn_aud_pchData(_asset, _pch);
	audio_sound_pitch(_id, _pch);
}
function fn_aud_pchData(_asset, _pch)
{
	// _pch MUST ONLY BE ADDED or SUBTRACTED, NOT MULTIPLIED
	
	//switch (_asset)
	//{
		
	//}
	
	return _pch;
	// one of the WORST fucking FUNCTIONS i've EVER made in my LIFE Part III: The Final Chapter.  Jesus       !!!!!
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
function fn_text_w(_text) // Returns the width of the specified text
{
	if (font_exists(global.game.fnt) == true)
		draw_set_font(global.game.fnt);
	return string_width(_text);
}
function fn_text_h(_text) // Returns the height of the specified text
{
	if (font_exists(global.game.fnt) == true)
		draw_set_font(global.game.fnt);
	return string_height(_text);
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




//  MISERABLE.  I AM MISERABLE.  THAT'S WHAT I AM. MISERABLE.  BUT DON'T CALL ME THAT. DON'T CALL ME MISERABLE.  BECAUSE.  THAT WILL MAKE ME.  EVEN MORE.  MISERABLE.
