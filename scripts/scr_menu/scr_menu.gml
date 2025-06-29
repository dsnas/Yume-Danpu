
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
	global.menu_idTemp = "";
	
	
	// Room-specific menus
	if (menu_id == "")
	{
		// Main menu
		if (room == temp_rm_menu_home)
		{
			menu_id = "home";
			global.menu_home_obj = id;
		}
	}
}
function fn_menu_evCreate() // Create Event determined by the menu's ID
{
	// Main menu
	if (menu_id == "home")
		fn_menu_home_evCreate();
	
	// Settings menu
	if (menu_id == "config")
		fn_menu_config_evCreate();
	
	// Pause menu
	if (menu_id == "pse")
		fn_menu_pse_evCreate();
}
function fn_menu_evStep_0() // Step Event (outside the inactive level transition check) determined by the menu's ID
{
	// Settings menu
	if (menu_id == "config")
		fn_menu_config_evStep_0();
}
function fn_menu_evStep_1() // Step Event (inside the inactive level transition check) determined by the menu's ID
{
	// Main menu
	if (menu_id == "home")
		fn_menu_home_evStep_1();
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
	lvlTrans_tgt = _tgt; // Index of the level the transition sequence will take the menu to
	
	lvlTrans_preDelay = _preDelay; // Duration of the delay in frames before the transition sequence starts
	lvlTrans_postDelay = _postDelay; // Duration of the delay in frames after the transition sequence has started
	
	lvlTrans_selfDstr = _selfDstr; // Determines if the menu object should be destroyed when the transition sequence ends
	lvlTrans_gameEnd = _gameEnd; // Determines if the game should end when the transition sequence ends
	
	lvlTrans_spd = 0.25; // Speed of the transition sequence
	
	opt_move_act[lvl] = false;
	opt_slct_act[lvl] = false;
	opt_cncl_act[lvl] = false;
}


// Functions related to the rectangles
function fn_menu_rect_add(_lvl, _rect, _rect_x = 0, _rect_y = 0, _rect_w = 0, _rect_h = 0, _rect_col = c_black, _rect_alp = 1)
{
	var l = _lvl;
	var r = _rect;
	
	rect_x[l, r] = _rect_x;
	rect_y[l, r] = _rect_y;
	rect_w[l, r] = _rect_w;
	rect_h[l, r] = _rect_h;
	
	rect_col[l, r] = _rect_col;
	rect_alp[l, r] = _rect_alp;
	
	if (rect_w[l, r] > 0 && rect_h[l, r] > 0)
		rect_amt[l] += 1;
}
function fn_menu_rect_addOther(_lvl, _rect, _rect_col = c_black, _rect_alp = 1)
{
	var l = _lvl;
	var r = _rect;
	
	fn_menu_rect_add(l, r, rect_x[l, r], rect_y[l, r], rect_w[l, r], rect_h[l, r], _rect_col, _rect_alp);
}


// Functions related to the boxes
function fn_menu_box_add(_lvl, _box, _box_x = 0, _box_y = 0, _box_w = 0, _box_h = 0, _box_alp = 1)
{
	var l = _lvl;
	var b = _box;
	
	box_spr = global.thm_box_spr[global.thm_cur]; // Asset of the box's sprite
	box_x[l, b] = _box_x;
	box_y[l, b] = _box_y;
	box_w[l, b] = _box_w;
	box_h[l, b] = _box_h;
	box_alp[l, b] = _box_alp;
	
	if (box_w[l, b] > 0 && box_h[l, b] > 0)
		box_amt[l] += 1;
}
function fn_menu_box_addOther(_lvl, _box, _box_alp = 1)
{
	var l = _lvl;
	var b = _box;
	
	fn_menu_box_add(l, b, box_x[l, b], box_y[l, b], box_w[l, b], box_h[l, b], _box_alp);
}


// Functions related to the options
function fn_menu_opt_add(_lvl, _opt, _opt_text = "%%%", _opt_x = 0, _opt_y = 0, _opt_colTgt_0_0 = global.thm_col[global.thm_cur].grayLight, _opt_colTgt_1_0 = global.thm_col[global.thm_cur].grayDark, _opt_colTgt_0_1 = global.thm_col[global.thm_cur].whiteLight, _opt_colTgt_1_1 = global.thm_col[global.thm_cur].whiteDark, _opt_alp = 1, _opt_vAl = fa_top, _opt_hAl = fa_left)
{
	var l = _lvl;
	var o = _opt;
	
	
	// Option
	opt_text[l, o] = _opt_text;
	opt_x[l, o] = _opt_x;
	opt_y[l, o] = _opt_y;
	fn_menu_opt_getSize(l, o);
	
	opt_colTgt[l][o][0][0] = _opt_colTgt_0_0;
	opt_colTgt[l][o][1][0] = _opt_colTgt_1_0;
	opt_colTgt[l][o][0][1] = _opt_colTgt_0_1;
	opt_colTgt[l][o][1][1] = _opt_colTgt_1_1;
	opt_col[l][o][0] = opt_colTgt[l][o][0][0];
	opt_col[l][o][1] = opt_colTgt[l][o][1][0];
	opt_colSpd = 1; // Speed of the option's selection animation (1 == instantaneous)
	
	opt_alp[l, o] = _opt_alp;
	opt_vAl[l, o] = _opt_vAl;
	opt_hAl[l, o] = _opt_hAl;
	
	
	// Option movement
		// ID number of each type
	OPT_MOVE_TYPE_dfltVer = 0; // Vertical default type
	OPT_MOVE_TYPE_dfltHor = 1; // Horizontal default type
	OPT_MOVE_TYPE_invList = 2; // Inventory's effects, items and themes list type
	opt_move_type[l] = OPT_MOVE_TYPE_dfltVer; // ID number of the current type
	opt_move_act[l] = true; // Determines if the player can move through the options
	opt_move_pos[l] = 0; // Index of the player's current position in the array of options
	opt_move_snd[l] = global.thm_opt_move_snd[global.thm_cur]; // Asset of the option movement sound
	
	// Option selection
	opt_slct_act[l] = true; // Determines if the player can select any options
	opt_slct_sndDflt[l] = global.thm_opt_slct_snd[global.thm_cur]; // Asset of the option selection sound
	
	// Option cancellation
	opt_cncl_act[l] = true; // Determines if the player can cancel the last option selection
	opt_cncl_key[l, 0] = CONFIG_KEY.CNCL; // Key to check for input
	opt_cncl_sndDflt[l] = global.thm_opt_cncl_snd[global.thm_cur]; // Asset of the option cancellation sound
	
	
	if (opt_text[l, o] != "%%%")
		opt_amt[l] += 1;
}
function fn_menu_opt_add_ext(_lvl, _info_textDataKeyWithoutIdx) // Adds as options the several texts fetched from their text data value (Their positions will keep undefined)
{
	var l = _lvl;
	
	for (var o = 0; o < 25; o++)
	{	
		var _opt_textKey = (string(_info_textDataKeyWithoutIdx) + string(o));
		var _opt_text = fn_getText(_opt_textKey);
		
		if (_opt_text != undefined)
		{
			fn_menu_opt_add(l, o, _opt_text);
			continue;
		}
		else
			break;
	}
}
function fn_menu_opt_getSize(_lvl, _opt) // Retrieves the width and height of the specified option
{
	var l = _lvl;
	var o = _opt;
	
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
}
function fn_menu_opt_slct() // Option selection sequence determined by the menu's ID					(!!! Also must be updated when a new menu is added)
{
	// Main menu
	if (menu_id == "home")
		fn_menu_home_opt_slct();
	
	// Settings menu
	if (menu_id == "config")
		fn_menu_config_opt_slct();
	
	// Pause menu
	if (menu_id == "pse")
		fn_menu_pse_opt_slct();
}
function fn_menu_opt_cncl() // Option cancellation sequence determined by the menu's ID
{
	// Settings menu
	if (menu_id == "config")
		fn_menu_config_opt_cncl();
	
	// Pause menu
	if (menu_id == "pse")
		fn_menu_pse_opt_cncl();
}

	// Functions related to the option selector
function fn_menu_opt_slctr_add(_lvl, _opt)
{
	var l = _lvl;
	var o = _opt;
	
	opt_slctr_act[l, o] = true; // Determines if the selector is active for this option
	opt_slctr_spr = global.thm_opt_slctr_spr[global.thm_cur]; // Asset of option selector's sprite
	
	opt_slctr_xDist[l, o] = global.thm_opt_slctr_xDist[global.thm_cur];
	opt_slctr_yDist[l, o] = global.thm_opt_slctr_yDist[global.thm_cur];
	opt_slctr_xFix[l, o] = 1; // Fixes the font sprite's empty space on the left
	opt_slctr_yFix[l][o][0] = 3; // Fixes acute, grave, and circumflex accent diacritics
	opt_slctr_yFix[l][o][1] = 1; // Fixes descenders
	opt_slctr_x[l, o] = (opt_x[l, o] + opt_slctr_xFix[l, o] - opt_slctr_xDist[l, o]);
	opt_slctr_y[l, o] = (opt_y[l, o] + opt_slctr_yFix[l][o][0] - opt_slctr_yDist[l, o]);
	opt_slctr_w[l, o] = (opt_w[l, o] - opt_slctr_xFix[l, o] + (opt_slctr_xDist[l, o] * 2));
	opt_slctr_h[l, o] = (opt_h[l, o] - opt_slctr_yFix[l][o][0] - opt_slctr_yFix[l][o][1] + (opt_slctr_yDist[l, o] * 2));
	
	opt_slctr_alp[l, o] = 0;
}

	// Functions related to the options' settings
function fn_menu_opt_config_add(_lvl, _opt, _opt_config_x, _opt_config_y, _opt_config_col_0 = global.thm_col[global.thm_cur].grayLight, _opt_config_col_1 = global.thm_col[global.thm_cur].grayDark, _opt_config_alp = 1, _opt_config_vAl = fa_top, _opt_config_hAl = fa_left)
{
	var l = _lvl;
	var o = _opt;
	
	opt_config_text[l, o] = "%%%";
	
	opt_config_x[l, o] = _opt_config_x;
	opt_config_y[l, o] = _opt_config_y;
	
	opt_config_col[l][o][0] = _opt_config_col_0;
	opt_config_col[l][o][1] = _opt_config_col_1;
	opt_config_alp[l, o] = _opt_config_alp;
	
	opt_config_vAl[l, o] = _opt_config_vAl;
	opt_config_hAl[l, o] = _opt_config_hAl;
}

		// Functions related to the selector of the options' settings
function fn_menu_opt_config_slctr_add(_lvl, _opt)
{
	var l = _lvl;
	var o = _opt;
	
	opt_config_slctr_act[l, o] = true;
	opt_config_slctr_text[l][o][0] = "< ";
	opt_config_slctr_text[l][o][1] = " >";
	
	opt_config_slctr_w[l, o] = fn_text_w(opt_config_slctr_text[l][o][0]);
	opt_config_slctr_y[l, o] = opt_config_y[l, o];
	
	opt_config_slctr_col[l][o][0] = global.thm_col[global.thm_cur].whiteLight;
	opt_config_slctr_col[l][o][1] = global.thm_col[global.thm_cur].whiteDark;
	opt_config_slctr_alp[l, o] = 0;
}

	// Functions related to the options' description
function fn_menu_opt_desc_add(_lvl, _opt, _opt_desc_text = "%%%", _opt_desc_x = 0, _opt_desc_y = 0, _opt_desc_col_0 = global.thm_col[global.thm_cur].whiteLight, _opt_desc_col_1 = global.thm_col[global.thm_cur].whiteDark, _opt_desc_alp = 1, _opt_desc_vAl = fa_top, _opt_desc_hAl = fa_left)
{
	var l = _lvl;
	var o = _opt;
	
	opt_desc_text[l, o] = _opt_desc_text;
	
	opt_desc_x[l, o] = _opt_desc_x;
	opt_desc_y[l, o] = _opt_desc_y;
	opt_desc_w[l, o] = fn_text_w(opt_desc_text[l, o]);
	opt_desc_h[l, o] = fn_text_h(opt_desc_text[l, o]);
	
	opt_desc_col[l][o][0] = _opt_desc_col_0;
	opt_desc_col[l][o][1] = _opt_desc_col_1;
	opt_desc_alp[l, o] = _opt_desc_alp;
	
	opt_desc_vAl[l, o] = _opt_desc_vAl;
	opt_desc_hAl[l, o] = _opt_desc_hAl;
}


// Functions related to information
function fn_menu_info_add(_lvl, _info, _info_text = "%%%", _info_x = 0, _info_y = 0, _info_col_0 = global.thm_col[global.thm_cur].whiteLight, _info_col_1 = global.thm_col[global.thm_cur].whiteDark, _info_alp = 1, _info_vAl = fa_top, _info_hAl = fa_left)
{
	var l = _lvl;
	var i = _info;
	
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
	
	if (info_text[l, i] != "%%%")
		info_amt[l] += 1;
}
function fn_menu_info_addText(_lvl, _info, _info_textDataKeyWithoutIdx)	// Adds only the text of the specified information
{
	var l = _lvl;
	var i = _info;
	
	var _info_text = fn_getText(_info_textDataKeyWithoutIdx);
	if (_info_text != undefined)
	{
		fn_menu_info_add(l, i, _info_text);
		fn_menu_info_getSize(l, i);
	}
}
function fn_menu_info_getSize(_lvl, _info)
{
	var l = _lvl;
	var i = _info;
	
	info_w[l, i] = fn_text_w(info_text[l, i]);
	if (i == 0)
		info_wMax[l] = info_w[l, i];
	else if (i >= 1)
		info_wMax[l] = max(info_wMax[l], info_w[l, i])
	
	info_h[l, i] = fn_text_h(info_text[l, i]);
}


// Functions related to titles
function fn_menu_ttl_add(_lvl, _ttl_text = "%%%")
{
	var l = _lvl;
	
	ttl_box_x[l] = -draw_dist;
	ttl_box_y[l] = -draw_dist;
	ttl_box_w[l] = ((abs(ttl_box_x[l]) * 2) + 320);
	ttl_box_h[l] = (abs(ttl_box_y[l]) + (draw_dist * 2));
	
	ttl_text[l] = _ttl_text;
	ttl_x[l] = (ttl_box_x[l] + (ttl_box_w[l] / 2));
	ttl_y[l] = ((ttl_box_h[l] - abs(ttl_box_y[l])) / 4);
	
	ttl_col[l][0] = global.thm_col[global.thm_cur].whiteLight;
	ttl_col[l][1] = global.thm_col[global.thm_cur].whiteDark;
	
	ttl_vAl[l] = fa_top;
	ttl_hAl[l] = fa_center;
}















































/*

function fn_menu_optconfig_add(_lvl, _opt, _optconfig_text, _optconfig_x, _optconfig_y, _optconfig_colTgt_0_0 = global.thm_col[global.thm_cur, 2], _optconfig_colTgt_1_0 = global.thm_col[global.thm_cur, 3], _optconfig_colTgt_0_1 = global.thm_col[global.thm_cur, 0], _optconfig_colTgt_1_1 = global.thm_col[global.thm_cur, 1], _optconfig_alp = 1)
{
	var l = _lvl;
	var o = _opt;
	
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


