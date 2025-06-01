
function fn_txtData_start() // start txtData of the selected lang
{
	global.txtData[SETT_LANG_EN] = -1;
	global.txtData[SETT_LANG_BR] = -1;
	global.txtData_amt = array_length(global.txtData);
	
	
	if (global.sett_lang == SETT_LANG_EN) // English
	{
		fn_txtData_destroy();
		global.txtData[SETT_LANG_EN] = ds_map_create();
		var i = global.txtData[SETT_LANG_EN];
		
		
		ds_map_add(i, "thm_name_dflt", "Default");
		ds_map_add(i, "thm_name_smpl", "Simple");
		ds_map_add(i, "thm_name_madot", "Madotsuki");
		
		ds_map_add(i, "thm_desc_dflt", "The default theme.");
		ds_map_add(i, "thm_desc_smpl", "A simple, yet elegant, theme.");
		ds_map_add(i, "thm_desc_madot", "The Yume Nikki theme.");
		
		
		ds_map_add(i, "menu_inv_main_opt_0", "Effects");
		ds_map_add(i, "menu_inv_main_opt_1", "Items");
		ds_map_add(i, "menu_inv_main_opt_2", "Themes");
		
		ds_map_add(i, "menu_inv_eff_lbl_0", ds_map_find_value(i, "menu_inv_main_opt_0"));
		ds_map_add(i, "menu_inv_itm_lbl_0", ds_map_find_value(i, "menu_inv_main_opt_1"));
		ds_map_add(i, "menu_inv_thm_lbl_0", ds_map_find_value(i, "menu_inv_main_opt_2"));
		
		
		ds_map_add(i, "menu_pse_main_lbl_0", "Game Paused");
		
		ds_map_add(i, "menu_pse_main_opt_0", "Resume");
		ds_map_add(i, "menu_pse_main_opt_1", "Settings");
		ds_map_add(i, "menu_pse_main_opt_2", "Instructions");
		ds_map_add(i, "menu_pse_main_opt_3", "Quit to Menu");
	}
	
	
	else if (global.sett_lang == SETT_LANG_BR) // Brazilian Portuguese
	{
		fn_txtData_destroy();
		global.txtData[SETT_LANG_BR] = ds_map_create();
		var i = global.txtData[SETT_LANG_BR];
		
		ds_map_add(i, "menu_inv_main_opt_0", "Efeitos");
		ds_map_add(i, "menu_inv_main_opt_1", "Itens");
		ds_map_add(i, "menu_inv_main_opt_2", "Temas");
		
		ds_map_add(i, "menu_inv_eff_lbl_0", ds_map_find_value(i, "menu_inv_main_opt_0"));
		ds_map_add(i, "menu_inv_itm_lbl_0", ds_map_find_value(i, "menu_inv_main_opt_1"));
		ds_map_add(i, "menu_inv_thm_lbl_0", ds_map_find_value(i, "menu_inv_main_opt_2"));
		
		ds_map_add(i, "thm_name_dflt", "Padrão");
		ds_map_add(i, "thm_name_smpl", "Simples");
		ds_map_add(i, "thm_name_madot", "Madotsuki");
		
		ds_map_add(i, "thm_desc_dflt", "O tema padrão.");
		ds_map_add(i, "thm_desc_smpl", "Um tema simples, mas elegante.");
		ds_map_add(i, "thm_desc_madot", "O tema do Yume Nikki.");
	}
	
	
	var OVOS = irandom_range(1, 99999999);
	if (OVOS == 1)
		ds_map_set(i, "menu_inv_main_opt_0", "Êggects");
}

function fn_txtData_destroy() // destroys txtData of the previous lang to avoid issues (ex.: if the current lang is set to English, this deletes the PT-Br txtData if it was previously selected and then unselected)
{
	for (var i = 0; i < global.txtData_amt; i++)
	{
		if (i != global.sett_lang && global.txtData[i] != -1)
		{
			ds_map_destroy(global.txtData[i]);
			global.txtData[i] = -1;
		}
	}
}

function fn_txtData(_key) // get txt from the selected lang's txtData
{
	return ds_map_find_value(global.txtData[global.sett_lang], _key);
}








/*
ds_map_add(i, "salenis_0", "Salenis");
ds_map_add(i, "salenis_1", "Salenis 2: A Revolta dos Tubarões");
ds_map_add(i, "salenis_2", "Salenis 3: O Império Contra-Ataca");
ds_map_add(i, "salenis_3", "Salenis 4: O Último Suspiro");
ds_map_add(i, "salenis_4", "Salenis 5: Ressureição");
*/