
//////// Functions related to the room controller


// Functions related to setting up the current room's music, background and looping
function fn_rm_getId() // Fetches the ID of the room, which determines its information, background and music
{
	rm_id = "";
	
	
	// Main menu
	if (room == temp_rm_menu_home)
		rm_id = "menu_home";
	
	// Macacolandia
	if (room == rm_macaco)
		rm_id = "macaco";
	
	// Debug World
	if (room == rm_dbgwrld)
		rm_id = "dbgwrld";
	
	
	rm_name = fn_lang_textData("rm_" + string(rm_id));
}

function fn_rm_evCreate() // Create Event determined by the room's ID
{
	// The room's background and looping should ONLY be added here, the Create Event
	
	
	// Main menu
	if (rm_id == "menu_home")
	{
		
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
		
		fn_rm_loop_act(true, true, );
	}
}
function fn_rm_evStep() // Step Event determined by the room's ID
{
	// The room's music should ONLY be added here, the Step Event
	
	
	// Main menu
	if (rm_id == "menu_home")
	{
		if (global.menu_home_obj != -1 && global.menu_home_obj.lvl != global.menu_home_obj.lvl_amtMax && global.flag[0] == true)
			fn_rm_mus_add(0, mus_menu_home, 0.45);
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
function fn_rm_mus_add(_idx, _aud, _aud_vol = 1, _aud_volDur = 0, _aud_volIdx = VOL_IDX.MUS, _aud_pit = 1)
{
	var i = _idx;
	
	mus_aud[i] = _aud;
	mus_vol[i] = _aud_vol;
	mus_volDur[i] = _aud_volDur;
	mus_volIdx[i] = _aud_volIdx;
	mus_pit[i] = _aud_pit;
	
	mus_aud_id[i] = -1;
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
		sky_loop_xAmtOut = (ceil(obj_player.cam_w / sky_loop_xDist) * 2);
		sky_loop_yAmtOut = (ceil(obj_player.cam_h / sky_loop_yDist) * 2);
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
