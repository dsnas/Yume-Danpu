
//////// Functions related to the game's settings


// Functions related the game's settings
function fn_config_setup_0() // Sets up the game's settings (does not require the current language's text data)
{
	// Languages
	fn_config_lang_setup();
	
	// Graphics
	global.config_fscr = false; // Fullscreen
	global.config_lowGfx = false; // Low Graphics
	global.config_hideCsr = true; // Hide Cursor
	global.config_showFps = false; // Show FPS
	global.config_showBdr = true; // Show Border
	global.config_showVer = true; // Show Version
	
	// Music & Sounds
	fn_config_volType_setup_0();
	
	// Keybinds
	fn_config_key_setup();
	
	// Accessibility
	global.config_rdcdMot = false; // Reduced Motion
	
	
	// Save/Load the game's settings
	global.config_file_name = "config.ini";
	if (file_exists(global.config_file_name) == false)
		fn_config_file_save();
	else
		fn_config_file_load();
}
function fn_config_setup_1() // Sets up the game's settings (requires the current language's text data) (everything set up here mustn't be saved)
{
	// Languages
	fn_config_lang_textData_setup();
	
	// Music & Sounds
	fn_config_volType_setup_1();
	
	// Keybinds
	fn_config_keyList_setup();
	
	// Other
	global.config_atwlk = false; // Autowalk
}


// Functions related to the languages
function fn_config_lang_setup() // Sets up the available languages without loading their text data
{
	enum CONFIG_LANG // Index of each available language
	{
		EN_US = 0,	// English (United States)
		PT_BR = 1	// Português (Brasil)
	}
	
	fn_config_lang_add(CONFIG_LANG.EN_US, "English (US)");
	fn_config_lang_add(CONFIG_LANG.PT_BR, "Português (BR)");
	
	global.config_lang_len = array_length(global.config_lang_name);	// Total amount of available languages
	global.config_lang = CONFIG_LANG.EN_US; // The current language
	global.config_lang_hasChosen = false; // Determines whether the player has selected a language when game opened for the first time
}
function fn_config_lang_add(_idx, _name) // Adds a language to the language list
{
	var l = _idx;
	global.config_lang_name[l] = _name;
	global.config_lang_textData[l] = -1;
}

function fn_config_lang_mod(_idx) // Changes the current language to the specified one
{
	global.config_lang = _idx;
	
	fn_config_file_save();
	fn_config_setup_1();
	fn_profile_setup();
}


// Functions related to the volume types
function fn_config_volType_setup_0() // Sets up the volume types array
{
	enum CONFIG_VOLTYPE // Index of each volume type in the array
	{
		MASTER = 0,		// Controls all others volumes
		MUS = 1,		// Music
		MENU = 2,		// Sounds played by navigating through menus
		PLAYER = 3,		// Sounds played by the player
		INTERACT = 4,	// Sounds played by interacting with objects
		ENTITY = 5,		// Sounds played by interacting with NPCs
		AMBIENT = 6		// Sounds played in the background by the world
	}
	
	fn_config_volType_add(CONFIG_VOLTYPE.MASTER, 1);
	fn_config_volType_add(CONFIG_VOLTYPE.MUS, 1);
	fn_config_volType_add(CONFIG_VOLTYPE.MENU, 1);
	fn_config_volType_add(CONFIG_VOLTYPE.PLAYER, 1);
	fn_config_volType_add(CONFIG_VOLTYPE.INTERACT, 1);
	fn_config_volType_add(CONFIG_VOLTYPE.ENTITY, 1);
	fn_config_volType_add(CONFIG_VOLTYPE.AMBIENT, 1);
	
	global.config_volType_len = array_length(global.config_volType);
}
function fn_config_volType_setup_1()
{
	for (var v = 0; v < global.config_volType_len; v++)
		global.config_volType_name[v] = fn_getText(global.config_volType_name[v]);
}
function fn_config_volType_add(_idx, _vol)
{
	var v = _idx;
	global.config_volType[v] = _vol;
	global.config_volType_name[v] = $"volType_name_{v}";
}


// Functions related to the player's keybinds
function fn_config_key_setup() // Sets up the list of the player's current keybinds
{
	enum CONFIG_KEY // Index of each keybind in the array
	{
		LT = 0,			// Left
		RT = 1,			// Right
		UP = 2,			// Up
		DN = 3,			// Down
		SLCT = 4,		// Select
		CNCL = 5,		// Cancel
		MENU_INV = 6,	// Inventory menu
		MENU_PSE = 7,	// Pause menu
		ATWLK = 8,		// Autowalk
		FSCR = 9		// Fullscreen
	}
	
	fn_config_key_add(CONFIG_KEY.LT,			vk_left,	ord("A"));
	fn_config_key_add(CONFIG_KEY.RT,			vk_right,	ord("D"));
	fn_config_key_add(CONFIG_KEY.UP,			vk_up,		ord("W"));
	fn_config_key_add(CONFIG_KEY.DN,			vk_down,	ord("S"));
	fn_config_key_add(CONFIG_KEY.SLCT,			ord("Z"),	vk_enter);
	fn_config_key_add(CONFIG_KEY.CNCL,			ord("X"),	vk_shift);
	fn_config_key_add(CONFIG_KEY.MENU_INV,		ord("C"),	vk_control);
	fn_config_key_add(CONFIG_KEY.MENU_PSE,		vk_escape,	-1);
	fn_config_key_add(CONFIG_KEY.ATWLK,			ord("R"),	-1);
	fn_config_key_add(CONFIG_KEY.FSCR,			vk_f4,		-1);
	
	global.config_key_len = array_length(global.config_key_dflt);
}
function fn_config_key_add(_key, _key_dflt_id, _key_alt_id) // Adds a key to the specified position on the current keybinds list
{
	global.config_key_dflt[_key] = _key_dflt_id;
	global.config_key_alt[_key] = _key_alt_id;
}

function fn_config_key_press(_key) // Returns if the specified keybind has been pressed
{
	return max(keyboard_check_pressed(global.config_key_dflt[_key]), keyboard_check_pressed(global.config_key_alt[_key]));
}
function fn_config_key_hold(_key) // Returns if the specified keybind is currently being held
{
	return max(keyboard_check(global.config_key_dflt[_key]), keyboard_check(global.config_key_alt[_key]));
}
function fn_config_key_quick() // Provides several variables to make input-checking tasks quicker
{
	press_lt = fn_config_key_press(CONFIG_KEY.LT);
	press_rt = fn_config_key_press(CONFIG_KEY.RT);
	press_up = fn_config_key_press(CONFIG_KEY.UP);
	press_dn = fn_config_key_press(CONFIG_KEY.DN);
	press_slct = fn_config_key_press(CONFIG_KEY.SLCT);
	press_cncl = fn_config_key_press(CONFIG_KEY.CNCL);
	press_inv = fn_config_key_press(CONFIG_KEY.MENU_INV);
	press_pse = fn_config_key_press(CONFIG_KEY.MENU_PSE);
	press_fscr = fn_config_key_press(CONFIG_KEY.FSCR);
	press_atwlk = fn_config_key_press(CONFIG_KEY.ATWLK);
	
	hold_lt = fn_config_key_hold(CONFIG_KEY.LT);
	hold_rt = fn_config_key_hold(CONFIG_KEY.RT);
	hold_up = fn_config_key_hold(CONFIG_KEY.UP);
	hold_dn = fn_config_key_hold(CONFIG_KEY.DN);
}


	// Functions related to the list of keys the player can bind an action to
function fn_config_keyList_setup() // Sets up the list key list
{
	var k = 0;
	
	fn_config_keyList_add(k++, vk_left, "←");
	fn_config_keyList_add(k++, vk_right, "→");
	fn_config_keyList_add(k++, vk_up, "↑");
	fn_config_keyList_add(k++, vk_down, "↓");
	fn_config_keyList_add(k++, ord("A"), "A");
	fn_config_keyList_add(k++, ord("B"), "B");
	fn_config_keyList_add(k++, ord("C"), "C");
	fn_config_keyList_add(k++, ord("D"), "D");
	fn_config_keyList_add(k++, ord("E"), "E");
	fn_config_keyList_add(k++, ord("F"), "F");
	fn_config_keyList_add(k++, ord("G"), "G");
	fn_config_keyList_add(k++, ord("H"), "H");
	fn_config_keyList_add(k++, ord("I"), "I");
	fn_config_keyList_add(k++, ord("J"), "J");
	fn_config_keyList_add(k++, ord("K"), "K");
	fn_config_keyList_add(k++, ord("L"), "L");
	fn_config_keyList_add(k++, ord("M"), "M");
	fn_config_keyList_add(k++, ord("N"), "N");
	fn_config_keyList_add(k++, ord("O"), "O");
	fn_config_keyList_add(k++, ord("P"), "P");
	fn_config_keyList_add(k++, ord("Q"), "Q");
	fn_config_keyList_add(k++, ord("R"), "R");
	fn_config_keyList_add(k++, ord("S"), "S");
	fn_config_keyList_add(k++, ord("T"), "T");
	fn_config_keyList_add(k++, ord("U"), "U");
	fn_config_keyList_add(k++, ord("V"), "V");
	fn_config_keyList_add(k++, ord("W"), "W");
	fn_config_keyList_add(k++, ord("X"), "X");
	fn_config_keyList_add(k++, ord("Y"), "Y");
	fn_config_keyList_add(k++, ord("Z"), "Z");
	fn_config_keyList_add(k++, vk_space, "Space");
	fn_config_keyList_add(k++, vk_enter, "Enter");
	fn_config_keyList_add(k++, vk_backspace, "Backspace");
	fn_config_keyList_add(k++, vk_shift, "Shift");
	fn_config_keyList_add(k++, vk_control, "Ctrl");
	fn_config_keyList_add(k++, vk_alt, "Alt");
	fn_config_keyList_add(k++, vk_tab, "Tab");
	fn_config_keyList_add(k++, vk_escape, "Esc");
	fn_config_keyList_add(k++, vk_numpad0, "0");
	fn_config_keyList_add(k++, vk_numpad1, "1");
	fn_config_keyList_add(k++, vk_numpad2, "2");
	fn_config_keyList_add(k++, vk_numpad3, "3");
	fn_config_keyList_add(k++, vk_numpad4, "4");
	fn_config_keyList_add(k++, vk_numpad5, "5");
	fn_config_keyList_add(k++, vk_numpad6, "6");
	fn_config_keyList_add(k++, vk_numpad7, "7");
	fn_config_keyList_add(k++, vk_numpad8, "8");
	fn_config_keyList_add(k++, vk_numpad9, "9");
	fn_config_keyList_add(k++, vk_f1, "F1");
	fn_config_keyList_add(k++, vk_f2, "F2");
	fn_config_keyList_add(k++, vk_f3, "F3");
	fn_config_keyList_add(k++, vk_f4, "F4");
	fn_config_keyList_add(k++, vk_f5, "F5");
	fn_config_keyList_add(k++, vk_f6, "F6");
	fn_config_keyList_add(k++, vk_f7, "F7");
	fn_config_keyList_add(k++, vk_f8, "F8");
	fn_config_keyList_add(k++, vk_f9, "F9");
	fn_config_keyList_add(k++, vk_f10, "F10");
	fn_config_keyList_add(k++, vk_f11, "F11");
	fn_config_keyList_add(k++, vk_f12, "F12");
}
function fn_config_keyList_add(_key, _key_id, _key_name) // Adds a key and its name to the specified position on the list
{
	var i = _key;
	
	global.config_keyList[i] = _key_id;
	global.config_keyList_name[i] = _key_name;
}


// Functions related to saving and loading the game's settings
function fn_config_file_save()
{
	ini_open(global.config_file_name);
	ini_write_real("game", "ver", global.GAME_VER);
	ini_write_string("game", "msg", "You know, there's an in-game options menu. I think you'll like it!");
	
	
	// Languages
	ini_write_real("langs", "lang", global.config_lang);
	ini_write_real("langs", "hasChosen", global.config_lang_hasChosen);
	
	// Video Settings
	ini_write_real("vid", "fscr", global.config_fscr);
	ini_write_real("vid", "lowGfx", global.config_lowGfx);
	ini_write_real("vid", "hideCsr", global.config_hideCsr);
	ini_write_real("vid", "showFps", global.config_showFps);
	ini_write_real("vid", "showBdr", global.config_showBdr);
	
	// Audio Settings
	for (var i = 0; i < global.config_volType_len; i++)
		ini_write_real("aud", $"vol_{i}", global.config_volType[i]);
	
	// Keybinds
	for (var i = 0; i < global.config_key_len; i++)
		ini_write_real("keys", $"dflt_{i}", global.config_key_dflt[i]);
	for (var i = 0; i < global.config_key_len; i++)
		ini_write_real("keys", $"alt_{i}", global.config_key_alt[i]);
	
	// Accessibility
	ini_write_real("a11y", "rdcdMot", global.config_rdcdMot);
	
	
	ini_close();
}
function fn_config_file_load()
{
	ini_open(global.config_file_name);
	
	if (ini_read_real("game", "ver", 0) == global.GAME_VER)
	{
		// Languages
		global.config_lang = ini_read_real("langs", "lang", 0);
		global.config_lang_hasChosen = ini_read_real("langs", "hasChosen", 0);
	
		// Video Settings
		global.config_fscr = ini_read_real("vid", "fscr", 0);
		global.config_lowGfx = ini_read_real("vid", "lowGfx", 0);
		global.config_hideCsr = ini_read_real("vid", "hideCsr", 0);
		global.config_showFps = ini_read_real("vid", "showFps", 0);
		global.config_showBdr = ini_read_real("vid", "showBdr", 0);
	
		// Audio Settings
		for (var i = 0; i < global.config_volType_len; i++)
			global.config_volType[i] = ini_read_real("aud", $"vol_{i}", 1);
	
		// Keybinds
		for (var i = 0; i < global.config_key_len; i++)
			global.config_key_dflt[i] = ini_read_real("keys", $"dflt_{i}", 0);
		for (var i = 0; i < global.config_key_len; i++)
			global.config_key_alt[i] = ini_read_real("keys", $"alt_{i}", 0);
	
		// Accessibility
		global.config_rdcdMot = ini_read_real("a11y", "rdcdMot", 0);
		
		
		ini_close();
	}
	else
	{
		ini_close();
		file_delete(global.config_file_name);
		
		fn_config_file_save();
	}
}
