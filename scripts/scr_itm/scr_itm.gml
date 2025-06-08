
function fn_itm_start() // Start itms (items)
{
	global.itm_amtMax = global.eff_amtMax;
	for (var i = 0; i < global.itm_amtMax; i++)
	{
		fn_itm_setup(i, "%%%", "%%%");
		global.itm_has[i] = false; // (Determines if the player currently has the item)
	}
	global.itm_cur = -1; // (Determines which item is currently active) (-1 = none, so must check if it equals or is higher than zero before using it to get data from the array)
	
	
	/* [DBG] (Axenis) */
	fn_itm_setup(0, "Axenis", "The powerful axe of the world-famous\nwriter Sal de Enis.");
	global.itm_has[0] = true;
}

function fn_itm_setup(_id, _name_txt, _desc_txt)
{
	var i = _id;
	
	global.itm_name_txt[i] = _name_txt;
	global.itm_desc_txt[i] = _desc_txt;
}
