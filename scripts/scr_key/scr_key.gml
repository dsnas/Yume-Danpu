
//////// Functions related to key inputs


function fn_key_pressed(_key_idx) // Returns if the specified keybind has been pressed
{
	var _key_inp = keyboard_check_pressed(global.config_key[_key_idx].dflt);
	if (_key_inp == false)
		_key_inp = keyboard_check_pressed(global.config_key[_key_idx].alt);
	return _key_inp;
}
function fn_key_held(_key_idx) // Returns if the specified keybind is currently being held
{
	var _key_inp = keyboard_check(global.config_key[_key_idx].dflt);
	if (_key_inp == false)
		_key_inp = keyboard_check(global.config_key[_key_idx].alt);
	return _key_inp;
}
function fn_key_quick() // Provides several variables to make input-checking tasks quicker
{
	press_lt = fn_key_pressed(CONFIG_KEY.LT);
	press_rt = fn_key_pressed(CONFIG_KEY.RT);
	press_up = fn_key_pressed(CONFIG_KEY.UP);
	press_dn = fn_key_pressed(CONFIG_KEY.DN);
	press_slct = fn_key_pressed(CONFIG_KEY.SLCT);
	press_cncl = fn_key_pressed(CONFIG_KEY.CNCL);
	press_inv = fn_key_pressed(CONFIG_KEY.MENU_INV);
	press_pse = fn_key_pressed(CONFIG_KEY.MENU_PSE);
	press_fscr = fn_key_pressed(CONFIG_KEY.FSCR);
	press_atwlk = fn_key_pressed(CONFIG_KEY.ATWLK);
	
	hold_lt = fn_key_held(CONFIG_KEY.LT);
	hold_rt = fn_key_held(CONFIG_KEY.RT);
	hold_up = fn_key_held(CONFIG_KEY.UP);
	hold_dn = fn_key_held(CONFIG_KEY.DN);
}
