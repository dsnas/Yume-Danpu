
//////// Functions related to the game's settings


function fn_sett_setup() // Sets up the game's settings 
{
	// Video Settings
	global.sett_fscr = false; // Fullscreen
	global.sett_lowGfx = false; // Low Graphics
	global.sett_showFps = false; // Show FPS)
	global.sett_showBdr = false; // Show Border
	
	
	// Audio Settings
	enum VOL_IDX // Index of each volume in the array
	{
		MASTER = 0,		// Controls all others volumes
		MUS = 1,		// Music
		MENU = 2,		// Sounds played by navigating through menus
		PLAYER = 3,		// Sounds played by the player
		INTERACT = 4,	// Sounds played by interacting with objects
		ENTITY = 5,		// Sounds played by interacting with NPCs
		AMBIENT = 6		// Sounds played in the background by the world
	}
	
	global.sett_vol[VOL_IDX.MASTER] = 1;
	global.sett_vol[VOL_IDX.MUS] = 1;
	global.sett_vol[VOL_IDX.MENU] = 1;
	global.sett_vol[VOL_IDX.PLAYER] = 1;
	global.sett_vol[VOL_IDX.INTERACT] = 1;
	global.sett_vol[VOL_IDX.ENTITY] = 1;
	global.sett_vol[VOL_IDX.AMBIENT] = 1;
	
	
	// List of keys the player can bind an action to
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
	
	
	// Accessibility
	global.sett_rdcdMot = false; // Reduced Motion
}


function fn_sett_keyList_add(_idx, _key, _name) // Adds a key and its name to the specified position on the list
{
	var i = _idx;
	
	global.sett_keyList[i] = _key;
	global.sett_keyList_name[i] = _name;
}
