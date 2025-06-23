
//////// Funtions related to keybinds/controls


function fn_key_setup() // Sets up the default and alternative keybinds
{
	fn_key_add(0, -1, -1);
	
	enum KEY_IDX // Index of each keybind in the array
	{
		LT = 0,			// Left
		RT = 1,			// Right
		UP = 2,			// Up
		DN = 3,			// Down
		SLCT = 4,		// Select
		CNCL = 5,		// Cancel
		MENU_INV = 6,	// Inventory menu
		MENU_PSE = 7,	// Pause menu
		FSCR = 8,		// Fullscreen
		ATWLK = 9		// Autowalk
	}
	fn_key_add(KEY_IDX.LT,			vk_left,	ord("A"));
	fn_key_add(KEY_IDX.RT,			vk_right,	ord("D"));
	fn_key_add(KEY_IDX.UP,			vk_up,		ord("W"));
	fn_key_add(KEY_IDX.DN,			vk_down,	ord("S"));
	fn_key_add(KEY_IDX.SLCT,		ord("Z"),	vk_enter);
	fn_key_add(KEY_IDX.CNCL,		ord("X"),	vk_shift);
	fn_key_add(KEY_IDX.MENU_INV,	ord("C"),	vk_control);
	fn_key_add(KEY_IDX.MENU_PSE,	vk_escape,	-1);
	fn_key_add(KEY_IDX.FSCR,		vk_f4,		-1);
	fn_key_add(KEY_IDX.ATWLK,		ord("R"),	-1);
}
function fn_key_add(_key_idx, _key_dflt, _key_alt)
{
	global.key_dflt[_key_idx] = _key_dflt;
	global.key_alt[_key_idx] = _key_alt;
}



function fn_key_press(_key_idx) // Returns if the specified keybind has been pressed
{
	return max(keyboard_check_pressed(global.key_dflt[_key_idx]), keyboard_check_pressed(global.key_alt[_key_idx]));
}
function fn_key_hold(_key_idx) // Returns if the specified keybind is currently being held
{
	return max(keyboard_check(global.key_dflt[_key_idx]), keyboard_check(global.key_alt[_key_idx]));
}


function fn_key_quick() // Provides several variables to make input-checking tasks quicker
{
	key_press_lt	= fn_key_press(KEY_IDX.LT);
	key_press_rt	= fn_key_press(KEY_IDX.RT);
	key_press_up	= fn_key_press(KEY_IDX.UP);
	key_press_dn	= fn_key_press(KEY_IDX.DN);
	key_press_slct	= fn_key_press(KEY_IDX.SLCT);
	key_press_cncl	= fn_key_press(KEY_IDX.CNCL);
	key_press_inv	= fn_key_press(KEY_IDX.MENU_INV);
	key_press_pse	= fn_key_press(KEY_IDX.MENU_PSE);
	key_press_fscr	= fn_key_press(KEY_IDX.FSCR);
	key_press_atwlk	= fn_key_press(KEY_IDX.ATWLK);
	
	key_hold_lt		= fn_key_hold(KEY_IDX.LT);
	key_hold_rt		= fn_key_hold(KEY_IDX.RT);
	key_hold_up		= fn_key_hold(KEY_IDX.UP);
	key_hold_dn		= fn_key_hold(KEY_IDX.DN);
}
