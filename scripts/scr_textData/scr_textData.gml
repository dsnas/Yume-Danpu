
//////// Functions related to the game's text data


function fn_textData_setup()
{
	global.textData_map[LANG_IDX.EN_US] = -1;
	global.textData_map[LANG_IDX.PT_BR] = -1;
	global.textData_mapAmt = array_length(global.textData_map);
	
	
	if (global.sett_lang == LANG_IDX.EN_US) // American English
	{
		fn_textData_kill();
		global.textData_map[LANG_IDX.EN_US] = ds_map_create();
		var i = global.textData_map[LANG_IDX.EN_US];
		
		
		// Menu themes
		ds_map_add(i, "thm_name_dflt", "Default");
		ds_map_add(i, "thm_name_smpl", "Simple");
		ds_map_add(i, "thm_name_madot", "Madotsuki");
		
		ds_map_add(i, "thm_desc_dflt", "The default theme.");
		ds_map_add(i, "thm_desc_smpl", "A simple, yet elegant, theme.");
		ds_map_add(i, "thm_desc_madot", "The Yume Nikki theme.");
		
		
		// Main menu
		ds_map_add(i, "menu_home_lang_lbl_0", "Language");
		
		ds_map_add(i, "menu_home_main_opt_0", "Start");
		ds_map_add(i, "menu_home_main_opt_1", "Options");
		ds_map_add(i, "menu_home_main_opt_2", "Exit");
		
		
		// Settings menu
		ds_map_add(i, "menu_sett_main_ttl", "Options");
		ds_map_add(i, "menu_sett_main_opt_0", "Languages");
		ds_map_add(i, "menu_sett_main_opt_1", "Video Settings");
		ds_map_add(i, "menu_sett_main_opt_2", "Audio Settings");
		ds_map_add(i, "menu_sett_main_opt_3", "Controls");
		ds_map_add(i, "menu_sett_main_opt_4", "Accessibility");
		
		ds_map_add(i, "menu_sett_lang_info", ds_map_find_value(i, "menu_sett_main_opt_0"));
		ds_map_add(i, "menu_sett_lang_opt_0", global.sett_lang_name[LANG_IDX.EN_US]);
		ds_map_add(i, "menu_sett_lang_opt_1", global.sett_lang_name[LANG_IDX.PT_BR]);
		
		ds_map_add(i, "menu_sett_vid_ttl", ds_map_find_value(i, "menu_sett_main_opt_1"));
		ds_map_add(i, "menu_sett_vid_opt_0", "Fullscreen");
		ds_map_add(i, "menu_sett_vid_opt_1", "Low Graphics");
		ds_map_add(i, "menu_sett_vid_opt_2", "Show FPS");
		ds_map_add(i, "menu_sett_vid_opt_3", "Show Border");
		
		ds_map_add(i, "menu_sett_main_lbl_0", "No");
		ds_map_add(i, "menu_sett_main_lbl_1", "Yes");
		
		
		// Inventory menu
		ds_map_add(i, "menu_inv_main_opt_0", "Effects");
		ds_map_add(i, "menu_inv_main_opt_1", "Items");
		ds_map_add(i, "menu_inv_main_opt_2", "Themes");
		ds_map_add(i, "menu_inv_eff_ttl", ds_map_find_value(i, "menu_inv_main_opt_0"));
		ds_map_add(i, "menu_inv_itm_ttl", ds_map_find_value(i, "menu_inv_main_opt_1"));
		ds_map_add(i, "menu_inv_thm_ttl", ds_map_find_value(i, "menu_inv_main_opt_2"));
		
		
		// Pause menu
		ds_map_add(i, "menu_pse_main_ttl", "Game Paused");
		ds_map_add(i, "menu_pse_main_opt_0", "Resume");
		ds_map_add(i, "menu_pse_main_opt_1", "Settings");
		ds_map_add(i, "menu_pse_main_opt_2", "Instructions");
		ds_map_add(i, "menu_pse_main_opt_3", "Quit to Menu");
	}
	
	else if (global.sett_lang == LANG_IDX.PT_BR) // Brazilian Portuguese
	{
		fn_textData_kill();
		global.textData_map[LANG_IDX.PT_BR] = ds_map_create();
		var i = global.textData_map[LANG_IDX.PT_BR];
		
		
		// Main menu
		ds_map_add(i, "menu_home_lang_lbl_0", "Idioma");
		
		ds_map_add(i, "menu_home_main_opt_0", "Jogar");
		ds_map_add(i, "menu_home_main_opt_1", "Opções");
		ds_map_add(i, "menu_home_main_opt_2", "Sair");
	}
	
	
	
	
	var OVOS = irandom_range(1, 99999999);
	if (OVOS == 1)
		ds_map_set(i, "menu_inv_main_opt_0", "Êggects");
}
function fn_textData_kill() // Destroys text data map of all languages but the one the player selected
{
	for (var i = 0; i < global.textData_mapAmt; i++)
	{
		if (i != global.sett_lang && global.textData_map[i] != -1)
		{
			ds_map_destroy(global.textData_map[i]);
			global.textData_map[i] = -1;
		}
	}
}
function fn_textData(_key) // Fetches text from the current language's text data map
{
	var _text = ds_map_find_value(global.textData_map[global.sett_lang], _key);
	
	if (_text == undefined)
		fn_dbg_log("The function fn_textData() was called and unable to retrieve the desired text");
	
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