
//////// Functions related to the player's settings 


function fn_config_setup()
{
	global.config =
	{
		// Main
		name : (irandom_range(1, 100) != 1) ? "Yume Danpu" : choose("Danpu Nikki", "Yume Nikki", "Yume Dapnu", "Yume Danpy", "Yume Dangu", "Yume-Danpu", "Yume Fanpu", "Dume Yanpu", "Yume Champu", "Yummy Danpu", "Yummy Nicky", "Yum Dnampy", "Yume Dhanpy"),
		ver : 0.05,
		
		// Languages
		lang : [-1],
		lang_curr : 0,
		lang_data : -1,
		lang_hasChosen : false,
		
		// Keybinds
		key : [-1],
		
		// Video
		vid :
		{
			resW : 320,
			resH : 240,
			resMult : 2,
			
			fscr : // Fullscreen
			{
				act : false,
				name : "config_vid_fscr_name"
			},
			
			vsync : // Vsync
			{
				act : false,
				name : "config_vid_vsync_name"
			},
			
			showVer : // Show Version
			{
				act : true,
				name : "config_vid_showVer_name"
			},
			
			showCsr : // Show Cursor
			{
				act : true,
				name : "config_vid_showCsr_name"
			},
			
			showFps : // Show FPS
			{
				act : false,
				name : "config_vid_showFps_name"
			},
			
			showBdr : // Show Border
			{
				act : true,
				name : "config_vid_showBdr_name"
			},
		},
		
		// Music & Sounds
		aud :
		{
			emtr : [-1]
		},
		
		// Accessibility
		access :
		{
			rdcdMot : false
		},	
	}
	
		// File [#0] (Creates the file directory if needed; Loads a previously selected language if there's already a file)
	global.config.file_name = string(global.config.ver) + "/config.ini";
	global.config.file_msg = choose("There's an in-game options menu. I think you'll like it.", "Is this Notepad World?", "Are you by any chance on Linux?", "Looking for super-secret settings?");
	if (directory_exists(global.config.ver) == false)
		directory_create(global.config.ver);
	else if (file_exists(global.config.file_name) == true)
	{
		ini_open(global.config.file_name);
		global.config.lang_curr = ini_read_real("lang", "curr", CONFIG_LANG.enUS);
		ini_close();
	}
	
		// Languages
	global.config.lang_data = load_csv("config_lang_data.csv");
	enum CONFIG_LANG
	{
		enUS,
		ptBR
	}
	fn_config_lang_add(CONFIG_LANG.enUS, "enUS");
	fn_config_lang_add(CONFIG_LANG.ptBR, "ptBR");
	
		// Keybinds
	enum CONFIG_KEY
	{
		LT,		// Left
		RT,		// Right
		UP,		// Up
		DN,		// Down
		CONFIRM,	// Confirm
		CANCEL,	// Cancel
		INV,	// Inventory
		USE,	// Effect/Item
		ATWLK,	// Autowalk
		PSE,	// Pause
		FSCR,	// Fullscreen
	}
	fn_config_key_add(CONFIG_KEY.LT,	"lt",		vk_left, ord("A"));
	fn_config_key_add(CONFIG_KEY.RT,	"rt",		vk_right, ord("D"));
	fn_config_key_add(CONFIG_KEY.UP,	"up",		vk_up, ord("W"));
	fn_config_key_add(CONFIG_KEY.DN,	"dn",		vk_down, ord("S"));
	fn_config_key_add(CONFIG_KEY.CONFIRM,	"confirm",	ord("Z"), vk_enter);
	fn_config_key_add(CONFIG_KEY.CANCEL,	"cancel",	ord("X"), vk_shift);
	fn_config_key_add(CONFIG_KEY.INV,	"inv",		ord("C"), vk_control);
	fn_config_key_add(CONFIG_KEY.USE,	"use",		ord("F"));
	fn_config_key_add(CONFIG_KEY.ATWLK,	"atwlk",	ord("R"));
	fn_config_key_add(CONFIG_KEY.PSE,	"pse",		vk_escape);
	fn_config_key_add(CONFIG_KEY.FSCR,	"fscr",		vk_f4, vk_f11);
	
		// Music & Sounds
	enum CONFIG_AUD_EMTR
	{
		MASTER, // Master
		
		MUS, // Music
		AMB, // Ambience
		
		MENU, // Menu
		PLAYER, // Player
		PROP, // Props
		ACTOR, // Entities
	}
	fn_config_aud_emtr_add(CONFIG_AUD_EMTR.MASTER,	"master");
	fn_config_aud_emtr_add(CONFIG_AUD_EMTR.MUS,		"mus");
	fn_config_aud_emtr_add(CONFIG_AUD_EMTR.AMB,		"amb");
	fn_config_aud_emtr_add(CONFIG_AUD_EMTR.MENU,	"menu");
	fn_config_aud_emtr_add(CONFIG_AUD_EMTR.PLAYER,	"player");
	fn_config_aud_emtr_add(CONFIG_AUD_EMTR.PROP,	"prop");
	fn_config_aud_emtr_add(CONFIG_AUD_EMTR.ACTOR,	"actor");
	
		// File [#1]
	if (file_exists(global.config.file_name) == false)
		fn_config_file_save();
	else
		fn_config_file_load();
}


	// File
function fn_config_file_save()
{
	ini_open(global.config.file_name);
	ini_write_string("README", "msg", global.config.file_msg);
	
	
	// Languages
	ini_write_real("lang", "curr", global.config.lang_curr);
	ini_write_real("lang", "hasChosen", global.config.lang_hasChosen);
	
	// Graphics
	ini_write_real("vid", "fscr_act", global.config.vid.fscr.act);
	ini_write_real("vid", "vsync_act", global.config.vid.vsync.act);
	ini_write_real("vid", "showVer_act", global.config.vid.showVer.act);
	ini_write_real("vid", "showCsr_act", global.config.vid.showCsr.act);
	ini_write_real("vid", "showFps_act", global.config.vid.showFps.act);
	ini_write_real("vid", "showBdr_act", global.config.vid.showBdr.act);
	
	// Music & Sounds
	for (var e = 0; e < array_length(global.config.aud.emtr); e++)
		ini_write_real("aud", $"emtr_{e}_vol", global.config.aud.emtr[e].vol);
	
	// Accessibility
	ini_write_real("access", "rdcdMot", global.config.access.rdcdMot);
	
	
	ini_close();
}
function fn_config_file_load()
{
	ini_open(global.config.file_name);
	
	
	// Languages
	global.config.lang_curr = ini_read_real("lang", "curr", CONFIG_LANG.enUS);
	global.config.lang_hasChosen = ini_read_real("lang", "hasChosen", false);
	
	// Graphics
	global.config.vid.fscr.act = ini_read_real("vid", "fscr_act", false);
	global.config.vid.vsync.act = ini_read_real("vid", "vsync_act", false);
	global.config.vid.showVer.act = ini_read_real("vid", "showVer_act", true);
	global.config.vid.showCsr.act = ini_read_real("vid", "showCsr_act", true);
	global.config.vid.showFps.act = ini_read_real("vid", "showFps_act", false);
	global.config.vid.showBdr.act = ini_read_real("vid", "showBdr_act", true);
		
	// Music & Sounds
	for (var e = 0; e < array_length(global.config.aud.emtr); e++)
		global.config.aud.emtr[e].vol = ini_read_real("aud", $"emtr_{e}_vol", 1);
	
	// Accessibility
	global.config.access.rdcdMot = ini_read_real("access", "rdcdMot", false);
	
	
	ini_close();
}
function fn_config_file_erase()
{
	file_delete(global.config.file_name)
}


	// Languages
function fn_config_lang_add(_idx, _code)
{
	global.config.lang[_idx] =
	{
		name : $"config_lang_{_code}",
		code : _code,
		
		fnt : font_add_sprite_ext(spr_config_lang_fnt_dflt, "aáàâãbcçdeéèêfghiíìîjklmnoóòôõpqrstuúùûvwxyzAÁÀÂÃBCÇ₢DEÉÈÊFGHIÍÌÎJKLMNOÓÒÔÕPQRS$TUÚÙÛVWXYZ' ,.?!:;\"&1234567890%()[]/_-—<>←→↑↓", false, -1)
	}
}
function fn_config_lang_mod(_new)
{
	global.config.lang_curr = _new;
	fn_config_file_save();
}
function textdata(_key)
{
	var _text = global.config.lang_data[# (1 + global.config.lang_curr), ds_grid_value_y(global.config.lang_data, 0, 0, ds_grid_width(global.config.lang_data), ds_grid_height(global.config.lang_data), _key)];
	if (_text != undefined)
		return _text;
	else
	{
		fn_log($"The function lang_data() was called and unable to retrieve the desired text. The provided key was \"{_key}\".");
		return _key;
	}	
}


	// Keybinds
function fn_config_key_add(_idx, _code, _main, _alt = -1)
{
	global.config.key[_idx] =
	{
		name : $"config_key_{_code}",
		code : _code,
		
		main : _main,
		alt : _alt,
	}
}
function fn_config_key_held(_idx)
{
	return (keyboard_check(global.config.key[_idx].main) == true) ? true : keyboard_check(global.config.key[_idx].alt)
}
function fn_config_key_pressed(_idx)
{
	return (keyboard_check_pressed(global.config.key[_idx].main) == true) ? true : keyboard_check_pressed(global.config.key[_idx].alt)
}
function fn_config_key_lazy()
{
	for (var k = 0; k < array_length(global.config.key); k++)
	{
		held[k] = fn_config_key_held(k);
		pressed[k] = fn_config_key_pressed(k);
	}
}


	// Music & Sounds
function fn_config_aud_emtr_add(_idx, _code, _vol = 1, _pitch = 1)
{
	global.config.aud.emtr[_idx] =
	{
		name : $"config_aud_emtr_{_code}",
		code : _code,
		
		id : audio_emitter_create(),
		bus : audio_bus_create(),
		vol : _vol,
		pitch : _pitch
	}
	audio_emitter_bus(global.config.aud.emtr[_idx].id, global.config.aud.emtr[_idx].bus);
}
