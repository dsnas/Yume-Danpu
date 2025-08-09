
//////// Functions related to the player


function fn_player_setup(_file_act = false)
{
	global.player_name = "Eleanor";
	global.player_awake = false;
	
	
	
	
	// Money
	global.player_money[false] = { // While sleeping (player_awake == false)
		amt : 0,
		ccy : "₢$ "
	}
	global.player_money[true] = { // While awake (player_awake == true)
		amt : irandom_range((15 + irandom_range(1, 4)), (25 + irandom_range(1, 4))),
		ccy : "R$ "
	}
	
	
	
	
	// Effects
	enum PLAYER_EFF
	{
		DBG_SAL0,
		DBG_SAL1,
		DBG_SAL2
	}
	fn_player_eff_add(PLAYER_EFF.DBG_SAL0);
	fn_player_eff_add(PLAYER_EFF.DBG_SAL1);
	fn_player_eff_add(PLAYER_EFF.DBG_SAL2);
	
	global.player_effCurr = -1; // Determines which effect is currently active (-1 == none)
	
	
	
	
	// Items
	enum PLAYER_ITM
	{
		KART
	}
	fn_player_itm_add(PLAYER_ITM.KART);
	
	global.player_itmCurr = -1; // Determines which item is currently active (-1 == none)
	
	
	
	
	// Themes
	enum PLAYER_THM
	{
		DFLT,	// Default theme
		SIMPLE, // Simple theme
		MADOT	// Madotsuki theme
	}
	fn_player_thm_add(PLAYER_THM.DFLT, true, #949299, #949299, #545359, #545359, #100F11, #100F11, 0); // Default theme
	fn_player_thm_add(PLAYER_THM.SIMPLE, true, c_white, c_ltgray, c_gray, c_dkgray, -1, c_black, 0); // Default theme
	fn_player_thm_add(PLAYER_THM.MADOT, true, #DEB2E7, #9C619C, #7B5184, #420439, #290831, c_black, , 1, 1); // Madotsuki
	
	global.player_thmCurr = PLAYER_THM.DFLT; // Determines which theme is currently active (-1 == none)
	
	
	
	
	// Room-specific data
	for (var i = 0; i < 50; i++)
	{
		if (room_exists(i) == true)
		{
			global.player_rm[i] =
			{
				visited : false
			}
		}
		else
			break;
	}
	
	
	
	
	// Prepare to save/load the player's data
	global.player_file = {
		act : _file_act
	}
	if (global.player_file.act == true)
		fn_player_file_setup();
}


function fn_player_actor_setup()
{	
	if (global.player_effCurr != effOld) || (global.player_itmCurr != itmOld)
	{
		dir[DIR_LT].spr = spr_player_dir_lt;
		dir[DIR_RT].spr = spr_player_dir_rt;
		dir[DIR_UP].spr = spr_player_dir_up;
		dir[DIR_DN].spr = spr_player_dir_dn;
		
		render.act = true;
		
		move_type.walk.act = true;
		move_type.walk.fstep.act = true;
		move_type.walk.fstep.snd_asset = snd_player_fstep;
		move_type.walk.fstep.snd_style = CONFIG_AUD_STYLE.PLAYER;
		move_type.roll.act = false;
		move_mode.key.act = true;
		move_precise.act = false;
		
		if (global.player_effCurr == -1 && global.player_itmCurr == -1)
		{		
			if (itmOld == PLAYER_ITM.KART)
			{
				x = fn_actor_round_x(id, x);
				y = fn_actor_round_x(id, y);
				render.x = x;
				render.y = y;
			}
		}
		else
		{
			//if (global.player_effCurr != -1)
			//{
			//	switch (global.player_effCurr)
			//	{
				
			//	}
			//}
			if (global.player_itmCurr != -1)
			{
				switch (global.player_itmCurr)
				{
					case PLAYER_ITM.KART:
						render.act = false;
						
						move_type.walk.act = false;
						move_type.roll.act = true;
						move_type.roll.snd.asset = snd_player_itm_kart;
						move_type.roll.snd.style = CONFIG_AUD_STYLE.PLAYER;
						move_type.roll.turn_snd.asset = snd_player_itm_kart_turn;
						move_type.roll.turn_snd.style = CONFIG_AUD_STYLE.PLAYER;
						move_type.roll.hit_snd.asset = snd_player_itm_kart_hit;
						move_type.roll.hit_snd.style = CONFIG_AUD_STYLE.PLAYER;
						move_precise.act = true;
						break;
				}
			}
		}
		
		effOld = global.player_effCurr;
		itmOld = global.player_itmCurr;
	}
}


// Effects
function fn_player_eff_add(_eff, _unlocked = false)
{
	global.player_eff[_eff] =
	{
		unlocked : _unlocked,
		name : fn_config_lang_data_getText($"eff_name_{_eff}"),
		desc : fn_config_lang_data_getText($"eff_desc_{_eff}")
	}
}
function fn_player_eff_unlock(_eff)
{
	if (global.player_eff[_eff].unlocked == false && fn_obj_exists(obj_player) == true && obj_player.move_stg <= -1)
	{
		global.player_eff[_eff].unlocked = true;
		fn_player_file_save();
		
		fn_menu_obj_create("unlock", 0, global.player_eff[_eff].name);
		obj_player.move_stg = -2;
	}
}


// Items
function fn_player_itm_add(_itm, _unlocked = false)
{
	global.player_itm[_itm] =
	{
		unlocked : _unlocked,
		name : fn_config_lang_data_getText($"itm_name_{_itm}"),
		desc : fn_config_lang_data_getText($"itm_desc_{_itm}")
	}
}
function fn_player_itm_unlock(_itm)
{
	if (global.player_itm[_itm].unlocked == false && fn_obj_exists(obj_player) == true && obj_player.move_stg <= -1)
	{
		global.player_itm[_itm].unlocked = true;
		fn_player_file_save();
		
		fn_menu_obj_create("unlock", 1, global.player_itm[_itm].name);
		obj_player.move_stg = -2;
	}
}
function fn_player_itm_equip(_itm)
{
	var _equip_sndIdx = 0;
	
	if (_itm != global.player_itmCurr)
		global.player_itmCurr = _itm;
	else
	{
		global.player_itmCurr = -1;
		_equip_sndIdx = 1;
	}
	
	fn_aud_play(global.player_thm[global.player_thmCurr].equip_snd[_equip_sndIdx], CONFIG_AUD_STYLE.MENU);
}


// Themes
function fn_player_thm_add(_thm, _unlocked = false, _col_whiteLight, _col_whiteDark, _col_grayLight, _col_grayDark, _col_shadow, _col_blur, _alp_shadow = 1, _alp_blurLight = 0.5, _alp_blurDark = 0.75)
{
	global.player_thm[_thm] =
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
			blurDark : _alp_blurDark // Alpha for heavily dimmed background
		},
		
		box_spr : fn_player_thm_getAsset(_thm, "spr_player_thm_box_"),
		
		opt_move_snd : fn_player_thm_getAsset(_thm, "snd_player_thm_opt_move_"),
		opt_slct_snd : fn_player_thm_getAsset(_thm, "snd_player_thm_opt_slct_"),
		opt_cncl_snd : fn_player_thm_getAsset(_thm, "snd_player_thm_opt_cncl_"),
		opt_fail_snd : fn_player_thm_getAsset(_thm, "snd_player_thm_opt_fail_"),
		
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
function fn_player_thm_getAsset(_thm, _asset_nameWithoutIdx)
{
	var _asset = asset_get_index($"{_asset_nameWithoutIdx}{_thm}");
	if (_asset == -1)
		_asset = asset_get_index($"{_asset_nameWithoutIdx}0");
	return _asset;
}
function fn_player_thm_unlock(_thm)
{
	if (global.player_thm[_thm].unlocked == false && fn_obj_exists(obj_player) == true && obj_player.move_stg <= -1)
	{
		global.player_thm[_thm].unlocked = true;
		fn_player_file_save();
		
		fn_menu_obj_create("unlock", 2, global.player_thm[_thm].name);
		obj_player.move_stg = -2;
	}
}
function fn_player_thm_equip(_thm)
{
	global.player_thmCurr = _thm;
	fn_player_file_save();
}


// Saving and loading the player's data
function fn_player_file_setup()
{
	// Save/Load the player's data
	global.player_file.name = "player.ini";
	global.player_file.msg = "Gosh, I wonder why someone would come here. It wouldn't be to cheat, would it?";
	
	if (file_exists(global.player_file.name) == false)
		fn_player_file_save();
	else
		fn_player_file_load();
}
function fn_player_file_save()
{
	ini_open(global.player_file.name);
	ini_write_real("game", "ver", global.game.ver);
	ini_write_string("game", "msg", global.player_file.msg);
	
	
	ini_write_string("main", "name", global.player_name);
	
	// Money
	for (var m = 0; m < 2; m++)
		ini_write_real("money", $"amt_{m}", global.player_money[m].amt);
	
	// Effects
	for (var e = 0; e < array_length(global.player_eff); e++)
		ini_write_real("eff", $"unlocked_{e}", global.player_eff[e].unlocked);
	
	// Items
	for (var i = 0; i < array_length(global.player_itm); i++)
		ini_write_real("itm", $"unlocked_{i}", global.player_itm[i].unlocked);
	
	// Themes
	for (var t = 0; t < array_length(global.player_thm); t++)
		ini_write_real("thm", $"unlocked_{t}", global.player_thm[t].unlocked);
	ini_write_real("thm", "curr", global.player_thmCurr);
	
	
	ini_close();
}
function fn_player_file_load()
{
	ini_open(global.player_file.name);
	
	if (ini_read_real("game", "ver", 0) == global.game.ver)
	{
		global.player_name = ini_read_string("main", "name", "Salenis");
		
		// Money
		for (var m = 0; m < 2; m++)
			global.player_money[m].amt = ini_read_real("money", $"amt_{m}", 0);
		
		// Effects
		for (var e = 0; e < array_length(global.player_eff); e++)
			global.player_eff[e].unlocked = ini_read_real("eff", $"unlocked_{e}", false);
		
		// Items
		for (var i = 0; i < array_length(global.player_itm); i++)
			global.player_itm[i].unlocked = ini_read_real("itm", $"unlocked_{i}", false);
		
		// Themes
		for (var t = 0; t < array_length(global.player_thm); t++)
			global.player_thm[t].unlocked = ini_read_real("thm", $"unlocked_{t}", false);
		global.player_thmCurr = ini_read_real("thm", "curr", PLAYER_THM.DFLT);
		
		
		ini_close();
	}
	else
	{
		ini_close();
		
		fn_player_file_erase();
		fn_player_file_save();
	}
}
function fn_player_file_erase()
{
	file_delete(global.player_file.name);
}
