
//////// Functions related to the room controller


// Functions related to configing up the current room's music, background and looping
function fn_rmCtrl_getId() // Retrieves the ID of the room, which determines the behavior of the 
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

function fn_rmCtrl_evCreate() // Create Event determined by the room's ID
{
	// The room's background and looping should ONLY be added here, the Create Event
	global.player_awake = false;
	
	
	// Main menu
	if (rm_id == "menu_home")
	{
		global.player_awake = true;
	}
	
	// Nexus
	if (rm_id == "nexus")
	{
		fn_rmCtrl_cam_lock_act(true, , true);
		
		var _bg_sky_col = make_color_hsv(color_get_hue(#07070E), color_get_saturation(#07070E), 50);
		fn_rmCtrl_bg_sky_add(0, temp_spr_rmCtrl_bg_sky_nexus, _bg_sky_col, , 1.5, 1.5);
		nexus_siner = 0;
		
		fn_rmCtrl_loop_act(true, true);
	}
	
	// Macacolandia
	if (rm_id == "macaco")
	{
		fn_rmCtrl_bg_sky_add(0, temp_spr_rmCtrl_bg_sky_macaco, , 0.175, 180, 180);
		fn_rmCtrl_bg_clouds_add(1, temp_spr_rmCtrl_bg_clouds_macaco, 0.75, 0.75, 0.35, , , 90, 90);
		
		fn_rmCtrl_loop_act(true, true);
	}
	
	// Debug World
	if (rm_id == "dbgwrld")
	{	
		var _spr_amt = 0;
		for (var s = 0; s < 99; s++)
		{
			if (sprite_exists(s) == true)
				continue;
			else
			{
				_spr_amt = s;
				break;
			}
		}
		
		fn_rmCtrl_bg_sky_add(0, irandom_range(0, (_spr_amt - 1)), , 0.25);
		bg_sky[0].sky_img = (sprite_get_number(bg_sky[0].sky_spr) - 1);
		
		fn_rmCtrl_bg_clouds_add(1, irandom_range(0, (_spr_amt - 1)), , , 0.5, 160, 120);
		bg_clouds[1].clouds_img = (sprite_get_number(bg_clouds[1].clouds_spr) - 1);
		
		
		fn_rmCtrl_loop_act(true, true);
	}
}
function fn_rmCtrl_evStep() // Step Event determined by the room's ID
{
	// The room's music should ONLY be added here, the Step Event
	
	
	// Main menu
	if (rm_id == "menu_home")
	{
		var m = fn_menu_obj_find("home");
		if (m != -1 && global.config_lang_hasChosen == true && m.lvl_alpDelay[m.lvl] <= 0 && m.lvl_alpTgt_gameEnd[m.lvl] == false)
			fn_rmCtrl_mus_add(0, mus_menu_home, 0.45);
	}
	
	// Nexus
	if (rm_id == "nexus")
	{
		nexus_siner += 0.1;
		bg_sky[0].sky_alp = (0.5 + ((sin(nexus_siner / 6) + 1) / 10));
		
		fn_rmCtrl_mus_add(0, mus_nexus, 0.35);
	}
	
	// Macacolandia
	if (rm_id == "macaco")
		fn_rmCtrl_mus_add(0, mus_macaco, 0.25);
	
	// Debug World
	if (rm_id = "dbgwrld")
		fn_rmCtrl_mus_add(0, mus_dbgwrld, 0.75);
}


// Functions related to the room's camera
function fn_rmCtrl_cam_lock_act(_xAct = false, _x = 0, _yAct = false, _y = 0)
{
	cam_lock_xAct = _xAct;
	cam_lock_x = _x;
	
	cam_lock_yAct = _yAct;
	cam_lock_y = _y;
}


// Functions related to the room's music
function fn_rmCtrl_mus_add(_idx, _asset, _vol = 1, _pitch = 1, _volType = CONFIG_VOLTYPE.MUS)
{
	var m = _idx;
	
	mus_asset[m] = _asset;
	mus_vol[m] = _vol;
	mus_pitch[m] = _pitch;
	mus_volType[m] = _volType;
	
	mus_id[m] = -1;
}


// Functions related to the room's background

	// Clouds
function fn_rmCtrl_bg_clouds_add(_idx, _spr, _xSc = 1, _ySc = 1, _alp = 1, _xDist = 640, _yDist = 480, _move_xDurInSec = 60, _move_yDurInSec = _move_xDurInSec, _depth = (layer_get_depth("Background") - 1 - _idx))
{
	bg_clouds[_idx] = fn_obj_create(obj_rmCtrl_bg_clouds);
	with (bg_clouds[_idx])
	{
		depth = _depth;
		
		
		clouds_spr = _spr;
		clouds_imgSpd = 0;
		clouds_img = 0;
		
		clouds_x = 0;
		clouds_y = 0;
		clouds_xSc = _xSc;
		clouds_ySc = _ySc;
		
		clouds_col = c_white;
		clouds_alp = _alp;
		clouds_ang = 0;
		
		
		clouds_loop_xDist = _xDist;
		clouds_loop_xAmt_outRm = (ceil(320 / clouds_loop_xDist) * 2);
		clouds_loop_xAmt = (clouds_loop_xAmt_outRm + ceil(room_width / clouds_loop_xDist) + clouds_loop_xAmt_outRm);
		
		clouds_loop_yDist = _yDist;
		clouds_loop_yAmt_outRm = (ceil(240 / clouds_loop_yDist) * 2);
		clouds_loop_yAmt = (clouds_loop_yAmt_outRm + ceil(room_height / clouds_loop_yDist) + clouds_loop_yAmt_outRm);
		
		
		clouds_move_xStart = clouds_x;
		clouds_move_xDur = (_move_xDurInSec * 60);
		clouds_move_xDist = (clouds_loop_xDist * choose(-1, 1));
		clouds_move_xTgt = (clouds_move_xStart + clouds_move_xDist);
		clouds_move_xSpd = (clouds_move_xDist / clouds_move_xDur);
		
		clouds_move_yStart = clouds_y;
		clouds_move_yDur = (_move_yDurInSec * 60);
		clouds_move_yDist = (clouds_loop_yDist * choose(-1, 1));
		clouds_move_yTgt = (clouds_move_yStart + clouds_move_yDist);
		clouds_move_ySpd = (clouds_move_yDist / clouds_move_yDur);
	}
}

	// Sky
function fn_rmCtrl_bg_sky_add(_idx, _spr, _col = c_white, _alp = 1, _move_xDurInSec = 60, _move_yDurInSec = _move_xDurInSec, _depth = (layer_get_depth("Background") - 1 - _idx))
{
	bg_sky[_idx] = fn_obj_create(obj_rmCtrl_bg_sky);
	with (bg_sky[_idx])
	{
		depth = _depth;
		
		
		sky_sprOrig = _spr;
		sky_spr = sprite_duplicate(_spr);
		sky_9slc = sprite_nineslice_create();
		sky_9slc.enabled = true;
		sky_9slc.tilemode[nineslice_centre] = nineslice_repeat;
		sprite_set_nineslice(sky_spr, sky_9slc);
		sky_imgSpd = 0;
		sky_img = 0;
		
		sky_x = 0;
		sky_y = 0;
		sky_wOrig = fn_spr_w(sky_sprOrig);
		sky_hOrig = fn_spr_h(sky_sprOrig);
		sky_w = (sky_wOrig * ceil(room_width / sky_wOrig));
		sky_h = (sky_hOrig * ceil(room_height / sky_hOrig));
		
		sky_col = _col;
		sky_alp = _alp;
		
		
		sky_loop_xDist = sky_w;
		sky_loop_yDist = sky_h;
		sky_loop_xAmt_outRm = ceil(320 / sky_loop_xDist);
		sky_loop_yAmt_outRm = ceil(240 / sky_loop_yDist);
		sky_loop_xAmt = (sky_loop_xAmt_outRm + ceil(room_width / sky_loop_xDist) + sky_loop_xAmt_outRm);		
		sky_loop_yAmt = (sky_loop_yAmt_outRm + ceil(room_height / sky_loop_yDist) + sky_loop_yAmt_outRm);
		
		
		sky_move_xStart = sky_x;
		sky_move_xDur = (_move_xDurInSec * 60);
		sky_move_xDist = (sky_wOrig * choose(-1, 1));
		sky_move_xTgt = (sky_move_xStart + sky_move_xDist);
		sky_move_xSpd = (sky_move_xDist / sky_move_xDur);
		
		sky_move_yStart = sky_y;
		sky_move_yDur = (_move_yDurInSec * 60);
		sky_move_yDist = (sky_hOrig * choose(-1, 1));
		sky_move_yTgt = (sky_move_yStart + sky_move_yDist);
		sky_move_ySpd = (sky_move_yDist / sky_move_yDur);
	}
}


// Functions related to the infinite looping of the room
function fn_rmCtrl_loop_act(_xAct = false, _yAct = false)
{
	loop_xAct = _xAct; // Determines whether the room loops infinitely along the horizontal axis
	loop_yAct = _yAct; // Determines whether the room loops infinitely along the vertical axis
}
