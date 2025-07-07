
//////// Functions related to the game's text data


function fn_config_lang_textData_setup() // Sets up all the text of the current language
{
	// Destroys the text data of all languages
	for (var m = 0; m < global.config_lang_len; m++)
	{
		if (global.config_lang_textData[m] != -1)
		{
			ds_map_destroy(global.config_lang_textData[m]);
			global.config_lang_textData[m] = -1;
			
			break;
		}
		else
			continue;
	}
	
	
	// Creates the text data of the current language and adds all the text to it
	global.config_lang_textData[global.config_lang] = ds_map_create();
	
	
	// Volumes
	fn_config_lang_textData_addText("volType_name_0", "Master Volume", "Volume Geral");
	fn_config_lang_textData_addText("volType_name_1", "Music", "Música");
	fn_config_lang_textData_addText("volType_name_2", "Menu", "Menu");
	fn_config_lang_textData_addText("volType_name_3", "Player", "Jogador");
	fn_config_lang_textData_addText("volType_name_4", "Objects", "Objetos");
	fn_config_lang_textData_addText("volType_name_5", "Entities", "Entidades");
	fn_config_lang_textData_addText("volType_name_6", "Ambience", "Ambiente");
	
	
	// Loot
		// Effects
	fn_config_lang_textData_addText("eff_name_0", "Salenis 0", "Salenis 0");
	fn_config_lang_textData_addText("eff_name_1", "Salenis 1", "Salenis 1");
	fn_config_lang_textData_addText("eff_name_2", "Salenis 2", "Salenis 2");
	
	fn_config_lang_textData_addText("eff_desc_0", "The Salenis is a world-famous dish.\nIt tastes funny.", "O Salenis é uma comida muito famosa.\nO gosto dele é peculiar.");
	fn_config_lang_textData_addText("eff_desc_1", "The Salenis is a fascinating creation.\nIts smell is pleasing.", "O Salenis é uma criação fascinante.\nO cheiro dele é delicioso.");
	fn_config_lang_textData_addText("eff_desc_2", "The Salenis is a political symbol.\nIts texture is horrifying.", "O Salenis é um símbolo político.\nA textura dele é horrível.");
	
		// Items
	fn_config_lang_textData_addText("itm_name_0", "Axenis", "Machenis");
	
	fn_config_lang_textData_addText("itm_desc_0", "The powerful axe of the world-famous\nwriter Sal de Enis.", "O poderoso machado do Sal de Enis,\num escritor famoso mundialmente.");
	
		// Themes
	fn_config_lang_textData_addText("thm_name_0", "Default", "Padrão");
	fn_config_lang_textData_addText("thm_name_1", "Madotsuki", "Madotsuki");
	//fn_config_lang_textData_addText("thm_name_1", "Simple", "Simples");
	
	fn_config_lang_textData_addText("thm_desc_0", "The default theme.", "O tema padrão.");
	fn_config_lang_textData_addText("thm_desc_1", "The classic theme.", "O tema clássico.");
	//fn_config_lang_textData_addText("thm_desc_1", "A simple, yet elegant, theme.", "Um tema simples, mas elegante.");
	
	
	// Main menu
	fn_config_lang_textData_addText("menu_home_lang_info_0", "Language", "Idioma");
	
	fn_config_lang_textData_addText("menu_home_main_opt_0", "Start", "Jogar");
	fn_config_lang_textData_addText("menu_home_main_opt_1", "Options", "Opções");
	fn_config_lang_textData_addText("menu_home_main_opt_2", "Exit", "Sair");
	
	
	// Settings menu
	fn_config_lang_textData_dupeText("menu_config_main_ttl", "menu_home_main_opt_1");
	fn_config_lang_textData_addText("menu_config_main_opt_0", "Language", "Idioma");
	fn_config_lang_textData_addText("menu_config_main_opt_1", "Graphics", "Gráficos");
	fn_config_lang_textData_addText("menu_config_main_opt_2", "Music & Sounds", "Músicas e Sons");
	fn_config_lang_textData_addText("menu_config_main_opt_3", "Accessibility", "Acessibilidade");
	
		// Graphics
	fn_config_lang_textData_dupeText("menu_config_gfx_ttl", "menu_config_main_opt_1");
	fn_config_lang_textData_addText("menu_config_gfx_opt_0", "Fullscreen", "Tela Cheia");
	fn_config_lang_textData_addText("menu_config_gfx_opt_1", "Low Graphics", "Gráficos Baixos");
	fn_config_lang_textData_addText("menu_config_gfx_opt_2", "Show FPS", "Mostrar FPS");
	fn_config_lang_textData_addText("menu_config_gfx_opt_3", "Show Border", "Mostrar Borda");
	fn_config_lang_textData_addText("menu_config_gfx_opt_4", "Show Version", "Mostrar Versão");
	
		// Music & Sounds
	fn_config_lang_textData_dupeText("menu_config_aud_ttl", "menu_config_main_opt_2");
	for (var v = 0; v < global.config_volType_len; v++)
		fn_config_lang_textData_dupeText($"menu_config_aud_opt_{v}", $"volType_name_{v}");
	
		// Accessibility
	fn_config_lang_textData_dupeText("menu_config_a11y_ttl", "menu_config_main_opt_3");
	fn_config_lang_textData_addText("menu_config_a11y_opt_0", "Reduced Motion", "Reduzir Movimento");
	
		// All
	fn_config_lang_textData_addText("menu_config_all_opt_config_0", "OFF", "Não");
	fn_config_lang_textData_addText("menu_config_all_opt_config_1", "ON", "Sim");
	
	
	// Inventory menu
	fn_config_lang_textData_addText("menu_inv_main_opt_0", "Effects", "Efeitos");
	if (irandom_range(1, 99999999) == 1)
		fn_config_lang_textData_modText("menu_inv_main_opt_0", "Êggects", "Êgeitos");
	fn_config_lang_textData_addText("menu_inv_main_opt_1", "Items", "Itens");
	fn_config_lang_textData_addText("menu_inv_main_opt_2", "Themes", "Temas");
	
	fn_config_lang_textData_dupeText("menu_inv_eff_ttl", "menu_inv_main_opt_0");
	fn_config_lang_textData_dupeText("menu_inv_itm_ttl", "menu_inv_main_opt_1");
	fn_config_lang_textData_dupeText("menu_inv_thm_ttl", "menu_inv_main_opt_2");
	
	
	// Pause menu
	fn_config_lang_textData_addText("menu_pse_main_ttl", "Game Paused", "Jogo Pausado");
	fn_config_lang_textData_addText("menu_pse_main_opt_0", "Resume", "Continuar");
	fn_config_lang_textData_dupeText("menu_pse_main_opt_1", "menu_home_main_opt_1");
	fn_config_lang_textData_addText("menu_pse_main_opt_2", "Instructions", "Instruções");
	fn_config_lang_textData_addText("menu_pse_main_opt_3", "Quit to Menu", "Voltar ao Menu");
	
	
	// Rooms
	fn_config_lang_textData_addText("rm_menu_home", "Main Menu", "Menu Principal");
	fn_config_lang_textData_addText("rm_nexus", "Nexus", "Nexus");
	fn_config_lang_textData_addText("rm_macaco", "Macacolandia", "Macacolândia");
	fn_config_lang_textData_addText("rm_dbgwrld", "Debug World", "Mundo Debug");
}
function fn_config_lang_textData_addText(_lang_textData_key, _text_enUS = "", _text_ptBR = "")
{
	var _lang = global.config_lang;
	var _lang_textData = global.config_lang_textData[_lang];
	ds_map_add(_lang_textData, _lang_textData_key, argument[1 + _lang]);
	
	_text_enUS = "Por favor GameMaker tira essa mensagem de erro inútil do meu código";
	_text_ptBR = _text_enUS;
	
}
function fn_config_lang_textData_modText(_lang_textData_key, _text_enUS = "", _text_ptBR = "")
{
	var _lang = global.config_lang;
	var _lang_textData = global.config_lang_textData[_lang];
	ds_map_replace(_lang_textData, _lang_textData_key, argument[1 + _lang]);
}
function fn_config_lang_textData_dupeText(_lang_textData_key, _lang_textData_keySrc)
{
	var _lang = global.config_lang;
	var _lang_textData = global.config_lang_textData[_lang];
	
	var _text = ds_map_find_value(_lang_textData, _lang_textData_keySrc);
	
	ds_map_add(_lang_textData, _lang_textData_key, _text);
}


function fn_getText(_lang_textData_key) // Retrieves the specified entry from the current language's text data
{
	var _text = ds_map_find_value(global.config_lang_textData[global.config_lang], _lang_textData_key);
	if (_text == undefined)
		fn_log($"The function fn_getText() was called and unable to retrieve the desired text. The provided key was \"{_lang_textData_key}\".");
	
	return _text;
}




/*
// Keybinds
		ds_map_add(t, "config_key_name_0", "Go Left");
		ds_map_add(t, "config_key_name_1", "Go Right");
		ds_map_add(t, "config_key_name_2", "Go Up");
		ds_map_add(t, "config_key_name_3", "Go Down");
		
		ds_map_add(t, "config_key_name_4", "Select");
		ds_map_add(t, "config_key_name_5", "Cancel");
		
		ds_map_add(t, "config_key_name_6", "Open Inventory");
		ds_map_add(t, "config_key_name_7", "Pause Game");
		
		ds_map_add(t, "config_key_name_8", "Toggle Autowalk");
		ds_map_add(t, "config_key_name_9", "Toggle Fullscreen");

	// Languages (unused)
		ds_map_add(t, "menu_config_lang_ttl", ds_map_find_value(t, "menu_config_main_opt_0"));
		
			// Keybinds (unused)
		ds_map_add(t, "menu_config_key_ttl", ds_map_find_value(t, "menu_config_main_opt_1"));
*/