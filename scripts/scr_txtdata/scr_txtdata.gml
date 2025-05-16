
function fn_txtdata_start() // start txtdata of the selected lang
{
	global.txtdata[SETT_LANG_EN] = -1;
	global.txtdata[SETT_LANG_BR] = -1;
	global.txtdata_amt = array_length(global.txtdata);
	
	
	
	if (global.sett_lang == SETT_LANG_EN) // English
	{
		fn_txtdata_destroy();
		global.txtdata[SETT_LANG_EN] = ds_map_create();
		var i = global.txtdata[SETT_LANG_EN];
		
		ds_map_add(i, "menu_inv_main_0", "Effects");
		ds_map_add(i, "menu_inv_main_1", "Items");
		ds_map_add(i, "menu_inv_main_2", "Themes");
		
		ds_map_add(i, "thm_name_0", "Default");
		ds_map_add(i, "thm_name_1", "Simple");
		ds_map_add(i, "thm_name_2", "Madotsuki");
		
		/*
		ds_map_add(i, "salenis_0", "Salenis");
		ds_map_add(i, "salenis_1", "Salenis 2: A Revolta dos Tubarões");
		ds_map_add(i, "salenis_2", "Salenis 3: O Império Contra-Ataca");
		ds_map_add(i, "salenis_3", "Salenis 4: O Último Suspiro");
		ds_map_add(i, "salenis_4", "Salenis 5: Ressureição");
		*/
	}
	
	
	
	else if (global.sett_lang == SETT_LANG_BR) // Brazilian Portuguese
	{
		fn_txtdata_destroy();
		global.txtdata[SETT_LANG_BR] = ds_map_create();
		var i = global.txtdata[SETT_LANG_BR];
		
		ds_map_add(i, "menu_inv_main_0", "Efeitos");
		ds_map_add(i, "menu_inv_main_1", "Itens");
		ds_map_add(i, "menu_inv_main_2", "Temas");
		
		ds_map_add(i, "thm_name_0", "Padrão");
		ds_map_add(i, "thm_name_1", "Simples");
		ds_map_add(i, "thm_name_2", "Nikki");
	}
	
	
	
	
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










