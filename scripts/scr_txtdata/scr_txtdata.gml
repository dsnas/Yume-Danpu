
function fn_txtdata_start()
{
	if (global.sett_lang == LANG_EN)
	{
		global.txtdata[LANG_EN] = ds_map_create();
		en = global.txtdata[LANG_EN];
		
		
		
		ds_map_add(en, "salenis_0", "Salenis");
		ds_map_add(en, "salenis_1", "Salenis 2: A Revolta dos Tubarões");
		ds_map_add(en, "salenis_2", "Salenis 3: O Império Contra-Ataca");
		ds_map_add(en, "salenis_3", "Salenis 4: O Último Suspiro");
		ds_map_add(en, "salenis_4", "Salenis 5: Ressureição");
		
		ds_map_add(en, "menu_inv_main_0", "Effects");
		ds_map_add(en, "menu_inv_main_1", "Items");
		ds_map_add(en, "menu_inv_main_2", "Themes");
	}
	else if (global.sett_lang == LANG_BR)
	{
		
	}
}

function fn_txtdata(_key)
{
	return ds_map_find_value(global.txtdata[global.sett_lang], _key);
}
