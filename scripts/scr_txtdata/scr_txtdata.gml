
function fn_txtdata_start()
{
	if (global.sett_lang == LANG_EN)
	{
		global.txtdata[LANG_EN] = ds_map_create();
		en = global.txtdata[LANG_EN];
		
		
		
		ds_map_add(en, "salenis", "Salenis");
		
		ds_map_add(en, "menu_chara_main_0", "Effects");
		ds_map_add(en, "menu_chara_main_1", "Items");
		ds_map_add(en, "menu_chara_main_2", "Themes");
	}
	else if (global.sett_lang == LANG_BR)
	{
		
	}
}

function fn_txtdata(_key)
{
	return ds_map_find_value(global.txtdata[global.sett_lang], _key);
}
