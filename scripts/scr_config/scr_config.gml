
//////// Functions related to the settings


function fn_config_setup()
{	
	// Keybinds
	enum CONFIG_KEY
	{
		LT,			// Left
		RT,			// Right
		UP,			// Up
		DN,			// Down
		SLCT,		// Select
		CNCL,		// Cancel
		MENU_INV,	// Inventory menu
		MENU_PSE,	// Pause menu
		ATWLK,		// Autowalk
		FSCR		// Fullscreen
	}
	fn_config_key_add(CONFIG_KEY.LT,			vk_left,	ord("A"));
	fn_config_key_add(CONFIG_KEY.RT,			vk_right,	ord("D"));
	fn_config_key_add(CONFIG_KEY.UP,			vk_up,		ord("W"));
	fn_config_key_add(CONFIG_KEY.DN,			vk_down,	ord("S"));
	fn_config_key_add(CONFIG_KEY.SLCT,			ord("Z"),	vk_enter);
	fn_config_key_add(CONFIG_KEY.CNCL,			ord("X"),	vk_shift);
	fn_config_key_add(CONFIG_KEY.MENU_INV,		ord("C"),	vk_control);
	fn_config_key_add(CONFIG_KEY.MENU_PSE,		vk_escape);
	fn_config_key_add(CONFIG_KEY.ATWLK,			ord("R"));
	fn_config_key_add(CONFIG_KEY.FSCR,			vk_f4,		vk_f11);
	
	
	// Keys the player can bind an action to
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
	
	
	// Graphics
	global.config_fscr = false; // Fullscreen
	global.config_wndSc = 1; // Window Scale
	global.config_vsync = false; // Vsync (display_reset)
	global.config_lowGfx = false; // Low Graphics
	global.config_hideCsr = true; // Hide Cursor
	global.config_showFps = false; // Show FPS
	global.config_showBdr = true; // Show Border
	global.config_showVer = true; // Show Version
	
	
	// Music & Sounds
	enum CONFIG_AUD_STYLE // Audio styles
	{
		MASTER,		// Master
		MUS,		// Music
		MENU,		// Menu
		PLAYER,		// Player
		INTERACT,	// Interaction
		ENTITY,		// Entities
		AMB			// Ambience
	}
	fn_config_aud_style_add(CONFIG_AUD_STYLE.MASTER);
	fn_config_aud_style_add(CONFIG_AUD_STYLE.MUS);
	fn_config_aud_style_add(CONFIG_AUD_STYLE.MENU);
	fn_config_aud_style_add(CONFIG_AUD_STYLE.PLAYER);
	fn_config_aud_style_add(CONFIG_AUD_STYLE.INTERACT);
	fn_config_aud_style_add(CONFIG_AUD_STYLE.ENTITY);
	fn_config_aud_style_add(CONFIG_AUD_STYLE.AMB);
	
	
	// Accessibility
	global.config_rdcdMot = false; // Reduced Motion
	
	
	// Other
	global.config_atwlk = false; // Autowalk
	
	
	// Save/Load the settings
	global.config_file_name = "config.ini";
	if (file_exists(global.config_file_name) == false)
		fn_config_file_save();
	else
		fn_config_file_load();
}


// Keybinds
function fn_config_key_add(_key_idx, _key_dflt, _key_alt = -1)
{
	global.config_key[_key_idx] =
	{
		dflt : _key_dflt,
		alt : _key_alt
	}
}


// Keys the player can bind an action to
function fn_config_keyList_add(_key_idx, _key, _key_name)
{
	global.config_keyList[_key_idx] =
	{
		key: _key,
		key_name: _key_name
	}
}


// Music & Sounds
function fn_config_aud_style_add(_aud_style)
{
	global.config_aud_style[_aud_style] = 
	{
		name : fn_config_lang_data_getText($"config_aud_style_name_{_aud_style}"), //"Stylish Baby";
		vol : 1
	}
}


// Functions related to saving and loading the game's settings
function fn_config_file_save()
{
	ini_open(global.config_file_name);
	ini_write_real("game", "ver", global.GAME_VER);
	ini_write_string("game", "msg", "You know, there's an in-game options menu. I think you'll like it!");
	
	
	// Keybinds
	for (var k = 0; k < array_length(global.config_key); k++)
	{
		ini_write_real("key", $"dflt_{k}", global.config_key[k].dflt);
		ini_write_real("key", $"alt_{k}", global.config_key[k].alt);
	}	
	
	// Graphics
	ini_write_real("vid", "fscr", global.config_fscr);
	ini_write_real("vid", "lowGfx", global.config_lowGfx);
	ini_write_real("vid", "hideCsr", global.config_hideCsr);
	ini_write_real("vid", "showFps", global.config_showFps);
	ini_write_real("vid", "showBdr", global.config_showBdr);
	
	// Music & Sounds
	for (var s = 0; s < array_length(global.config_aud_style); s++)
		ini_write_real("aud", $"style_vol_{s}", global.config_aud_style[s].vol);
	
	// Accessibility
	ini_write_real("a11y", "rdcdMot", global.config_rdcdMot);
	
	
	ini_close();
}
function fn_config_file_load()
{
	ini_open(global.config_file_name);
	
	if (ini_read_real("game", "ver", 0) == global.GAME_VER)
	{
		// Keybinds
		for (var k = 0; k < array_length(global.config_key); k++)
		{
			global.config_key[k].dflt = ini_read_real("key", $"dflt_{k}", global.config_key[k].dflt);
			global.config_key[k].alt = ini_read_real("key", $"alt_{k}", global.config_key[k].alt);
		}
		
		// Graphics
		global.config_fscr = ini_read_real("vid", "fscr", false);
		global.config_lowGfx = ini_read_real("vid", "lowGfx", false);
		global.config_hideCsr = ini_read_real("vid", "hideCsr", false);
		global.config_showFps = ini_read_real("vid", "showFps", false);
		global.config_showBdr = ini_read_real("vid", "showBdr", false);
	
		// Music & Sounds
		for (var s = 0; s < array_length(global.config_aud_style); s++)
			global.config_aud_style[s].vol = ini_read_real("aud", $"style_vol_{s}", 1);
		
		// Accessibility
		global.config_rdcdMot = ini_read_real("a11y", "rdcdMot", 0);
		
		
		ini_close();
	}
	else
	{
		ini_close();
		
		fn_config_file_erase();
		fn_config_file_save();
	}
}
function fn_config_file_erase()
{
	file_delete(global.config_file_name);
}