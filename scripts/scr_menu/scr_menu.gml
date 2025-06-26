
//////// Functions related to the core menu system


function fn_menu_create(_id)
{
	global.menu_idTemp = _id;
	fn_obj_create(obj_menu);
}


// Functions related to setting up the menu (they must be updated to add a new menu to the game)
function fn_menu_getId() // Retrieves the ID of the menu, which determines its behavior and appearance
{
	menu_id = "";
	if (variable_global_exists("menu_idTemp") == false)
		global.menu_idTemp = "";
	else
		menu_id = global.menu_idTemp;
	global.menu_home_obj = -1;
	global.menu_pse_obj = -1;
	
	
	// Main menu
	if (room == temp_rm_menu_home)
	{
		menu_id = "home";
		global.menu_home_obj = id;
	}
	
	// Pause menu
	if (menu_id == "pse")
		global.menu_pse_obj = id;
}
function fn_menu_evCreate() // Create Event determined by the menu's ID
{
	// Main menu
	if (menu_id == "home")
		fn_menu_home_evCreate();
	
	// Pause menu
	if (menu_id == "pse")
		fn_menu_pse_evCreate();
}
function fn_menu_evStep() // Step Event determined by the menu's ID
{
	// Main menu
	if (menu_id == "home")
		fn_menu_home_evStep();
}
function fn_menu_evDrawGUI_0(l) // Draw GUI Event (pre-core menu system's drawings) determined by the menu's ID
{
	// Pause menu
	if (menu_id == "pse")
		fn_menu_pse_DrawGUI_0(l);
}
function fn_menu_evDrawGUI_1(l) // Draw GUI Event (post-core menu system's drawings) determined by the menu's ID
{
	// Main menu
	if (menu_id == "home")
		fn_menu_home_evDrawGUI_1(l);
}


// Functions related to the transition sequence
function fn_menu_lvlTrans_start(_tgt, _preDelay = 0, _postDelay = 0, _selfDstr = false, _gameEnd = false) // Starts the transition sequence to the specified level
{	
	lvlTrans_stg = 0; // ID of the current stage of the transition sequence (-1 == inactive, 0+ == active)
	lvlTrans_tgt = _tgt; // ID of the level the transition sequence will take the menu to
	
	lvlTrans_preDelay = _preDelay; // Duration of the delay in frames before the transition sequence starts
	lvlTrans_postDelay = _postDelay; // Duration of the delay in frames after the transition sequence has started
	
	lvlTrans_selfDstr = _selfDstr; // Determines if the menu object should be destroyed when the transition sequence ends
	lvlTrans_gameEnd = _gameEnd; // Determines if the game should end when the transition sequence ends
	
	lvlTrans_spd = 0.25; // Speed of the transition sequence
	
	opt_move_act[lvl] = false;
	opt_slct_act[lvl] = false;
	opt_cncl_act[lvl] = false;
}


// Functions related to rectangles
function fn_menu_rect_add(_lvl_idx, _rect_idx, _rect_x, _rect_y, _rect_w, _rect_h, _rect_col = c_black, _rect_alp = 1)
{
	var l = _lvl_idx;
	var r = _rect_idx;
	
	rect_x[l, r] = _rect_x;
	rect_y[l, r] = _rect_y;
	rect_w[l, r] = _rect_w;
	rect_h[l, r] = _rect_h;
	
	rect_col[l, r] = _rect_col;
	rect_alp[l, r] = _rect_alp;
}


// Functions related to the boxes
function fn_menu_box_add(_lvl_idx, _box_idx, _box_x, _box_y, _box_w, _box_h, _box_alp = 1)
{
	var l = _lvl_idx;
	var b = _box_idx;
	
	box_x[l, b] = _box_x;
	box_y[l, b] = _box_y;
	box_w[l, b] = _box_w;
	box_h[l, b] = _box_h;
	
	box_alp[l, b] = _box_alp;
}


// Functions related to the options
function fn_menu_opt_add(_lvl_idx, _opt_idx, _opt_text, _opt_x, _opt_y, _opt_colTgt_0_0 = global.thm_col[global.thm_cur].grayLight, _opt_colTgt_1_0 = global.thm_col[global.thm_cur].grayDark, _opt_colTgt_0_1 = global.thm_col[global.thm_cur].whiteLight, _opt_colTgt_1_1 = global.thm_col[global.thm_cur].whiteDark, _opt_alp = 1, _opt_vAl = fa_top, _opt_hAl = fa_left)
{
	var l = _lvl_idx;
	var o = _opt_idx;
	
	opt_text[l, o] = _opt_text;
	opt_x[l, o] = _opt_x;
	opt_y[l, o] = _opt_y;
	opt_w[l, o] = fn_text_w(opt_text[l, o]);
	opt_h[l, o] = fn_text_h(opt_text[l, o]);
	
	opt_colTgt[l][o][0][0] = _opt_colTgt_0_0;
	opt_colTgt[l][o][1][0] = _opt_colTgt_1_0;
	opt_colTgt[l][o][0][1] = _opt_colTgt_0_1;
	opt_colTgt[l][o][1][1] = _opt_colTgt_1_1;
	opt_col[l][o][0] = opt_colTgt[l][o][0][0];
	opt_col[l][o][1] = opt_colTgt[l][o][1][0];
	opt_alp[l, o] = _opt_alp;
	
	opt_vAl[l, o] = _opt_vAl;
	opt_hAl[l, o] = _opt_hAl;
}
function fn_menu_opt_addText(_lvl_idx, _info_textData_keyWithoutIdx) // Adds as options the several texts fetched from their text data value (Their positions will keep undefined)
{
	var l = _lvl_idx;
	
	for (var o = 0; o < opt_amtMax[l]; o++)
	{	
		var _opt_textKey = (string(_info_textData_keyWithoutIdx) + string(o));
		var _opt_text = fn_getText(_opt_textKey);
		
		if (_opt_text != undefined)
		{
			opt_amt[l] = (o + 1);
			opt_text[l, o] = _opt_text;
			fn_menu_opt_getSize(l, o);
			
			fn_menu_optSlctr_add(l, o);
			
			continue;
		}
		else
			break;
	}
}
function fn_menu_opt_getSize(_lvl_idx, _opt_idx) // Retrieves the width and height of the specified option
{
	var l = _lvl_idx;
	var o = _opt_idx;
	
	opt_w[l, o] = fn_text_w(opt_text[l, o]);
	if (o == 0)
		opt_wMax[l] = opt_w[l, o];
	else if (o >= 1)
		opt_wMax[l] = max(opt_wMax[l], opt_w[l, o])
	
	opt_h[l, o] = fn_text_h(opt_text[l, o]);
	if (o == 0)
		opt_hMax[l] = opt_h[l, o];
	else if (o >= 1)
		opt_hMax[l] = max(opt_hMax[l], opt_h[l, o])
}

function fn_menu_opt_move() // Option movement sequence determined by its type ID
{
	if (opt_move_act[lvl] == true) // Checks whether the player is allowed to move
	{
		var _opt_move_posOld = opt_move_pos[lvl]; // Saves the old option position to play sound
		
		
		// Checks the type of option movement and moves
		if (opt_move_type[lvl] == OPT_MOVE_TYPE_dfltVer) || (opt_move_type[lvl] == OPT_MOVE_TYPE_dfltHor)	// Vertical and horizontal default
		{
			// Retrieves keys the player should press to move based on the movement type
			var _dflt_inp_0 = press_dn;
			var _dflt_inp_1 = press_up;
			if (opt_move_type[lvl] == OPT_MOVE_TYPE_dfltHor)
			{
				_dflt_inp_0 = press_rt;
				_dflt_inp_1 = press_lt;
			}
			
			// Movement
			opt_move_pos[lvl] += (_dflt_inp_0 - _dflt_inp_1);
			
			// Loops movement
			if (opt_move_pos[lvl] < 0)
				opt_move_pos[lvl] = (opt_amt[lvl] - 1);
			if (opt_move_pos[lvl] >= opt_amt[lvl])
				opt_move_pos[lvl] = 0;
		}
		else if (opt_move_type[lvl] == OPT_MOVE_TYPE_invList)												// Inventory's effects, items and themes list
		{
			// I don't know. I made this while only half-awake. Surprisingly, it WORKS ?
			
			if (press_rt == true) || (press_lt == true)
			{
				if (opt_move_pos[lvl] % 2 == 0)
					opt_move_pos[lvl] += 1;
				else if (opt_move_pos[lvl] % 2 == 1)
					opt_move_pos[lvl] -= 1;
			}
			
			if (press_dn == true)
			{
				if (opt_move_pos[lvl] + 2) <= (opt_amt[lvl] - 1)
					opt_move_pos[lvl] += 2;
				else
					opt_move_pos[lvl] = (0 + (opt_move_pos[lvl] % 2));
			}
			else if (press_up == true)
			{
				if ((opt_move_pos[lvl] - 2) >= 0)
					opt_move_pos[lvl] -= 2;
				else
					opt_move_pos[lvl] = (opt_amt[lvl] - 1 - !(opt_move_pos[lvl] % 2));
			}
		}
		
		
		// Plays sound when the player moves through the options
		if (_opt_move_posOld != opt_move_pos[lvl])
			fn_aud_play(opt_move_snd[lvl], CONFIG_VOLTYPE.MENU);
	}
}
function fn_menu_opt_slct() // Option selection sequence determined by the menu's ID					(!!! Also must be updated when a new menu is added)
{
	// Checks whether the player is allowed to select an option, and for their input
	if (opt_slct_act[lvl] == true && press_slct == true)
	{
		_opt_slct_snd = opt_slct_snd[lvl];
		
		
		// Main menu
		if (menu_id == "home")
			fn_menu_home_opt_slct();
		
		// Pause menu
		if (menu_id == "pse")
			fn_menu_pse_opt_slct();
		
		
		// Plays sound when the player selects an option
		fn_aud_play(_opt_slct_snd, CONFIG_VOLTYPE.MENU);
	}
}
function fn_menu_opt_cncl() // Option cancellation sequence determined by the menu's ID
{
	// Loops through each the level-specific keys the player can press
	for (var k = 0; k < array_length(opt_cncl_key_idx[lvl]); k++)
	{
		// Checks whether the player is allowed to cancel the previous selection of an option, and for their input
		if (opt_cncl_act[lvl] == true && fn_config_key_press(opt_cncl_key_idx[lvl, k]) == true)
		{
			_opt_cncl_snd = -1;
			
			
			// Pause menu
			if (menu_id == "pse")
				fn_menu_pse_opt_cncl();
			
			
			// Plays sound when the player selects an option
			if (_opt_cncl_snd != -1)
				fn_aud_play(_opt_cncl_snd, CONFIG_VOLTYPE.MENU);
		}
	}
}


// Functions related to the option selector
function fn_menu_optSlctr_add(_lvl_idx, _opt_idx)
{
	var l = _lvl_idx;
	var o = _opt_idx;
	
	optSlctr_act[l, o] = true; // Determines if the selector is active for this option
	
	optSlctr_xDist[l, o] = global.thm_optSlctr_xDist[global.thm_cur];
	optSlctr_yDist[l, o] = global.thm_optSlctr_yDist[global.thm_cur];
	optSlctr_xFix[l, o] = 1; // Fixes the font sprite's empty space on the left
	optSlctr_yFix[l][o][0] = 3; // Fixes acute, grave, and circumflex accent diacritics
	optSlctr_yFix[l][o][1] = 1; // Fixes descenders
	
	optSlctr_x[l, o] = (opt_x[l, o] + optSlctr_xFix[l, o] - optSlctr_xDist[l, o]);
	optSlctr_y[l, o] = (opt_y[l, o] + optSlctr_yFix[l][o][0] - optSlctr_yDist[l, o]);
	optSlctr_w[l, o] = (opt_w[l, o] - optSlctr_xFix[l, o] + (optSlctr_xDist[l, o] * 2));
	optSlctr_h[l, o] = (opt_h[l, o] - optSlctr_yFix[l][o][0] - optSlctr_yFix[l][o][1] + (optSlctr_yDist[l, o] * 2));
	
	optSlctr_alp[l, o] = 0;
}


// Functions related to information
function fn_menu_info_add(_lvl_idx, _info_idx, _info_text, _info_x, _info_y, _info_col_0 = global.thm_col[global.thm_cur].whiteLight, _info_col_1 = global.thm_col[global.thm_cur].whiteDark, _info_alp = 1, _info_vAl = fa_top, _info_hAl = fa_left)
{
	var l = _lvl_idx;
	var i = _info_idx;
	
	info_text[l, i] = _info_text;
	
	info_x[l, i] = _info_x;
	info_y[l, i] = _info_y;
	info_w[l, i] = fn_text_w(info_text[l, i]);
	info_h[l, i] = fn_text_h(info_text[l, i]);
	
	info_col[l][i][0] = _info_col_0;
	info_col[l][i][1] = _info_col_1;
	info_alp[l, i] = _info_alp;
	
	info_vAl[l, i] = _info_vAl;
	info_hAl[l, i] = _info_hAl;
}
function fn_menu_info_addText(_lvl_idx, _info_idx, _info_textData_keyWithoutIdx)	// Adds only the text of the specified information
{
	var l = _lvl_idx;
	var i = _info_idx;
	
	var _info_text = fn_getText(_info_textData_keyWithoutIdx);
	if (_info_text != undefined)
	{
		info_text[l, i] = _info_text;
		fn_menu_info_getSize(l, i);
	}
}
function fn_menu_info_getSize(_lvl_idx, _info_idx)
{
	var l = _lvl_idx;
	var i = _info_idx;
	
	info_w[l, i] = fn_text_w(info_text[l, i]);
	if (i == 0)
		info_wMax[l] = info_w[l, i];
	else if (i >= 1)
		info_wMax[l] = max(info_wMax[l], info_w[l, i])
	
	info_h[l, i] = fn_text_h(info_text[l, i]);
}


// Functions related to titles
function fn_menu_ttl_add(_lvl_idx, _ttl_text)
{
	var l = _lvl_idx;
	
	ttl_text[l] = _ttl_text;
	
	ttlBox_x[l] = -draw_dist;
	ttlBox_y[l] = -draw_dist;
	ttlBox_w[l] = ((abs(ttlBox_x[l]) * 2) + 320);
	ttlBox_h[l] = (abs(ttlBox_y[l]) + (draw_dist * 2));
	
	ttl_x[l] = (ttlBox_x[l] + (ttlBox_w[l] / 2));
	ttl_y[l] = ((ttlBox_h[l] - abs(ttlBox_y[l])) / 4);
	ttl_col[l][0] = global.thm_col[global.thm_cur].whiteLight;
	ttl_col[l][1] = global.thm_col[global.thm_cur].whiteDark;
	ttl_vAl[l] = fa_top;
	ttl_hAl[l] = fa_center;
}















































/*

function fn_menu_optconfig_add(_lvl_idx, _opt_idx, _optconfig_text, _optconfig_x, _optconfig_y, _optconfig_colTgt_0_0 = global.thm_col[global.thm_cur, 2], _optconfig_colTgt_1_0 = global.thm_col[global.thm_cur, 3], _optconfig_colTgt_0_1 = global.thm_col[global.thm_cur, 0], _optconfig_colTgt_1_1 = global.thm_col[global.thm_cur, 1], _optconfig_alp = 1)
{
	var l = _lvl_idx;
	var o = _opt_idx;
	
	optconfig_act[l, o] = true;
	
	optconfig_text[l, o] = _optconfig_text;
	optconfig_x[l, o] = _optconfig_x;
	optconfig_y[l, o] = _optconfig_y;
	
	optconfig_colTgt[l][o][0][0] = _optconfig_colTgt_0_0;
	optconfig_colTgt[l][o][1][0] = _optconfig_colTgt_1_0;
	optconfig_colTgt[l][o][0][1] = _optconfig_colTgt_0_1;
	optconfig_colTgt[l][o][1][1] = _optconfig_colTgt_1_1;
	optconfig_alp[l, o] = _optconfig_alp;
}

function fn_menu_lbl_textdata(_lvl_id, _lbl_idx, _lbl_textdata_key)
{
	var l = _lvl_id;
	var i = _lbl_idx;
	
	var _lbl_text = fn_getText(_lbl_textdata_key);
	if (_lbl_text != undefined)
	{
		lbl_text[l, i] = _lbl_text;
		fn_menu_lbl_sizedata(l, i);
	}
}
function fn_menu_lbl_sizedata(_lvl_id, _lbl_idx)
{
	var l = _lvl_id;
	var i = _lbl_idx;
	
	lbl_w[l, i] = fn_text_w(lbl_text[l, i]);
	if (i == 0)
		lbl_wMax[l] = lbl_w[l, i];
	else if (i >= 1)
		lbl_wMax[l] = max(lbl_wMax[l], lbl_w[l, i])
	
	lbl_h[l, i] = fn_text_h(lbl_text[l, i]);
}

function fn_menu_ttl_textdata(_lvl_id, _ttl_textdata_key)
{
	var l = _lvl_id;
	
	var _ttl_text = fn_getText(_ttl_textdata_key);
	if (_ttl_text != undefined)
		ttl_text[l] = _ttl_text
}

function fn_menu_ttlWnd_hDiff(_lvl_id)
{
	var l = _lvl_id;
	
	return (ttlWnd_h[l] - abs(ttlWnd_y[l]));
}




*/



