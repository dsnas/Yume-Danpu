
//////// Functions related to languages


function fn_config_lang_setup()
{
	enum CONFIG_LANG
	{
		EN_US,	// English (United States)
		PT_BR	// Português (Brasil)
	}
	fn_config_lang_add(CONFIG_LANG.EN_US, "English (US)");
	fn_config_lang_add(CONFIG_LANG.PT_BR, "Português (BR)");
	
	
	global.config_langCurr = CONFIG_LANG.EN_US; // Current language
	global.config_lang_hasChosen = false; // Determines if the player has selected a language on game start
	
	// Save/Load the current language
	global.config_lang_file =
	{
		name : "config_lang.ini",
		msg : "Oh. Oh my God. What is this? Is this Notepad World? Oooh, spooky!"
	}
	
	if (file_exists(global.config_lang_file.name) == false)
		fn_config_lang_file_save();
	else
		fn_config_lang_file_load();
}
function fn_config_lang_add(_lang, _name)
{
	global.config_lang[_lang] =
	{
		name : _name,
		data : -1
	}
	global.config_lang_len = array_length(global.config_lang);
}
function fn_config_lang_mod(_langNew)
{
	global.config_langCurr = _langNew;
	fn_config_lang_file_save();
	fn_config_lang_data_setup();
	fn_config_setup();
	
	fn_player_setup(global.player.file_curr);
}


function fn_config_lang_file_save()
{
	ini_open(global.config_lang_file.name);
	ini_write_real("game", "ver", global.game.ver);
	ini_write_string("game", "msg", global.config_lang_file.msg);
	
	ini_write_real("lang", "curr", global.config_langCurr);
	ini_write_real("lang", "hasChosen", global.config_lang_hasChosen);
	
	ini_close();
}
function fn_config_lang_file_load()
{
	ini_open(global.config_lang_file.name);
	
	if (ini_read_real("game", "ver", 0) == global.game.ver)
	{
		global.config_langCurr = ini_read_real("lang", "curr", CONFIG_LANG.EN_US);
		global.config_lang_hasChosen = ini_read_real("lang", "hasChosen", false);
		
		ini_close();
	}
	else
	{
		ini_close();
		
		fn_config_lang_file_erase();
		fn_config_lang_file_save();
	}
}
function fn_config_lang_file_erase()
{
	if (file_exists(global.config_lang_file.name) == true)
		file_delete(global.config_lang_file.name);
}


// Functions related to the languages' text
function fn_config_lang_data_setup()
{
	for (var l = 0; l < global.config_lang_len; l++) // Loops through each language and destroys their data if there is one
	{
		if (global.config_lang[l].data != -1)
		{
			ds_map_destroy(global.config_lang[l].data);
			global.config_lang[l].data = -1;
			
			break;
		}
		else
			continue;
	}
	
	global.config_lang[global.config_langCurr].data = ds_map_create(); // Creates the data map of the current language
	
	
	// Keybinds
	fn_config_lang_data_addText("config_key_name_0", "Go Left");
	fn_config_lang_data_addText("config_key_name_1", "Go Right");
	fn_config_lang_data_addText("config_key_name_2", "Go Up");
	fn_config_lang_data_addText("config_key_name_3", "Go Down");
		
	fn_config_lang_data_addText("config_key_name_4", "Select");
	fn_config_lang_data_addText("config_key_name_5", "Cancel");
		
	fn_config_lang_data_addText("config_key_name_6", "Open Inventory");
	fn_config_lang_data_addText("config_key_name_7", "Pause Game");
		
	fn_config_lang_data_addText("config_key_name_8", "Toggle Autowalk");
	fn_config_lang_data_addText("config_key_name_9", "Toggle Fullscreen");
	
	
	// Volumes
	fn_config_lang_data_addText("config_aud_style_name_0", "Master Volume", "Volume Geral");
	fn_config_lang_data_addText("config_aud_style_name_1", "Music", "Música");
	fn_config_lang_data_addText("config_aud_style_name_2", "Menu", "Menu");
	fn_config_lang_data_addText("config_aud_style_name_3", "Player", "Jogador");
	fn_config_lang_data_addText("config_aud_style_name_4", "Objects", "Objetos");
	fn_config_lang_data_addText("config_aud_style_name_5", "Entities", "Entidades");
	fn_config_lang_data_addText("config_aud_style_name_6", "Ambience", "Ambiente");
	
	
	// Effects
	fn_config_lang_data_addText("player_eff_name_0", "Salenis 0", "Salenis 0");
	fn_config_lang_data_addText("player_eff_name_1", "Salenis 1", "Salenis 1");
	fn_config_lang_data_addText("player_eff_name_2", "Salenis 2", "Salenis 2");
	
	fn_config_lang_data_addText("player_eff_desc_0", "The Salenis is a world-famous dish.\nIt tastes funny.", "O Salenis é uma comida muito famosa.\nO gosto dele é peculiar.");
	fn_config_lang_data_addText("player_eff_desc_1", "The Salenis is a fascinating creation.\nIts smell is pleasing.", "O Salenis é uma criação fascinante.\nO cheiro dele é delicioso.");
	fn_config_lang_data_addText("player_eff_desc_2", "The Salenis is a political symbol.\nIts texture is horrifying.", "O Salenis é um símbolo político.\nA textura dele é horrível.");
	
	// Items
	fn_config_lang_data_addText("player_itm_name_0", "Kart", "Kart");
	fn_config_lang_data_addText("player_itm_desc_0", "...?", "...?");
	
	// Themes
	fn_config_lang_data_addText("player_thm_name_0", "Default", "Padrão");
	fn_config_lang_data_addText("player_thm_name_1", "Simple", "Simples");
	fn_config_lang_data_addText("player_thm_name_2", "Madotsuki", "Madotsuki");
	
	fn_config_lang_data_addText("player_thm_desc_0", "The default theme.", "O tema padrão.");
	fn_config_lang_data_addText("player_thm_desc_1", "A simple, yet elegant, theme.", "Um tema simples, mas elegante.");
	fn_config_lang_data_addText("player_thm_desc_2", "The classic theme.", "O tema clássico.");
	
	
	// Main menu
	fn_config_lang_data_addText("menu_home_lang_info_0", "Language", "Idioma");
	
	fn_config_lang_data_addText("menu_home_main_opt_0", "Start", "Jogar");
	fn_config_lang_data_addText("menu_home_main_opt_1", "Options", "Opções");
	fn_config_lang_data_addText("menu_home_main_opt_2", "Exit", "Sair");
	
	
	// Options menu
	fn_config_lang_data_dupeText("menu_config_main_ttl", "menu_home_main_opt_1");
	fn_config_lang_data_addText("menu_config_main_opt_0", "Language", "Idioma");
	fn_config_lang_data_addText("menu_config_main_opt_1", "Graphics", "Gráficos");
	fn_config_lang_data_addText("menu_config_main_opt_2", "Music & Sounds", "Músicas e Sons");
	fn_config_lang_data_addText("menu_config_main_opt_3", "Accessibility", "Acessibilidade");
	
		// Graphics
	fn_config_lang_data_dupeText("menu_config_gfx_ttl", "menu_config_main_opt_1");
	fn_config_lang_data_addText("menu_config_gfx_opt_0", "Fullscreen", "Tela Cheia");
	fn_config_lang_data_addText("menu_config_gfx_opt_1", "Low Graphics", "Gráficos Baixos");
	fn_config_lang_data_addText("menu_config_gfx_opt_2", "Hide Cursor", "Esconder Cursor");
	fn_config_lang_data_addText("menu_config_gfx_opt_3", "Show FPS", "Mostrar FPS");
	fn_config_lang_data_addText("menu_config_gfx_opt_4", "Show Border", "Mostrar Borda");
	fn_config_lang_data_addText("menu_config_gfx_opt_5", "Show Version", "Mostrar Versão");
	
		// Music & Sounds
	fn_config_lang_data_dupeText("menu_config_aud_ttl", "menu_config_main_opt_2");
	fn_config_lang_data_dupeText("menu_config_aud_opt_0", "config_aud_style_name_0");
	fn_config_lang_data_dupeText("menu_config_aud_opt_1", "config_aud_style_name_1");
	fn_config_lang_data_dupeText("menu_config_aud_opt_2", "config_aud_style_name_2");
	fn_config_lang_data_dupeText("menu_config_aud_opt_3", "config_aud_style_name_3");
	fn_config_lang_data_dupeText("menu_config_aud_opt_4", "config_aud_style_name_4");
	fn_config_lang_data_dupeText("menu_config_aud_opt_5", "config_aud_style_name_5");
	fn_config_lang_data_dupeText("menu_config_aud_opt_6", "config_aud_style_name_6");
	
		// Accessibility
	fn_config_lang_data_dupeText("menu_config_a11y_ttl", "menu_config_main_opt_3");
	fn_config_lang_data_addText("menu_config_a11y_opt_0", "Reduced Motion", "Reduzir Movimento");
	
		// All
	fn_config_lang_data_addText("menu_config_all_opt_config_0", "OFF", "Não");
	fn_config_lang_data_addText("menu_config_all_opt_config_1", "ON", "Sim");
	
	
	// Inventory menu
	fn_config_lang_data_addText("menu_inv_main_opt_0", "Effects", "Efeitos");
	if (irandom_range(1, 99999999) == 1)
		fn_config_lang_data_modText("menu_inv_main_opt_0", "Êggects", "Êgeitos");
	fn_config_lang_data_addText("menu_inv_main_opt_1", "Items", "Itens");
	fn_config_lang_data_addText("menu_inv_main_opt_2", "Themes", "Temas");
	
	fn_config_lang_data_dupeText("menu_inv_eff_ttl", "menu_inv_main_opt_0");
	fn_config_lang_data_dupeText("menu_inv_itm_ttl", "menu_inv_main_opt_1");
	fn_config_lang_data_dupeText("menu_inv_thm_ttl", "menu_inv_main_opt_2");
	
	
	// Pause menu
	fn_config_lang_data_addText("menu_pse_main_ttl", "Game Paused", "Jogo Pausado");
	fn_config_lang_data_addText("menu_pse_main_opt_0", "Resume", "Continuar");
	fn_config_lang_data_dupeText("menu_pse_main_opt_1", "menu_home_main_opt_1");
	fn_config_lang_data_addText("menu_pse_main_opt_2", "Instructions", "Instruções");
	fn_config_lang_data_addText("menu_pse_main_opt_3", "Quit to Menu", "Voltar ao Menu");
	
	
	// Rooms
	fn_config_lang_data_addText("rm_menu_home", "Main Menu", "Menu Principal");
	fn_config_lang_data_addText("rm_nexus", "Nexus", "Nexus");
	fn_config_lang_data_addText("rm_macaco", "Macacolandia", "Macacolândia");
	fn_config_lang_data_addText("rm_dbgwrld", "Debug World", "Mundo Debug");
}
function fn_config_lang_data_addText(_data_key, _text_0 = "", _text_1 = "")
{
	var _curr = global.config_langCurr;
	var _data = global.config_lang[_curr].data;
	
	ds_map_add(_data, _data_key, argument[1 + _curr]);
	_text_0 = "PLEASE STOP IT ELAVE ME ANONE";
	_text_1 = "SSSSSAAAAAAAAAAAAA AAAAAAAAAAAAAAAAAAAAAAAAAA";
}
function fn_config_lang_data_modText(_data_key, _text_0 = "", _text_1 = "")
{
	var _curr = global.config_langCurr;
	var _data = global.config_lang[_curr].data;
	
	ds_map_replace(_data, _data_key, argument[1 + _curr]);
	_text_0 = "SECONDS. MINUTES. HOURS. DAYS. WEEKS. MONTHS. YEARS.";
	_text_1 = "YOU'RE SLOWLY LOSING YOUR LIFE.";
}
function fn_config_lang_data_dupeText(_data_key, _data_keySrc)
{
	var _curr = global.config_langCurr;
	var _data = global.config_lang[_curr].data;
	
	var _text = ds_map_find_value(_data, _data_keySrc);
	ds_map_add(_data, _data_key, _text);
}
function fn_config_lang_data_getText(_data_key) 
{
	var _text = ds_map_find_value(global.config_lang[global.config_langCurr].data, _data_key);
	if (_text == undefined)
		fn_log($"The function fn_config_lang_data_getText() was called and unable to retrieve the desired text. The provided key was \"{_data_key}\".");
	return _text;
}
