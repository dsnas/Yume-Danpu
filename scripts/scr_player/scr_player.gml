
//////// Functions related to the player


function fn_player_setup(_file_curr = -1)
{
	// Player's data
	global.player =
	{
		name : "Eleanor",
		awake : true,
		
		// Money
		money :
		[{ // While sleeping
			amt : 0,
			ccy : "₢$ "
		},
			
		{ // While awake
			amt : (choose(20, 30) + (choose(1, 3, 7, 9) * choose(-1, 1))),
			ccy : "R$ "
		}],
		
		// Effects
		eff : [-1],
		eff_amt : 0,
		eff_curr : -1, // Determines which effect is currently active (-1 == none)
		
		// Items
		itm : [-1],
		itm_amt : 0,
		itm_curr : -1, // Determines which item is currently active (-1 == none)
		
		// Themes
		thm : [-1],
		thm_amt : 0,
		thm_curr : 0, // Determines which theme is currently active
		
		// Save files
		file : [-1],
		file_curr : _file_curr, // Determines which save file is currently active
		file_amtMax : 10
	}
	
		// Effects
	enum PLAYER_EFF
	{
		
	}
	
		// Items
	enum PLAYER_ITM
	{
		KART
	}
	fn_player_itm_add(PLAYER_ITM.KART, "kart");
	
		// Themes
	enum PLAYER_THM
	{
		DFLT,	// Default theme
		SIMPLE, // Simple theme
		MADOT	// Madotsuki theme
	}
	fn_player_thm_add(PLAYER_THM.DFLT, "dflt", true, #949299, #949299, #545359, #545359, #100F11, #100F11, 0); // Default theme
	fn_player_thm_add(PLAYER_THM.SIMPLE, "simple", true, c_white, c_ltgray, c_gray, c_dkgray, -1, c_black, 0); // Simple theme
	fn_player_thm_add(PLAYER_THM.MADOT, "madot", true, #DEB2E7, #9C619C, #7B5184, #420439, #290831, c_black, , 1, 1); // Madotsuki theme
	
		// Save files
	for (var f = 0; f < global.player.file_amtMax; f++)
	{
		global.player.file[f] =
		{
			name : $"{global.config.ver}/player_{f}.ini",
			msg : choose("I wonder why someone would come here. It wouldn't be to cheat, would it?", "Got bored of walking?", "Simon says turn all the zeros into ones.", "As long as you're having fun, right?", "At least you'll be playing the game.", "Viva la revolución!", "Just do what you gotta do.", "So many numbers... It's like a number world...")
		}
	}
	if (global.player.file_curr != -1)
	{
		if (file_exists(global.player.file[global.player.file_curr].name) == false)
			fn_player_file_save();
		else
			fn_player_file_load();
	}
}


	// Effects
function fn_player_eff_add(_idx, _code, _unlocked = false)
{
	global.player.eff[_idx] =
	{
		name : textdata($"player_eff_name_{_code}"),
		desc : textdata($"player_eff_desc_{_code}"),
		code : _code,
		unlocked : _unlocked,
		
		icon_spr : spr_menu_inv_optIco,
		icon_img : 0
	}
	global.player.eff_amt += 1;
}


	// Items
function fn_player_itm_add(_idx, _code, _unlocked = false)
{
	global.player.itm[_idx] =
	{
		name : textdata($"player_itm_name_{_code}"),
		desc : textdata($"player_itm_desc_{_code}"),
		code : _code,
		unlocked : _unlocked,
		
		icon_spr : spr_menu_inv_optIco,
		icon_img : 1
	}
	global.player.itm_amt += 1;
}
function fn_player_itm_unlock(_idx)
{
	global.player.itm[_idx].unlocked = true;
	fn_player_file_save();
		
	fn_menu_obj_create("unlock", 1, global.player.itm[_idx].name);
}
function fn_player_itm_equip(_idx)
{
	if (_idx != -1)
	{
		global.player.itm_curr = _idx;
		fn_player_file_save();
	}
}


	// Themes
function fn_player_thm_add(_idx, _code, _unlocked = false, _color_whiteLight, _color_whiteDark, _color_grayLight, _color_grayDark, _color_shadow, _color_blur, _alpha_shadow = 1, _alpha_blurLight = 0.5, _alpha_blurHeavy = 0.75)
{
	global.player.thm[_idx] =
	{
		name : textdata($"player_thm_name_{_code}"),
		desc : textdata($"player_thm_desc_{_code}"),
		code : _code,
		unlocked : _unlocked,
		
		icon_spr : spr_menu_inv_optIco,
		icon_img : 2,
		
		color : // Colors
		{
			whiteLight : _color_whiteLight,
			whiteDark : _color_whiteDark,
			grayLight : _color_grayLight,
			grayDark : _color_grayDark,
			
			shadow : _color_shadow, // Color for the shadow of elements (options, information, etc.)
			blur : _color_blur // Color for dimmed background
		},
		
		alpha : // Alpha
		{
			shadow: _alpha_shadow, // Shadow alpha for elements (options, information, etc.)
			blurLight : _alpha_blurLight, // Alpha for lightly dimmed background
			blurHeavy : _alpha_blurHeavy // Alpha for heavily dimmed background
		},
		
		spr : // Sprites
		{
			panel : fn_player_thm_asset("spr_player_thm_panel_", _code),
			option_select : fn_player_thm_asset("spr_player_thm_option_select_", _code),
			option_button : fn_player_thm_asset("spr_player_thm_option_select_", _code),
			picFrame : fn_player_thm_asset("spr_player_thm_picFrame_", _code),
		},
		
		snd : // Sounds
		{
			start : fn_player_thm_asset("snd_player_thm_start_", _code),
			move : fn_player_thm_asset("snd_player_thm_move_", _code),
			confirm : fn_player_thm_asset("snd_player_thm_confirm_", _code),
			cancel : fn_player_thm_asset("snd_player_thm_cancel_", _code),
			error : fn_player_thm_asset("snd_player_thm_error_", _code),
			unlock : [fn_player_thm_asset($"snd_player_thm_unlock_0_", _code), fn_player_thm_asset($"snd_player_thm_unlock_1_", _code), fn_player_thm_asset("snd_player_thm_unlock_2_", _code)],
			equip : [fn_player_thm_asset("snd_player_thm_equip_0_", _code), fn_player_thm_asset("snd_player_thm_equip_1_", _code)],
		}
	}
	global.player.thm_amt += 1;
}
function fn_player_thm_asset(_asset_name_noCode, _code)
{
	var _asset = asset_get_index($"{_asset_name_noCode}{_code}");
	if (_asset == -1)
		_asset = asset_get_index($"{_asset_name_noCode}{global.player.thm[0].code}");
	return _asset;
}
function fn_player_thm_equip(_idx)
{
	if (_idx != -1)
	{
		global.player.thm_curr = _idx;
		fn_player_file_save();
	}
}


	// Save files
function fn_player_file_save()
{
	var _file = global.player.file[global.player.file_curr];	
	ini_open(_file.name);
	ini_write_string("about", "ver", global.game.ver);
	ini_write_string("about", "msg", _file.msg);
	
	
	ini_write_string("main", "name", global.player.name);
	for (var m = 0; m < 2; m++)
		ini_write_string("money", $"amt_{m}", global.player.money[m].amt);
	for (var e = 0; e < global.player.eff_amt; e++)
		ini_write_string("eff", $"unlocked_{e}", global.player.eff[e].unlocked);
	for (var e = 0; e < global.player.itm_amt; e++)
		ini_write_string("itm", $"unlocked_{e}", global.player.itm[e].unlocked);
	for (var e = 0; e < global.player.thm_amt; e++)
		ini_write_string("thm", $"unlocked_{e}", global.player.thm[e].unlocked);
	ini_write_string("thm", "curr", global.player.thm_curr);
	
	
	ini_close();
}
function fn_player_file_load()
{
	var _idx = global.player.file_curr;
	ini_open(global.player.file[_idx].name);
	
	
	if (ini_read_real("about", "ver", -1) == global.player.file[_idx].ver)
	{
		global.player.name = ini_read_string("main", "name", "Salenis");
		for (var m = 0; m < 2; m++)
			global.player.money[m].amt = real(ini_read_string("money", $"amt_{m}", "0"));
		for (var e = 0; e < global.player.eff_amt; e++)
			global.player.eff[e].unlocked = real(ini_read_string("eff", $"unlocked_{e}", "0"));
		for (var e = 0; e < global.player.itm_amt; e++)
			global.player.itm[e].unlocked = real(ini_read_string("itm", $"unlocked_{e}", "0"));
		for (var e = 0; e < global.player.thm_amt; e++)
			global.player.thm[e].unlocked = real(ini_read_string("thm", $"unlocked_{e}", "0"));
		global.player.thm_curr = real(ini_read_string("thm", "curr", "0"));
	}
	
	
	ini_close();
}
function fn_player_file_erase(_idx)
{
	file_delete(global.player.file[_idx].name);
}