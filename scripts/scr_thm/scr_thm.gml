
//////// Functions related to themes


function fn_thm_setup() // Sets up the themes
{
	enum THM // Index of each theme in their arrays
	{
		DFLT = 0,	// Default theme
		MADOT = 1	// Madotsuki theme
	}
	
	// Default theme
	fn_thm_add(THM.DFLT, #949299, #949299, #545359, #545359, #100F11, #100F11, 0);
	global.thm_unlocked[THM.DFLT] = true;
	
	// Madotsuki theme
	fn_thm_add(THM.MADOT, #DEB2E7, #9C619C, #7B5184, #420439, #290831, c_black, , 1, 1);
	global.thm_unlocked[THM.MADOT] = true;
	
	global.thm = THM.DFLT;
}
function fn_thm_add(_idx, _col_whiteLight, _col_whiteDark, _col_grayLight, _col_grayDark, _col_shadow, _col_blur, _alp_shadow = 1, _alp_blurLight = 0.5, _alp_blurDark = 0.75)
{
	var t = _idx;
	
	
	// Main
	global.thm_unlocked[t] = false;
	global.thm_name[t] = fn_getText($"thm_name_{t}");
	global.thm_desc[t] = fn_getText($"thm_desc_{t}");
	
		// Colors
	global.thm_col[t] =
	{
		whiteLight : _col_whiteLight,
		whiteDark : _col_whiteDark,
		grayLight : _col_grayLight,
		grayDark : _col_grayDark,
		
		shadow : _col_shadow, // Shadow color for elements (options, information, etc.)
		blur : _col_blur // Color for dimmed background
	}
	
		// Alpha
	global.thm_alp[t] =
	{
		shadow: _alp_shadow, // Shadow alpha for elements (options, information, etc.)
		blurLight : _alp_blurLight, // Alpha for lightly dimmed background
		blurDark : _alp_blurDark // Alpha for heavily dimmed background
	}
	
	
	// Other
		// Box
	global.thm_box_spr[t] = fn_thm_getAsset(t, "spr_thm_box_");
	
		// Options
	global.thm_opt_move_snd[t] = fn_thm_getAsset(t, "snd_thm_opt_move_");
	global.thm_opt_slct_snd[t] = fn_thm_getAsset(t, "snd_thm_opt_slct_");
	global.thm_opt_cncl_snd[t] = fn_thm_getAsset(t, "snd_thm_opt_cncl_");
	global.thm_opt_fail_snd[t] = fn_thm_getAsset(t, "snd_thm_opt_fail_");
	
		// Option selector
	global.thm_opt_slctr_spr[t] = fn_thm_getAsset(t, "spr_thm_opt_slctr_");
	global.thm_opt_slctr_imgSpd[t] = 0.1;
	global.thm_opt_slctr_xDist[t] = 6;
	global.thm_opt_slctr_yDist[t] = 4;
	
		// Inventory  →  Frame of the player's picture
	global.thm_inv_picFrm_spr[t] = fn_thm_getAsset(t, "spr_thm_inv_picFrm_");
	
		// Unlock
	for (var s = 0; s < 3; s++)
		global.thm_unlock_snd[t, s] = fn_thm_getAsset(t, $"snd_thm_unlock_{s}_");
	
		// Misc
	global.thm_start_snd[t] = fn_thm_getAsset(t, "snd_thm_start_");
}
function fn_thm_getAsset(_idx, _asset_nameWithoutIdx)
{
	var t = _idx;
	
	var _asset = asset_get_index($"{_asset_nameWithoutIdx}{t}");
	if (_asset == -1)
		_asset = asset_get_index($"{_asset_nameWithoutIdx}0");
	
	return _asset;
}
