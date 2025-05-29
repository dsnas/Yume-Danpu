
function fn_eff_start()
{
	global.eff_amt = 0;
	global.eff_amtMax = 10;
	for (var i = 0; i < global.eff_amtMax; i++)
	{
		global.eff_name_txt[i] = "";
		global.eff_desc_txt[i] = "Salenis";
	}
	
	fn_eff_setup(0, "Salenis 0", "The Salenis description.");
	fn_eff_setup(1, "Salenis 1", "The Salenis is a world-famous dish.\nIt tastes funny.");
	fn_eff_setup(2, "Salenis 2", "The Salenis is a fascinating creation.\nIts smell is pleasing.");
	fn_eff_setup(3, "Salenis 3", "The Salenis is a political symbol.\nIts texture is horrifying.");
}

function fn_eff_setup(_id, _name_txt, _desc_txt)
{
	var i = _id;
	
	global.eff_name_txt[i] = _name_txt;
	global.eff_desc_txt[i] = _desc_txt;
	
	global.eff_amt += 1;
}
