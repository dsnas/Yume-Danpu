
//////// Functions related to the core menu system


// Currently this really fucking sucks but I'll fix it eventually


function old_fn_menu_obj_create(_id = "%%%", _info_0 = "%%%", _info_1 = "%%%")
{
	global.menu_idTemp = _id;
	global.menu_infoTemp[0] = _info_0;
	global.menu_infoTemp[1] = _info_1;
	fn_obj_create(obj_menu);
}
function old_fn_menu_obj_find(_menu_id)
{	
	for (var m = 0; m < instance_number(obj_menu); m++)
	{
		var _menu_obj = instance_find(obj_menu, m);
		if (_menu_obj.menu_id == _menu_id)
			return _menu_obj;
	}
	
	return -1;
}


// Functions related to setting up the menu (they must be updated to add a new menu to the game)
function old_fn_menu_getId() // Retrieves the ID of the menu, which determines its behavior and appearance
{
	menu_id = "";
	if (variable_global_exists("menu_idTemp") == true && global.menu_idTemp != "%%%")
		menu_id = global.menu_idTemp;
	global.menu_idTemp = "";
	
	if (variable_global_exists("menu_infoTemp") == true)
	{
		for (var i = 0; i < array_length(global.menu_infoTemp); i++)
			menu_info[i] = global.menu_infoTemp[i];
	}
	
	
	// Room-specific menus
	if (menu_id == "")
	{
		// Main menu
		if (room == temp_rm_menu_home)
			menu_id = "home";
	}
}
function old_fn_menu_evCreate_0() // Create Event (that may run more than once if needed) determined by the menu's ID
{
	// Main menu
	if (menu_id == "home")
		fn_menu_home_evCreate_0();
	
	// Settings menu
	if (menu_id == "config")
		fn_menu_config_evCreate_0();
	
	// Inventory menu
	if (menu_id == "inv")
		fn_menu_inv_evCreate_0();
	
	// Pause menu
	if (menu_id == "pse")
		fn_menu_pse_evCreate_0();
	
	// Unlock menu
	if (menu_id == "unlock")
		fn_menu_unlock_evCreate_0();
}
function old_fn_menu_evCreate_1() // Create Event (that must run only once) determined by the menu's ID
{
	// Main menu
	if (menu_id == "home")
		fn_menu_home_evCreate_1();
	
	// Settings menu
	if (menu_id == "config")
		fn_menu_config_evCreate_1();
	
	// Inventory menu
	if (menu_id == "inv")
		fn_menu_inv_evCreate_1();
	
	// Pause menu
	if (menu_id == "pse")
		fn_menu_pse_evCreate_1();
	
	// Unlock menu
	if (menu_id == "unlock")
		fn_menu_unlock_evCreate_1();
}
function old_fn_menu_evStep() // Step Event determined by the menu's ID
{
	// Main menu
	if (menu_id == "home")
		fn_menu_home_evStep();
	
	// Unlock menu
	if (menu_id == "unlock")
		fn_menu_unlock_evStep();
}
function old_fn_menu_evDrawGUI_0(l) // Draw GUI Event (outside the levels loop) determined by the menu's ID
{
	// Pause menu
	if (menu_id == "pse")
		fn_menu_pse_evDrawGUI_0(l);
}
function old_fn_menu_evDrawGUI_1(l) // Draw GUI Event (inside the levels loop, pre-core menu system's drawings) determined by the menu's ID
{
	
}
function old_fn_menu_evDrawGUI_2(l) // Draw GUI Event (inside the levels loop, post-core menu system's drawings) determined by the menu's ID
{
	// Main menu
	if (menu_id == "home")
		fn_menu_home_evDrawGUI_2(l);
	
	// Inventory menu
	if (menu_id == "inv")
		fn_menu_inv_evDrawGUI_2(l);
	
	// Unlock menu
	if (menu_id == "unlock")
		fn_menu_unlock_evDrawGUI_2(l);
}
function old_fn_menu_evDestroy() // Destroy Event determined by the menu's ID
{
	
}


// Functions related to the transition sequence
function old_fn_menu_lvlNew(_idx = -1, _alpDelay = 0, _selfDstr = false, _gameEnd = false)
{	
	lvlNew = _idx;
	lvlNew_alpDelay = _alpDelay;
	lvlNew_selfDstr = _selfDstr;
	lvlNew_gameEnd = _gameEnd;
}


// Functions related to the rectangles
function old_fn_menu_rect_add(_lvl, _rect, _rect_x = 0, _rect_y = 0, _rect_w = 0, _rect_h = 0, _rect_col = c_black, _rect_alp = 1)
{
	var l = _lvl;
	var r = _rect;
	
	rect_x[l, r] = _rect_x;
	rect_y[l, r] = _rect_y;
	rect_w[l, r] = _rect_w;
	rect_h[l, r] = _rect_h;
	
	rect_col[l, r] = _rect_col;
	rect_alp[l, r] = _rect_alp;
	
	
	if (r == 0)
		rect_len[l] = 0;
	if (rect_w[l, r] > 0 && rect_h[l, r] > 0)
		rect_len[l] += 1;
}


// Functions related to the boxes
function old_fn_menu_box_add(_lvl, _box, _box_x = 0, _box_y = 0, _box_w = 0, _box_h = 0)
{
	var l = _lvl;
	var b = _box;
	
	box_spr = global.player.thm[global.player.thm_curr].box_spr; // Asset of the box's sprite
	box_x[l, b] = _box_x;
	box_y[l, b] = _box_y;
	box_w[l, b] = _box_w;
	box_h[l, b] = _box_h;
	box_alp[l, b] = 1;
	
	
	if (b == 0)
		box_len[l] = 0;
	if (box_w[l, b] > 0 && box_h[l, b] > 0)
		box_len[l] += 1;
}


// Functions related to the options
function old_fn_menu_opt_add(_lvl, _opt, _opt_text = "%%%", _opt_x = 0, _opt_y = 0, _opt_colTgt_0_0 = global.player.thm[global.player.thm_curr].col.grayLight, _opt_colTgt_1_0 = global.player.thm[global.player.thm_curr].col.grayDark, _opt_colTgt_0_1 = global.player.thm[global.player.thm_curr].col.whiteLight, _opt_colTgt_1_1 = global.player.thm[global.player.thm_curr].col.whiteDark, _opt_alp = 1, _opt_vAl = fa_top, _opt_hAl = fa_left)
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
	OPT_MOVE_TYPE_dfltVer = 0; // ID number of the vertical default type
	OPT_MOVE_TYPE_dfltHor = 1; // ID number of the horizontal default type
	OPT_MOVE_TYPE_invOther = 2; // ID number of the inventory's effects, items and themes list type
	opt_move_type[l] = OPT_MOVE_TYPE_dfltVer; // ID number of the current type
	
	opt_move_act[l] = true; // Determines if the player can move through the options
	opt_move_pos[l] = 0; // Index of the player's current position in the array of options
	opt_move_snd[l] = global.player.thm[global.player.thm_curr].opt_move_snd; // Asset of the option movement sound
	
	
	// Option selection
	opt_slct_act[l] = true;
	opt_slct_key[l] = CONFIG_KEY.CONFIRM; // Key to check for input
	opt_slct_snd[l, o] = global.player.thm[global.player.thm_curr].opt_slct_snd; // Asset of the option selection sound
	
	
	// Option cancellation
	opt_cncl_act[l] = true;
	opt_cncl_key[l, 0] = CONFIG_KEY.CANCEL; // Default cancellation key
	opt_cncl_key[l, 1] = -1; // Alt cancellation key
	opt_cncl_snd[l] = global.player.thm[global.player.thm_curr].opt_cncl_snd; // Asset of the option cancellation sound
	
	
	opt_slctr_act[l, o] = false;
	opt_config_text[l, o] = "%%%";
	opt_desc_text[l, o] = "%%%";
	if (o == 0)
		opt_len[l] = 0;
	if (opt_text[l, o] != "%%%")
		opt_len[l] += 1;
}
function old_fn_menu_opt_add_ext(_lvl, _info_textDataKeyWithoutIdx) // Adds as options the several texts fetched from their text data value (Their positions will keep undefined)
{
	var l = _lvl;
	
	for (var o = 0; o < 25; o++)
	{	
		var _opt_textKey = (string(_info_textDataKeyWithoutIdx) + string(o));
		var _opt_text = fn_config_lang_data_getText(_opt_textKey);
		
		if (_opt_text != undefined)
		{
			fn_menu_opt_add(l, o, _opt_text);
			continue;
		}
		else
			break;
	}
}
function old_fn_menu_opt_getSize(_lvl, _opt) // Retrieves the width and height of the specified option
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

function old_fn_menu_opt_slct() // Option selection sequence determined by the menu's ID					(!!! Also must be updated when a new menu is added)
{
	// Main menu
	if (menu_id == "home")
		fn_menu_home_opt_slct();
	
	// Settings menu
	if (menu_id == "config")
		fn_menu_config_opt_slct();
	
	// Inventory menu
	if (menu_id == "inv")
		fn_menu_inv_opt_slct();
	
	// Pause menu
	if (menu_id == "pse")
		fn_menu_pse_opt_slct();
}
function old_fn_menu_opt_cncl() // Option cancellation sequence determined by the menu's ID
{	
	// Settings menu
	if (menu_id == "config")
		fn_menu_config_opt_cncl();
	
	// Inventory menu
	if (menu_id == "inv")
		fn_menu_inv_opt_cncl();
	
	// Pause menu
	if (menu_id == "pse")
		fn_menu_pse_opt_cncl();
}

	// Functions related to the option selector
function old_fn_menu_opt_slctr_add(_lvl, _opt)
{
	var l = _lvl;
	var o = _opt;
	
	opt_slctr_act[l, o] = true; // Determines if the selector is active for this option
	opt_slctr_spr = global.player.thm[global.player.thm_curr].opt_slctr_spr; // Asset of option selector's sprite
	opt_slctr_img = 0;
	
	opt_slctr_xDist[l, o] = global.player.thm[global.player.thm_curr].opt_slctr_xDist;
	opt_slctr_yDist[l, o] = global.player.thm[global.player.thm_curr].opt_slctr_yDist;
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
function old_fn_menu_opt_config_add(_lvl, _opt, _opt_config_text = "%%%", _opt_config_x = 0, _opt_config_y = 0, _opt_config_col_0 = global.player.thm[global.player.thm_curr].col.grayLight, _opt_config_col_1 = global.player.thm[global.player.thm_curr].col.grayDark, _opt_config_alp = 1)
{
	var l = _lvl;
	var o = _opt;
	
	opt_config_text[l, o] = _opt_config_text;
	
	opt_config_x[l, o] = _opt_config_x;
	opt_config_y[l, o] = _opt_config_y;
	fn_menu_opt_config_getSize(l, o);
	
	opt_config_col[l][o][0] = _opt_config_col_0;
	opt_config_col[l][o][1] = _opt_config_col_1;
	opt_config_alp[l, o] = _opt_config_alp;
}
function old_fn_menu_opt_config_getSize(_lvl, _opt)
{
	var l = _lvl;
	var o = _opt;
	
	opt_config_w[l, o] = fn_text_w(opt_config_text[l, o]);
	opt_config_h[l, o] = fn_text_h(opt_config_text[l, o]);
}

function old_fn_menu_opt_config_move() // Movement sequence of the options' settings								(!!! Must be updated to add a setting to an option)
{
	// Settings menu
	if (menu_id == "config")
		fn_menu_config_opt_config_move();
}
function old_fn_menu_opt_config_update() // Updates the options' settings											(!!! Must be updated to add a setting to an option)
{
	// Settings menu
	if (menu_id == "config")
		fn_menu_config_opt_config_update();
}

		// Functions related to the selector of the options' settings
function old_fn_menu_opt_config_slctr_add(_lvl, _opt)
{
	var l = _lvl;
	var o = _opt;
	
	opt_config_slctr_act[l, o] = true;
	opt_config_slctr_text[l][o][0] = "< ";
	opt_config_slctr_text[l][o][1] = " >";
	
	opt_config_slctr_w[l, o] = fn_text_w(opt_config_slctr_text[l][o][0]);
	opt_config_slctr_y[l, o] = opt_config_y[l, o];
	
	opt_config_slctr_col[l][o][0] = global.player.thm[global.player.thm_curr].col.whiteLight;
	opt_config_slctr_col[l][o][1] = global.player.thm[global.player.thm_curr].col.whiteDark;
	opt_config_slctr_alp[l, o] = 0;
	
	opt_config_slctr_shk_spd[l, o] = 1;
	opt_config_slctr_shk_dist[l, o] = 0;
	opt_config_slctr_shk_distMax[l, o] = 3;
	opt_config_slctr_shkDelay_durMax[l, o] = 10;
	opt_config_slctr_shkDelay_dur[l, o] = opt_config_slctr_shkDelay_durMax[l, o];
}

	// Functions related to the options' description
function old_fn_menu_opt_desc_add(_lvl, _opt, _opt_desc_text = "%%%", _opt_desc_x = 0, _opt_desc_y = 0, _opt_desc_col_0 = global.player.thm[global.player.thm_curr].col.whiteLight, _opt_desc_col_1 = global.player.thm[global.player.thm_curr].col.whiteDark, _opt_desc_alp = 1, _opt_desc_vAl = fa_top, _opt_desc_hAl = fa_left)
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
function old_fn_menu_info_add(_lvl, _info, _info_text = "%%%", _info_x = 0, _info_y = 0, _info_col_0 = global.player.thm[global.player.thm_curr].col.whiteLight, _info_col_1 = global.player.thm[global.player.thm_curr].col.whiteDark, _info_alp = 1, _info_vAl = fa_top, _info_hAl = fa_left)
{
	var l = _lvl;
	var i = _info;
	
	info_text[l, i] = _info_text;
	
	info_x[l, i] = _info_x;
	info_y[l, i] = _info_y;
	fn_menu_info_getSize(l, i);
	
	info_col[l][i][0] = _info_col_0;
	info_col[l][i][1] = _info_col_1;
	info_alp[l, i] = _info_alp;
	
	info_vAl[l, i] = _info_vAl;
	info_hAl[l, i] = _info_hAl;
	
	
	if (i == 0)
		info_len[l] = 0;
	if (info_text[l, i] != "%%%")
		info_len[l] += 1;
}
function old_fn_menu_info_add_ext(_lvl, _info, _info_textDataKeyWithoutIdx)	// Adds only the text of the specified information
{
	var l = _lvl;
	var i = _info;
	
	var _info_text = fn_config_lang_data_getText(_info_textDataKeyWithoutIdx);
	if (_info_text != undefined)
	{
		fn_menu_info_add(l, i, _info_text);
		fn_menu_info_getSize(l, i);
	}
}
function old_fn_menu_info_getSize(_lvl, _info)
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
function old_fn_menu_ttl_add(_lvl, _ttl_text = "%%%")
{
	var l = _lvl;
	
	ttl_box_x[l] = -draw_dist;
	ttl_box_y[l] = -draw_dist;
	ttl_box_w[l] = ((abs(ttl_box_x[l]) * 2) + 320);
	ttl_box_h[l] = (abs(ttl_box_y[l]) + (draw_dist * 2));
	
	ttl_text[l] = _ttl_text;
	ttl_x[l] = (ttl_box_x[l] + (ttl_box_w[l] / 2));
	ttl_y[l] = ((ttl_box_h[l] - abs(ttl_box_y[l])) / 4);
	
	ttl_col[l][0] = global.player.thm[global.player.thm_curr].col.whiteLight;
	ttl_col[l][1] = global.player.thm[global.player.thm_curr].col.whiteDark;
	
	ttl_vAl[l] = fa_top;
	ttl_hAl[l] = fa_center;
}










/*
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
*/



/*

function fn_menu_optconfig_add(_lvl, _opt, _optconfig_text, _optconfig_x, _optconfig_y, _optconfig_colTgt_0_0 = global.thm_col[global.thm, 2], _optconfig_colTgt_1_0 = global.thm_col[global.thm, 3], _optconfig_colTgt_0_1 = global.thm_col[global.thm, 0], _optconfig_colTgt_1_1 = global.thm_col[global.thm, 1], _optconfig_alp = 1)
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
	
	var _lbl_text = fn_config_lang_data_getText(_lbl_textdata_key);
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
	
	var _ttl_text = fn_config_lang_data_getText(_ttl_textdata_key);
	if (_ttl_text != undefined)
		ttl_text[l] = _ttl_text
}

function fn_menu_ttlWnd_hDiff(_lvl_id)
{
	var l = _lvl_id;
	
	return (ttlWnd_h[l] - abs(ttlWnd_y[l]));
}




*/


