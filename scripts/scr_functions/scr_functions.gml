
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

