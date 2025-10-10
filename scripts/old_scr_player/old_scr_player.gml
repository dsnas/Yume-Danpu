
//////// Functions related to the player


function old_fn_player_setup(_fileCurr = -1)
{
	global.player_name = "Eleanor";
	global.player_awake = false;
	
	
	
	
	// Money
	global.player_money[false] = // While sleeping (player_awake == false)
	{
		amt : 0,
		ccy : "₢$ "
	}
	global.player_money[true] = // While awake (player_awake == true)
	{
		amt : irandom_range((15 + irandom_range(1, 4)), (25 + irandom_range(1, 4))),
		ccy : "R$ "
	}
	
	
	
	
	// Effects
	/*
	enum PLAYER_EFF
	{
		DBG_SAL0,
		DBG_SAL1,
		DBG_SAL2
	}


	
	global.player.eff_curr = -1; // Determines which effect is currently active (-1 == none)
	
	
	
	
	// Items
	/*
	enum PLAYER_ITM
	{
		KART
	}
	*/
	fn_player_itm_add(PLAYER_ITM.KART);
	
	global.player.itm_curr = -1; // Determines which item is currently active (-1 == none)
	
	
	
	
	// Themes
	/*
	enum PLAYER_THM
	{
		DFLT,	// Default theme
		SIMPLE, // Simple theme
		MADOT	// Madotsuki theme
	}
	*/
	fn_player_thm_add(PLAYER_THM.DFLT, true, #949299, #949299, #545359, #545359, #100F11, #100F11, 0); // Default theme
	fn_player_thm_add(PLAYER_THM.SIMPLE, true, c_white, c_ltgray, c_gray, c_dkgray, -1, c_black, 0); // Simple theme
	fn_player_thm_add(PLAYER_THM.MADOT, true, #DEB2E7, #9C619C, #7B5184, #420439, #290831, c_black, , 1, 1); // Madotsuki theme
	
	global.player.thm_curr = PLAYER_THM.DFLT; // Determines which theme is currently active (-1 == none)
	
	
	
	
	// Room-specific data
	for (var i = 0; i < 50; i++)
	{
		if (room_exists(i) == true)
		{
			global.player_rm[i] =
			{
				visited : false
			}
			
			continue;
		}
		else
			break;
	}
	
	
	
	
	// Prepare to save/load the player's data
	global.player_fileCurr = _fileCurr;
}


// Effects
function old_fn_player_eff_add(_eff, _unlocked = false)
{
	global.player.eff[_eff] =
	{
		unlocked : _unlocked,
		name : fn_config_lang_data_getText($"eff_name_{_eff}"),
		desc : fn_config_lang_data_getText($"eff_desc_{_eff}")
	}
}
function old_fn_player_eff_unlock(_eff)
{
	if (global.player.eff[_eff].unlocked == false && fn_obj_exists(obj_player) == true && obj_player.move_stg <= -1)
	{
		global.player.eff[_eff].unlocked = true;
		fn_player_file_save(global.player_fileCurr);
		
		fn_menu_obj_create("unlock", 0, global.player.eff[_eff].name);
		obj_player.move_stg = -2;
	}
}


// Items
function old_fn_player_itm_add(_itm, _unlocked = false)
{
	global.player.itm[_itm] =
	{
		unlocked : _unlocked,
		name : fn_config_lang_data_getText($"itm_name_{_itm}"),
		desc : fn_config_lang_data_getText($"itm_desc_{_itm}")
	}
}
function old_fn_player_itm_unlock(_itm)
{
	if (global.player.itm[_itm].unlocked == false && fn_obj_exists(obj_player) == true && obj_player.move.stg <= -1)
	{
		global.player.itm[_itm].unlocked = true;
		fn_player_file_save(global.player_fileCurr);
		
		fn_menu_obj_create("unlock", 1, global.player.itm[_itm].name);
		obj_player.move.stg = -2;
	}
}
function old_fn_player_itm_equip(_itm)
{
	var _equip_sndIdx = 0;
	
	if (_itm != global.player.itm_curr)
		global.player.itm_curr = _itm;
	else
	{
		global.player.itm_curr = -1;
		_equip_sndIdx = 1;
	}
	
	fn_aud_play(global.player.thm[global.player.thm_curr].equip_snd[_equip_sndIdx], CONFIG_AUD_STYLE.MENU);
}


// Themes
function old_fn_player_thm_add(_thm, _unlocked = false, _col_whiteLight, _col_whiteDark, _col_grayLight, _col_grayDark, _col_shadow, _col_blur, _alp_shadow = 1, _alp_blurLight = 0.5, _alp_blurHeavy = 0.75)
{
	global.player.thm[_thm] =
	{
		unlocked : _unlocked,
		name : fn_config_lang_data_getText($"thm_name_{_thm}"),
		desc : fn_config_lang_data_getText($"thm_desc_{_thm}"),
		
		col :
		{
			whiteLight : _col_whiteLight,
			whiteDark : _col_whiteDark,
			grayLight : _col_grayLight,
			grayDark : _col_grayDark,
			
			shadow : _col_shadow, // Color for the shadow of elements (options, information, etc.)
			blur : _col_blur // Color for dimmed background
		},
		
		alp :
		{
			shadow: _alp_shadow, // Shadow alpha for elements (options, information, etc.)
			blurLight : _alp_blurLight, // Alpha for lightly dimmed background
			blurHeavy : _alp_blurHeavy // Alpha for heavily dimmed background
		},
		
		box_spr : fn_player_thm_getAsset(_thm, "spr_player_thm_box_"),
		
		opt_move_snd : fn_player_thm_getAsset(_thm, "snd_player_thm_opt_move_"),
		opt_slct_snd : fn_player_thm_getAsset(_thm, "snd_player_thm_opt_slct_"),
		opt_cncl_snd : fn_player_thm_getAsset(_thm, "snd_player_thm_opt_cncl_"),
		opt_error_snd : fn_player_thm_getAsset(_thm, "snd_player_thm_opt_error_"),
		
		opt_slctr_spr : fn_player_thm_getAsset(_thm, "spr_player_thm_opt_slctr_"),
		opt_slctr_imgSpd : 0.1,
		opt_slctr_xDist : 6,
		opt_slctr_yDist : 4,
		
		inv_picFrm_spr : fn_player_thm_getAsset(_thm, "spr_player_thm_inv_picFrm_"),
		
		start_snd : fn_player_thm_getAsset(_thm, "snd_player_thm_start_"),
		unlock_snd : [fn_player_thm_getAsset(_thm, $"snd_player_thm_unlock_0_"), fn_player_thm_getAsset(_thm, $"snd_player_thm_unlock_1_"), fn_player_thm_getAsset(_thm, "snd_player_thm_unlock_2_")],
		equip_snd : [fn_player_thm_getAsset(_thm, "snd_player_thm_equip_0_"), fn_player_thm_getAsset(_thm, "snd_player_thm_equip_1_")]
	}
}
function old_fn_player_thm_getAsset(_thm, _asset_nameWithoutIdx)
{
	var _asset = asset_get_index($"{_asset_nameWithoutIdx}{_thm}");
	if (_asset == -1)
		_asset = asset_get_index($"{_asset_nameWithoutIdx}0");
	return _asset;
}
function old_fn_player_thm_unlock(_thm)
{
	if (global.player.thm[_thm].unlocked == false && fn_obj_exists(obj_player) == true && obj_player.move_stg <= -1)
	{
		global.player.thm[_thm].unlocked = true;
		fn_player_file_save(global.player_fileCurr);
		
		fn_menu_obj_create("unlock", 2, global.player.thm[_thm].name);
		obj_player.move_stg = -2;
	}
}
function old_fn_player_thm_equip(_thm)
{
	global.player.thm_curr = _thm;
	fn_player_file_save(global.player_fileCurr);
}


// Saving and loading the player's data
function old_fn_player_file_setup(_file)
{
	var f = _file;
	global.player_file[f] =
	{
		name : $"player_{f}.ini",
		msg : "Gosh, I wonder why someone would come here. It wouldn't be to cheat, would it?"
	}
	
	if (file_exists(global.player_file[f].name) == false)
		fn_player_file_save(f);
	else
		fn_player_file_load(f);
}
function old_fn_player_file_save(_file)
{
	var f = _file;
	ini_open(global.player_file[f].name);
	ini_write_real("game", "ver", global.game.ver);
	ini_write_string("game", "msg", global.player_file[f].msg);
	
	
	ini_write_string("main", "name", global.player_name);
	
	// Money
	for (var m = 0; m < 2; m++)
		ini_write_real("money", $"amt_{m}", global.player_money[m].amt);
	
	// Effects
	for (var e = 0; e < array_length(global.player.eff); e++)
		ini_write_real("eff", $"unlocked_{e}", global.player.eff[e].unlocked);
	
	// Items
	for (var i = 0; i < array_length(global.player.itm); i++)
		ini_write_real("itm", $"unlocked_{i}", global.player.itm[i].unlocked);
	
	// Themes
	for (var t = 0; t < array_length(global.player.thm); t++)
		ini_write_real("thm", $"unlocked_{t}", global.player.thm[t].unlocked);
	ini_write_real("thm", "curr", global.player.thm_curr);
	
	
	ini_close();
}
function old_fn_player_file_load(_file)
{
	var f = _file;
	ini_open(global.player_file[f].name);
	if (ini_read_real("game", "ver", 0) == global.game.ver)
	{
		global.player_name = ini_read_string("main", "name", "Salenis");
		
		// Money
		for (var m = 0; m < 2; m++)
			global.player_money[m].amt = ini_read_real("money", $"amt_{m}", 0);
		
		// Effects
		for (var e = 0; e < array_length(global.player.eff); e++)
			global.player.eff[e].unlocked = ini_read_real("eff", $"unlocked_{e}", false);
		
		// Items
		for (var i = 0; i < array_length(global.player.itm); i++)
			global.player.itm[i].unlocked = ini_read_real("itm", $"unlocked_{i}", false);
		
		// Themes
		for (var t = 0; t < array_length(global.player.thm); t++)
			global.player.thm[t].unlocked = ini_read_real("thm", $"unlocked_{t}", false);
		global.player.thm_curr = ini_read_real("thm", "curr", PLAYER_THM.DFLT);
		
		
		ini_close();
	}
	else
	{
		ini_close();
		fn_player_file_erase(f);
		fn_player_file_save(f);
	}
}
function old_fn_player_file_erase(_file)
{
	var f = _file;
	file_delete(global.player_file[f].name);
}
