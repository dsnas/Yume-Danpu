
//////// Functions related to items


function fn_itm_setup()
{
	global.itm_amtMax = global.eff_amtMax;
	for (var i = 0; i < global.itm_amtMax; i++)
	{
		fn_itm_add(i);
		global.itm_has[i] = false; // Determines if the player currently has that item
	}
	
	enum ITM // Index of each item in their arrays
	{
		DBG_AXE = 0
	}
	
	
	// [DBG] Axenis
	fn_itm_add(ITM.DBG_AXE);
	global.itm_has[ITM.DBG_AXE] = true;
	
	
	global.itm = -1; // Determines which item is currently active (-1 == none, so must check if it equals or is higher than zero before using it to get data from the array)
}
function fn_itm_add(_idx)
{
	var i = _idx;
	
	global.itm_name[i] = fn_getText($"itm_name_{i}");
	global.itm_desc[i] = fn_getText($"itm_desc_{i}");
}
