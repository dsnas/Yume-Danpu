
//////// Functions related to items


function fn_itm_setup() // Sets up the items
{
	enum ITM // Index of each item in their arrays
	{
		DBG_AXE = 0
	}
	
	// Debug items
	fn_itm_add(ITM.DBG_AXE);
	
	global.itm = -1; // Determines which item is currently active (-1 == none, so must check if it equals or is higher than zero before using it to get data from the array)
}
function fn_itm_add(_itm)
{
	var i = _itm;
	
	global.itm_unlocked[i] = false;
	global.itm_name[i] = fn_getText($"itm_name_{i}");
	global.itm_desc[i] = fn_getText($"itm_desc_{i}");
}
