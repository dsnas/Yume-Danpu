
//////// Functions related to the game's settings


function fn_sett_setup() // Sets up the game's settings 
{
	// Languages
	enum LANG_IDX
	{
		EN_US = 0, // English
		PT_BR = 1 // Brazilian Portuguese
	}
	global.sett_lang = LANG_IDX.EN_US; // (ID of the current language)
	
	global.sett_lang_name[LANG_IDX.EN_US] = "English (United States)";
	global.sett_lang_name[LANG_IDX.PT_BR] = "Português (Brasil)";
	global.sett_lang_amt = array_length(global.sett_lang_name);
	
	
	
	
	// Video Settings
	global.sett_fscr = false; // (Fullscreen)
	global.sett_lowGfx = false; // (Low Graphics)
	global.sett_showFps = false; // (Show FPS)
	global.sett_showBdr = false; // (Show Border)
	
	
	
	
	// Audio Settings
	enum VOL_IDX // (Stores the index of each volume in the array)
	{
		MASTER = 0,		// (Controls all others volumes)
		MUS = 1,		// (Music)
		MENU = 2,		// (Sounds played by navigating through menus) 
		PLAYER = 3,		// (Sounds played by the player)
		INTERACT = 4,	// (Sounds played by interacting with objects)
		ENTITY = 5,		// (Sounds played by interacting with NPCs)
		AMBIENT = 6		// (Sounds played in the background by the world)
	}
	
	global.sett_vol[VOL_IDX.MASTER] = 1;
	global.sett_vol[VOL_IDX.MUS] = 0;
	global.sett_vol[VOL_IDX.MENU] = 1;
	global.sett_vol[VOL_IDX.PLAYER] = 1;
	global.sett_vol[VOL_IDX.INTERACT] = 1;
	global.sett_vol[VOL_IDX.ENTITY] = 1;
	global.sett_vol[VOL_IDX.AMBIENT] = 1;
	
	
	
	
	/* (Keybinds) */
	enum KEY_TYPE_IDX // (Stores the index of each keybind type in the array)
	{
		DFLT = 0,	// (Default)
		ALT = 1		// (Alternatives)
	}
	
	enum KEY_IDX // (Stores the index of each keybind in the array)
	{
		LT = 0,			// (Left)
		RT = 1,			// (Right)
		UP = 2,			// (Up)
		DN = 3,			// (Down)
		SLCT = 4,		// (Select)
		CNCL = 5,		// (Cancel)
		MENU_INV = 6,	// (Inventory menu)
		MENU_PSE = 7,	// (Pause menu)
		FSCR = 8,		// (Fullscreen)
		ATWLK = 9		// (Autowalk)
	}
	
	enum KEY_CHECKtype // (Stores the ID of the types of checking for input)
	{
		PRESS = 0,	// (Pressed key)
		HOLD = 1	// (Is holding key)
	}
	
	global.sett_key_amtMax = 15;
	for (var k = 0; k < global.sett_key_amtMax; k++)
	{
		global.sett_key[KEY_TYPE_IDX.DFLT, k]	= -1;
		global.sett_key[KEY_TYPE_IDX.ALT, k]	= -1;
	}
	
		// Default keybinds
	var _KEY_TYPE_IDX = KEY_TYPE_IDX.DFLT;
	fn_sett_key_add(_KEY_TYPE_IDX, KEY_IDX.LT,		vk_left);
	fn_sett_key_add(_KEY_TYPE_IDX, KEY_IDX.RT,		vk_right);
	fn_sett_key_add(_KEY_TYPE_IDX, KEY_IDX.UP,		vk_up);
	fn_sett_key_add(_KEY_TYPE_IDX, KEY_IDX.DN,		vk_down);
	fn_sett_key_add(_KEY_TYPE_IDX, KEY_IDX.SLCT,		ord("Z"));
	fn_sett_key_add(_KEY_TYPE_IDX, KEY_IDX.CNCL,		ord("Z"));
	fn_sett_key_add(_KEY_TYPE_IDX, KEY_IDX.MENU_INV,	ord("C"));
	fn_sett_key_add(_KEY_TYPE_IDX, KEY_IDX.MENU_PSE,	vk_escape);
	fn_sett_key_add(_KEY_TYPE_IDX, KEY_IDX.FSCR,		vk_f4);
	fn_sett_key_add(_KEY_TYPE_IDX, KEY_IDX.ATWLK,	ord("R"));
	
		// Alternative keybinds
	var _KEY_TYPE_IDX = KEY_TYPE_IDX.ALT;
	fn_sett_key_add(_KEY_TYPE_IDX, KEY_IDX.SLCT,		vk_enter);
	fn_sett_key_add(_KEY_TYPE_IDX, KEY_IDX.CNCL,		vk_shift);
	fn_sett_key_add(_KEY_TYPE_IDX, KEY_IDX.MENU_INV,	vk_control);
	
	
	
	
	// List of keys the player can bind an action to
	global.sett_keyList[0] = -1;
	global.sett_keyList_name[0] = "";
	
	var k = 0;
	fn_sett_keyList_add(k++, vk_left,	"←");
	fn_sett_keyList_add(k++, vk_right,	"→");
	fn_sett_keyList_add(k++, vk_up,		"↑");
	fn_sett_keyList_add(k++, vk_down,	"↓");
	fn_sett_keyList_add(k++, ord("A"),	"A");
	fn_sett_keyList_add(k++, ord("B"),	"B");
	fn_sett_keyList_add(k++, ord("C"),	"C");
	fn_sett_keyList_add(k++, ord("D"),	"D");
	fn_sett_keyList_add(k++, ord("E"),	"E");
	fn_sett_keyList_add(k++, ord("F"),	"F");
	fn_sett_keyList_add(k++, ord("G"),	"G");
	fn_sett_keyList_add(k++, ord("H"),	"H");
	fn_sett_keyList_add(k++, ord("I"),	"I");
	fn_sett_keyList_add(k++, ord("J"),	"J");
	fn_sett_keyList_add(k++, ord("K"),	"K");
	fn_sett_keyList_add(k++, ord("L"),	"L");
	fn_sett_keyList_add(k++, ord("M"),	"M");
	fn_sett_keyList_add(k++, ord("N"),	"N");
	fn_sett_keyList_add(k++, ord("O"),	"O");
	fn_sett_keyList_add(k++, ord("P"),	"P");
	fn_sett_keyList_add(k++, ord("Q"),	"Q");
	fn_sett_keyList_add(k++, ord("R"),	"R");
	fn_sett_keyList_add(k++, ord("S"),	"S");
	fn_sett_keyList_add(k++, ord("T"),	"T");
	fn_sett_keyList_add(k++, ord("U"),	"U");
	fn_sett_keyList_add(k++, ord("V"),	"V");
	fn_sett_keyList_add(k++, ord("W"),	"W");
	fn_sett_keyList_add(k++, ord("X"),	"X");
	fn_sett_keyList_add(k++, ord("Y"),	"Y");
	fn_sett_keyList_add(k++, ord("Z"),	"Z");
	fn_sett_keyList_add(k++, vk_space,		"Space");
	fn_sett_keyList_add(k++, vk_enter,		"Enter");
	fn_sett_keyList_add(k++, vk_backspace,	"Backspace");
	fn_sett_keyList_add(k++, vk_shift,		"Shift");
	fn_sett_keyList_add(k++, vk_control,	"Ctrl");
	fn_sett_keyList_add(k++, vk_alt,		"Alt");
	fn_sett_keyList_add(k++, vk_tab,		"Tab");
	fn_sett_keyList_add(k++, vk_escape,		"Esc");
	fn_sett_keyList_add(k++, vk_numpad0,	"0");
	fn_sett_keyList_add(k++, vk_numpad1,	"1");
	fn_sett_keyList_add(k++, vk_numpad2,	"2");
	fn_sett_keyList_add(k++, vk_numpad3,	"3");
	fn_sett_keyList_add(k++, vk_numpad4,	"4");
	fn_sett_keyList_add(k++, vk_numpad5,	"5");
	fn_sett_keyList_add(k++, vk_numpad6,	"6");
	fn_sett_keyList_add(k++, vk_numpad7,	"7");
	fn_sett_keyList_add(k++, vk_numpad8,	"8");
	fn_sett_keyList_add(k++, vk_numpad9,	"9");
	fn_sett_keyList_add(k++, vk_f1,		"F1");
	fn_sett_keyList_add(k++, vk_f2,		"F2");
	fn_sett_keyList_add(k++, vk_f3,		"F3");
	fn_sett_keyList_add(k++, vk_f4,		"F4");
	fn_sett_keyList_add(k++, vk_f5,		"F5");
	fn_sett_keyList_add(k++, vk_f6,		"F6");
	fn_sett_keyList_add(k++, vk_f7,		"F7");
	fn_sett_keyList_add(k++, vk_f8,		"F8");
	fn_sett_keyList_add(k++, vk_f9,		"F9");
	fn_sett_keyList_add(k++, vk_f10,	"F10");
	fn_sett_keyList_add(k++, vk_f11,	"F11");
	fn_sett_keyList_add(k++, vk_f12,	"F12");
	
	

	
	/* (Accessibility) */
	global.sett_rdcdMot = false; // (Reduced Motion)
}

function fn_sett_key_add(_KEY_TYPE_IDX, _KEY_IDX, _key) // (Binds the given key to the specified action)
{
	global.sett_key[_KEY_TYPE_IDX, _KEY_IDX] = _key;
}

function fn_sett_keyList_add(_idx, _key, _key_name) // (Adds a key and its name to the specified position on the list)
{
	global.sett_keyList[_idx] = _key;
	global.sett_keyList_name[_idx] = _key_name;
}
