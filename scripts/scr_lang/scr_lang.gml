
//////// Functions related to the game's languages


function fn_lang_setup() // Sets up the available languages without loading their text data
{
	fn_lang_add(0, "");
	
	enum LANG_IDX // Index of each available language
	{
		EN_US = 0,	// English (United States)
		PT_BR = 1	// Português (Brasil)
	}
	fn_lang_add(LANG_IDX.EN_US, "English (United States)");
	fn_lang_add(LANG_IDX.PT_BR, "Português (Brasil)");
	
	global.lang_idx = LANG_IDX.EN_US;					// The current language
	global.lang_amt = array_length(global.lang_name);	// Total amount of available languages
	
	fn_lang_textData_setup();
}
function fn_lang_add(_lang_idx, _lang_name)
{
	var i = _lang_idx;
	
	global.lang_name[i] = _lang_name;
	global.lang_textData[i] = -1;
}


function fn_lang_textData_setup() // Destroys the text data of the previous language, and creates one of the current language, adding all the text to it
{
	// Destroys the text data of the previous language
	for (var m = 0; m < global.lang_amt; m++)
	{
		if (global.lang_textData[m] != -1)
		{
			ds_map_destroy(global.lang_textData[m]);
			global.lang_textData[m] = -1;
			
			break;
		}
		else
			continue;
	}
	
	
	// Creates the text data of the current language and adds all the text to it
	var i = global.lang_idx;
	global.lang_textData[i] = ds_map_create();
	var t = global.lang_textData[i];
	
	if (i == LANG_IDX.EN_US)		// English (United States)
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
		ds_map_add(t, "menu_sett_main_ttl", "Options");
		ds_map_add(t, "menu_sett_main_opt_0", "Languages");
		ds_map_add(t, "menu_sett_main_opt_1", "Video Settings");
		ds_map_add(t, "menu_sett_main_opt_2", "Audio Settings");
		ds_map_add(t, "menu_sett_main_opt_3", "Controls");
		ds_map_add(t, "menu_sett_main_opt_4", "Accessibility");
		
		ds_map_add(t, "menu_sett_lang_info", ds_map_find_value(t, "menu_sett_main_opt_0"));
		
		ds_map_add(t, "menu_sett_vid_ttl", ds_map_find_value(t, "menu_sett_main_opt_1"));
		ds_map_add(t, "menu_sett_vid_opt_0", "Fullscreen");
		ds_map_add(t, "menu_sett_vid_opt_1", "Low Graphics");
		ds_map_add(t, "menu_sett_vid_opt_2", "Show FPS");
		ds_map_add(t, "menu_sett_vid_opt_3", "Show Border");
		
		ds_map_add(t, "menu_sett_main_info_0", "No");
		ds_map_add(t, "menu_sett_main_info_1", "Yes");
		
		
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
		ds_map_add(t, "rm_macaco", "Macacolandia");
	}
	else if (i == LANG_IDX.PT_BR)	// Português (Brasil)
	{
		// Main menu
		ds_map_add(t, "menu_home_lang_info_0", "Idioma");
		
		ds_map_add(t, "menu_home_main_opt_0", "Jogar");
		ds_map_add(t, "menu_home_main_opt_1", "Opções");
		ds_map_add(t, "menu_home_main_opt_2", "Sair");
		
		
		// Rooms
		ds_map_add(t, "rm_macaco", "Macacolândia");
	}
}
function fn_lang_textData(_textData_key)
{
	var _text = ds_map_find_value(global.lang_textData[global.lang_idx], _textData_key);
	if (_text == undefined)
		fn_log("The function fn_lang_textData() was called and unable to retrieve the desired text");
	
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
