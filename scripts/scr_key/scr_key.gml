
//////// Funtions related to keybinds/controls


function fn_key(_KEY_CHECKtype, _KEY_IDX) // Returns if the given keybind is currently being pressed or held
{
	var _key, _KEY_TYPE_IDX;
	var _key_inp = false;
	
	// Loops through the two keybind types: defaults and alternatives
	for (var i = 0; i < 2; i++)
	{
		_KEY_TYPE_IDX = KEY_TYPE_IDX.DFLT;
		if (i == 1)
			_KEY_TYPE_IDX = KEY_TYPE_IDX.ALT;
		_key = global.sett_key[_KEY_TYPE_IDX, _KEY_IDX];
		
		// Checks if the given key is valid
		if (_key != -1)
		{
			_key_inp = keyboard_check_pressed(_key);
			if (_KEY_CHECKtype == KEY_CHECKtype.HOLD)
				_key_inp = keyboard_check(_key);
			
			if (_key_inp == false)
				continue;
			else if (_key_inp == true)
				break;
		}
		
		// Checks if the given key is invalid
		else if (_key == -1)
			continue;
	}
	
	return _key_inp;
}


function fn_keyQuick() // Provides several variables to make input-checking tasks quicker
{
	key_lt_press = fn_key(KEY_CHECKtype.PRESS, KEY_IDX.LT);
	key_rt_press = fn_key(KEY_CHECKtype.PRESS, KEY_IDX.RT);
	key_up_press = fn_key(KEY_CHECKtype.PRESS, KEY_IDX.UP);
	key_dn_press = fn_key(KEY_CHECKtype.PRESS, KEY_IDX.DN);
	key_slct_press = fn_key(KEY_CHECKtype.PRESS, KEY_IDX.SLCT);
	key_cncl_press = fn_key(KEY_CHECKtype.PRESS, KEY_IDX.CNCL);
	key_inv_press = fn_key(KEY_CHECKtype.PRESS, KEY_IDX.MENU_INV);
	key_pse_press = fn_key(KEY_CHECKtype.PRESS, KEY_IDX.MENU_PSE);
	key_atwlk_press = fn_key(KEY_CHECKtype.PRESS, KEY_IDX.ATWLK);
	
	key_lt_hold = fn_key(KEY_CHECKtype.HOLD, KEY_IDX.LT);
	key_rt_hold = fn_key(KEY_CHECKtype.HOLD, KEY_IDX.RT);
	key_up_hold = fn_key(KEY_CHECKtype.HOLD, KEY_IDX.UP);
	key_dn_hold = fn_key(KEY_CHECKtype.HOLD, KEY_IDX.DN);
}
