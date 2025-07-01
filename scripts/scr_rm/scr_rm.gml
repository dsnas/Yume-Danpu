
//////// Functions related to the room controller


// Functions related to configing up the current room's music, background and looping
function fn_rm_getId() // Retrieves the ID of the room, which determines its information, background and music
{
	rm_id = "";
	rm_name = "";
	
	
	// Main menu
	if (room == temp_rm_menu_home)
		rm_id = "menu_home";
	
	// Nexus
	if (room == rm_nexus)
		rm_id = "nexus";
	
	// Macacolandia
	if (room == rm_macaco)
		rm_id = "macaco";
	
	// Debug World
	if (room == rm_dbgwrld)
		rm_id = "dbgwrld";
	
	
	if (rm_name == "")
		rm_name = fn_getText("rm_" + string(rm_id));
}

function fn_rm_evCreate() // Create Event determined by the room's ID
{
	// The room's background and looping should ONLY be added here, the Create Event
	
	
	// Main menu
	if (rm_id == "menu_home")
	{
		
	}
	
	// Nexus
	if (rm_id == "nexus")
	{
		var _sky_col = make_color_hsv(color_get_hue(#07070E), color_get_saturation(#07070E), 50);
		fn_rm_bg_sky_add(0, temp_spr_rm_bg_sky_nexus, , , , , _sky_col, 0);
		fn_rm_bg_sky_loop_act(0, 16, 16);
		fn_rm_bg_sky_loop_move_act(0, , 2, );
		nexus_skySiner = 0;
		
		fn_rm_loop_act(true, true, true);
	}
	
	// Macacolandia and Debug World
	if (rm_id == "macaco") || (rm_id == "dbgwrld")
	{
		fn_rm_bg_sky_add(0, temp_spr_rm_bg_sky_macaco_0, , , , , , 0.2);
		fn_rm_bg_sky_loop_act(0);
		fn_rm_bg_sky_loop_move_act(0);
		
		fn_rm_bg_sky_add(1, temp_spr_rm_bg_sky_macaco_1, , , , , , 0.35, 0.75, 0.75);
		fn_rm_bg_sky_loop_act(1);
		fn_rm_bg_sky_loop_move_act(1);
		
		fn_rm_loop_act(true, true);
	}
}
function fn_rm_evStep() // Step Event determined by the room's ID
{
	// The room's music should ONLY be added here, the Step Event
	
	
	// Main menu
	if (rm_id == "menu_home")
	{
		var _menu_home_obj = fn_menu_obj_find("home");
		if (_menu_home_obj != -1 && global.config_lang_hasChosen == true && _menu_home_obj.lvl != _menu_home_obj.LVL_LANG)
			fn_rm_mus_add(0, mus_menu_home, 0.45);
	}
	
	// Nexus
	if (rm_id == "nexus")
	{
		nexus_skySiner += 0.1;
		bg_sky_obj[0].sky_alp = (0.4 + ((sin(nexus_skySiner / 6) + 1) / 10));
		
		fn_rm_mus_add(0, mus_nexus, 0.35);
	}
	
	// Macacolandia
	if (rm_id == "macaco")
	{
		fn_rm_mus_add(0, mus_macaco, 0.25);
	}
	
	// Debug World
	if (rm_id = "dbgwrld")
	{
		fn_rm_mus_add(0, mus_dbgwrld, 0.75);
	}
}


// Functions related to the current room's music
function fn_rm_mus_add(_idx, _asset, _vol = 1, _pitch = 1, _volType = CONFIG_VOLTYPE.MUS)
{
	var m = _idx;
	
	mus_asset[m] = _asset;
	mus_vol[m] = _vol;
	mus_pitch[m] = _pitch;
	mus_volType[m] = _volType;
	mus_volType_vol[m] = global.config_volType[mus_volType[m]];
	
	mus_id[m] = -1;
}


// Functions related to the current room's background
function fn_rm_bg_sky_add(_idx, _spr, _img = 0, _imgSpd = 0, _x = 0, _y = 0, _col = c_white, _alp = 0.5, _xSc = 1, _ySc = 1, _ang = 0, _depth = (layer_get_depth("Background") - 1 - _idx))
{
	bg_sky_obj[_idx] = fn_obj_create(obj_rm_bg_sky, , , 
	{
		sky_spr : _spr,
		sky_x : _x,
		sky_y : _y,
		sky_w : (fn_spr_w(_spr) * _xSc),
		sky_h : (fn_spr_h(_spr) * _ySc),
		sky_img : _img,
		sky_imgSpd : _imgSpd,
		sky_col : _col,
		sky_alp : _alp,
		sky_xSc : _xSc,
		sky_ySc : _ySc,
		sky_ang : _ang,
		depth : _depth,
		
		sky_loop_act : false,
		sky_loop_move_xAct : false,
		sky_loop_move_yAct : false
	});
}
function fn_rm_bg_sky_loop_act(_idx, _xDist = 640, _yDist = 480)
{
	with (bg_sky_obj[_idx])
	{
		sky_loop_act = true;
		sky_loop_xDist = _xDist;
		sky_loop_yDist = _yDist;
		sky_loop_xAmtOut = (ceil(320 / sky_loop_xDist) * 2);
		sky_loop_yAmtOut = (ceil(240 / sky_loop_yDist) * 2);
		sky_loop_xAmt =	(sky_loop_xAmtOut + ceil(room_width / sky_loop_xDist) + sky_loop_xAmtOut);
		sky_loop_yAmt =	(sky_loop_yAmtOut + ceil(room_height / sky_loop_yDist) + sky_loop_yAmtOut);
	}
}
function fn_rm_bg_sky_loop_move_act(_idx, _xAct = true, _xDurInSeconds = 90, _yAct = true, _yDurInSeconds = _xDurInSeconds)
{
	with (bg_sky_obj[_idx])
	{
		sky_loop_move_xAct = _xAct;
		sky_loop_move_xDur = (_xDurInSeconds * 60);
		sky_loop_move_xStart = sky_x;
		sky_loop_move_xDist = (sky_loop_xDist * choose(-1, 1));
		sky_loop_move_xTgt = (sky_loop_move_xStart + sky_loop_move_xDist);
		sky_loop_move_xSpd = (sky_loop_move_xDist / sky_loop_move_xDur);
		
		sky_loop_move_yAct = _yAct;
		sky_loop_move_yDur = (_yDurInSeconds * 60);
		sky_loop_move_yStart = sky_y;
		sky_loop_move_yDist = (sky_loop_yDist * choose(-1, 1));
		sky_loop_move_yTgt = (sky_loop_move_yStart + sky_loop_move_yDist);
		sky_loop_move_ySpd = (sky_loop_move_yDist / sky_loop_move_yDur);
	}
}


// Functions related to the infinite looping of the current room
function fn_rm_loop_act(_xAct = false, _yAct = false, _camLock = false)
{
	loop_xAct = _xAct; // Determines whether the room loops infinitely along the horizontal axis
	loop_yAct = _yAct; // Determines whether the room loops infinitely along the vertical axis
	loop_camLock = _camLock; // Determines if the player's camera won't follow them
}
