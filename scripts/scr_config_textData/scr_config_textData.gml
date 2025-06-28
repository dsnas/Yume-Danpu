
//////// Functions related to the game's text data


function fn_config_lang_textData_setup() // Sets up all the text of the current language
{
	// Destroys the text data of the previous language
	for (var m = 0; m < global.config_lang_amt; m++)
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
	var i = global.config_lang;
	global.config_lang_textData[i] = ds_map_create();
	var t = global.config_lang_textData[i];
	
	if (i == CONFIG_LANG.EN_US) // English (United States)
	{
		// Menu themes
		ds_map_add(t, "thm_name_dflt", "Default");
		ds_map_add(t, "thm_name_smpl", "Simple");
		ds_map_add(t, "thm_name_madot", "Madotsuki");
		
		ds_map_add(t, "thm_desc_dflt", "The default theme.");
		ds_map_add(t, "thm_desc_smpl", "A simple, yet elegant, theme.");
		ds_map_add(t, "thm_desc_madot", "The Yume Nikki theme.");
		
		
		// Main menu
		ds_map_add(t, "menu_home_lang_info_0", "Language");
		
		ds_map_add(t, "menu_home_main_opt_0", "Start");
		ds_map_add(t, "menu_home_main_opt_1", "Options");
		ds_map_add(t, "menu_home_main_opt_2", "Exit");
		
		
		// Settings menu
		ds_map_add(t, "menu_config_main_ttl", ds_map_find_value(t, "menu_home_main_opt_1"));
		ds_map_add(t, "menu_config_main_opt_0", "Language");
		ds_map_add(t, "menu_config_main_opt_1", "Controls");
		ds_map_add(t, "menu_config_main_opt_2", "Video Settings");
		ds_map_add(t, "menu_config_main_opt_3", "Audio Settings");
		ds_map_add(t, "menu_config_main_opt_4", "Accessibility");
		
		ds_map_add(t, "menu_config_lang_info", ds_map_find_value(t, "menu_config_main_opt_0"));
		
		ds_map_add(t, "menu_config_vid_ttl", ds_map_find_value(t, "menu_config_main_opt_1"));
		ds_map_add(t, "menu_config_vid_opt_0", "Fullscreen");
		ds_map_add(t, "menu_config_vid_opt_1", "Low Graphics");
		ds_map_add(t, "menu_config_vid_opt_2", "Show FPS");
		ds_map_add(t, "menu_config_vid_opt_3", "Show Border");
		
		ds_map_add(t, "menu_config_main_opt_config_0", "No");
		ds_map_add(t, "menu_config_main_opt_config_1", "Yes");
		
		
		// Inventory menu
		ds_map_add(t, "menu_inv_main_opt_0", "Effects");
		ds_map_add(t, "menu_inv_main_opt_1", "Items");
		ds_map_add(t, "menu_inv_main_opt_2", "Themes");
		ds_map_add(t, "menu_inv_eff_ttl", ds_map_find_value(t, "menu_inv_main_opt_0"));
		ds_map_add(t, "menu_inv_itm_ttl", ds_map_find_value(t, "menu_inv_main_opt_1"));
		ds_map_add(t, "menu_inv_thm_ttl", ds_map_find_value(t, "menu_inv_main_opt_2"));
		
		
		// Pause menu
		ds_map_add(t, "menu_pse_main_ttl", "Game Paused");
		ds_map_add(t, "menu_pse_main_opt_0", "Resume");
		ds_map_add(t, "menu_pse_main_opt_1", "Settings");
		ds_map_add(t, "menu_pse_main_opt_2", "Instructions");
		ds_map_add(t, "menu_pse_main_opt_3", "Quit to Menu");
		
		
		// Rooms
		ds_map_add(t, "rm_nexus", "Nexus");
		ds_map_add(t, "rm_macaco", "Macacolandia");
	}
	else if (i == CONFIG_LANG.PT_BR) // Português (Brasil)
	{
		// Main menu
		ds_map_add(t, "menu_home_lang_info_0", "Idioma");
		
		ds_map_add(t, "menu_home_main_opt_0", "Jogar");
		ds_map_add(t, "menu_home_main_opt_1", "Opções");
		ds_map_add(t, "menu_home_main_opt_2", "Sair");
		
		
		// Rooms
		ds_map_add(t, "rm_nexus", "Nexus");
		ds_map_add(t, "rm_macaco", "Macacolândia");
	}
}

function fn_getText(_textData_key) // Retrieves the specified entry from the current language's text data
{
	var _text = ds_map_find_value(global.config_lang_textData[global.config_lang], _textData_key);
	if (_text == undefined)
		fn_log("The function fn_getText() was called and unable to retrieve the desired text");
	
	return _text;
}




/*
ds_map_add(i, "thm_name_dflt", "Padrão");
ds_map_add(i, "thm_name_smpl", "Simples");
ds_map_add(i, "thm_name_madot", "Madotsuki");
		
ds_map_add(i, "thm_desc_dflt", "O tema padrão.");
ds_map_add(i, "thm_desc_smpl", "Um tema simples, mas elegante.");
ds_map_add(i, "thm_desc_madot", "O tema do Yume Nikki.");
		
		
ds_map_add(i, "menu_main_lang_lbl_0", "Idioma");
ds_map_add(i, "menu_home_main_opt_0", "Jogar");
ds_map_add(i, "menu_home_main_opt_1", "Opções");
ds_map_add(i, "menu_home_main_opt_2", "Sair");
		
		
ds_map_add(i, "menu_inv_main_opt_0", "Efeitos");
ds_map_add(i, "menu_inv_main_opt_1", "Itens");
ds_map_add(i, "menu_inv_main_opt_2", "Temas");
ds_map_add(i, "menu_inv_eff_ttl", ds_map_find_value(i, "menu_inv_main_opt_0"));
ds_map_add(i, "menu_inv_itm_ttl", ds_map_find_value(i, "menu_inv_main_opt_1"));
ds_map_add(i, "menu_inv_thm_ttl", ds_map_find_value(i, "menu_inv_main_opt_2"));
		
		
ds_map_add(i, "menu_pse_main_ttl", "Jogo Pausado");
ds_map_add(i, "menu_pse_main_opt_0", "Despausar");
ds_map_add(i, "menu_pse_main_opt_1", "Opções");
ds_map_add(i, "menu_pse_main_opt_2", "Instruções");
ds_map_add(i, "menu_pse_main_opt_3", "Voltar ao Menu");
*/