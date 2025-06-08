
function fn_eff_start() // Start effs (effects)
{
	global.eff_amtMax = 14;
	for (var e = 0; e < global.eff_amtMax; e++)
	{
		fn_eff_setup(e, "%%%", "%%%");
		global.eff_has[e] = false; // (Determines if the player currently has the effect)
	}
	global.eff_cur = -1; // (Determines which effect is currently active) (-1 = none, so must check if it equals or is higher than zero before using it to get data from the array)
	
	
	/* [DBG] (Salenis 0) */
	fn_eff_setup(0, "Salenis 0", "The Salenis is a world-famous dish.\nIt tastes funny.");
	global.eff_has[0] = true;
	
	/* [DBG] (Salenis 1) */
	fn_eff_setup(1, "Salenis 1", "The Salenis is a fascinating creation.\nIts smell is pleasing.");
	global.eff_has[1] = true;
	
	/* [DBG] (Salenis 2) */
	fn_eff_setup(2, "Salenis 2", "The Salenis is a political symbol.\nIts texture is horrifying.");
	global.eff_has[2] = true;
}

function fn_eff_setup(_id, _name_txt, _desc_txt)
{
	var i = _id;
	
	global.eff_name_txt[i] = _name_txt;
	global.eff_desc_txt[i] = _desc_txt;
}
