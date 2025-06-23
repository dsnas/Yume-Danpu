
//////// Functions related to items


function fn_itm_setup()
{
	global.itm_amtMax = global.eff_amtMax;
	for (var i = 0; i < global.itm_amtMax; i++)
	{
		fn_itm_add(i, "%%%", "%%%");
		global.itm_has[i] = false; // Determines if the player currently has that item
	}
	global.itm_cur = -1; // Determines which item is currently active (-1 == none, so must check if it equals or is higher than zero before using it to get data from the array)
	
	
	// [DBG] Axenis
	fn_itm_add(0, "Axenis", "The powerful axe of the world-famous\nwriter Sal de Enis.");
	global.itm_has[0] = true;
}
function fn_itm_add(_ITM_IDX, _name_text, _desc_text)
{
	var i = _ITM_IDX;
	
	global.itm_name[i] = _name_text;
	global.itm_desc[i] = _desc_text;
}
