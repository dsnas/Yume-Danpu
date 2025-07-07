
//////// Functions related to effects


function fn_eff_setup() // Sets up the effects
{
	enum EFF // Index of each effect in their arrays
	{
		DBG_SAL0 = 0,
		DBG_SAL1 = 1,
		DBG_SAL2 = 2
	}
	
	// Debug effects
	fn_eff_add(EFF.DBG_SAL0);
	fn_eff_add(EFF.DBG_SAL1);
	fn_eff_add(EFF.DBG_SAL2);
	
	global.eff = -1; // Determines which effect is currently active (-1 == none, so must check if it equals or is higher than zero before using it to get data from the array)
}
function fn_eff_add(_idx)
{
	var e = _idx;
	
	global.eff_unlocked[e] = false;
	global.eff_name[e] = fn_getText($"eff_name_{e}");
	global.eff_desc[e] = fn_getText($"eff_desc_{e}");
}
