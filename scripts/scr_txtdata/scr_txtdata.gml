
function fn_txtdata_start() // start txtdata of the selected lang
{
	global.txtdata[SETT_LANG.EN] = -1;
	global.txtdata[SETT_LANG.BR] = -1;
	global.txtdata_amt = array_length(global.txtdata);
	
	
	if (global.sett_lang == SETT_LANG.EN) // English
	{
		fn_txtdata_destroy();
		global.txtdata[SETT_LANG.EN] = ds_map_create();
		var i = global.txtdata[SETT_LANG.EN];
		
		
		ds_map_add(i, "thm_name_dflt", "Default");
		ds_map_add(i, "thm_name_smpl", "Simple");
		ds_map_add(i, "thm_name_madot", "Madotsuki");
		
		ds_map_add(i, "thm_desc_dflt", "The default theme.");
		ds_map_add(i, "thm_desc_smpl", "A simple, yet elegant, theme.");
		ds_map_add(i, "thm_desc_madot", "The Yume Nikki theme.");
		
		
		ds_map_add(i, "menu_home_lang_lbl_0", "Language");
		
		ds_map_add(i, "menu_home_main_opt_0", "Start");
		ds_map_add(i, "menu_home_main_opt_1", "Options");
		ds_map_add(i, "menu_home_main_opt_2", "Exit");
		
		
		ds_map_add(i, "menu_inv_main_opt_0", "Effects");
		ds_map_add(i, "menu_inv_main_opt_1", "Items");
		ds_map_add(i, "menu_inv_main_opt_2", "Themes");
		ds_map_add(i, "menu_inv_eff_ttl", ds_map_find_value(i, "menu_inv_main_opt_0"));
		ds_map_add(i, "menu_inv_itm_ttl", ds_map_find_value(i, "menu_inv_main_opt_1"));
		ds_map_add(i, "menu_inv_thm_ttl", ds_map_find_value(i, "menu_inv_main_opt_2"));
		
		
		ds_map_add(i, "menu_pse_main_ttl", "Game Paused");
		ds_map_add(i, "menu_pse_main_opt_0", "Resume");
		ds_map_add(i, "menu_pse_main_opt_1", "Settings");
		ds_map_add(i, "menu_pse_main_opt_2", "Instructions");
		ds_map_add(i, "menu_pse_main_opt_3", "Quit to Menu");
	}
	
	else if (global.sett_lang == SETT_LANG.BR) // Brazilian Portuguese
	{
		fn_txtdata_destroy();
		global.txtdata[SETT_LANG.BR] = ds_map_create();
		var i = global.txtdata[SETT_LANG.BR];
		
		
		ds_map_add(i, "thm_name_dflt", "Padrão");
		ds_map_add(i, "thm_name_smpl", "Simples");
		ds_map_add(i, "thm_name_madot", "Madotsuki");
		ds_map_add(i, "thm_desc_dflt", "O tema padrão.");
		ds_map_add(i, "thm_desc_smpl", "Um tema simples, mas elegante.");
		ds_map_add(i, "thm_desc_madot", "O tema do Yume Nikki.");
		
		
		ds_map_add(i, "menu_main_lang_lbl_0", "Idioma");
		
		
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
	}
	
	
	var OVOS = irandom_range(1, 99999999);
	if (OVOS == 1)
		ds_map_set(i, "menu_inv_main_opt_0", "Êggects");
}

function fn_txtdata_destroy() // destroys txtdata of the previous lang to avoid issues (ex.: if the current lang is set to English, this deletes the PT-Br txtdata if it was previously selected and then unselected)
{
	for (var i = 0; i < global.txtdata_amt; i++)
	{
		if (i != global.sett_lang && global.txtdata[i] != -1)
		{
			ds_map_destroy(global.txtdata[i]);
			global.txtdata[i] = -1;
		}
	}
}

function fn_txtdata(_key) // get txt from the selected lang's txtdata
{
	return ds_map_find_value(global.txtdata[global.sett_lang], _key);
}








/*
ds_map_add(i, "salenis_0", "Salenis");
ds_map_add(i, "salenis_1", "Salenis 2: A Revolta dos Tubarões");
ds_map_add(i, "salenis_2", "Salenis 3: O Império Contra-Ataca");
ds_map_add(i, "salenis_3", "Salenis 4: O Último Suspiro");
ds_map_add(i, "salenis_4", "Salenis 5: Ressureição");
*/