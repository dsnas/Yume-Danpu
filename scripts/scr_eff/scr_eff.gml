
//////// Functions related to effects


function fn_eff_setup()
{
	global.eff_amtMax = 14;
	for (var e = 0; e < global.eff_amtMax; e++)
	{
		fn_eff_add(e);
		global.eff_has[e] = false; // Determines if the player currently has that effect
	}
	
	enum EFF // Index of each effect in their arrays
	{
		DBG_SAL0 = 0,
		DBG_SAL1 = 1,
		DBG_SAL2 = 2
	}
	
	
	// [DBG] Salenis [#0]
	fn_eff_add(EFF.DBG_SAL0);
	global.eff_has[EFF.DBG_SAL0] = true;
	
	// [DBG] Salenis [#1]
	fn_eff_add(EFF.DBG_SAL1);
	global.eff_has[EFF.DBG_SAL1] = true;
	
	// [DBG] Salenis [#2]
	fn_eff_add(EFF.DBG_SAL2);
	global.eff_has[EFF.DBG_SAL2] = true;
	
	
	global.eff = -1; // Determines which effect is currently active (-1 == none, so must check if it equals or is higher than zero before using it to get data from the array)
}
function fn_eff_add(_idx)
{
	var i = _idx;
	
	global.eff_name[i] = fn_getText($"eff_name_{i}");
	global.eff_desc[i] = fn_getText($"eff_desc_{i}");
}
