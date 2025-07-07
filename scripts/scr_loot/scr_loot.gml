
//////// Functions related to effects, items and themes


function fn_loot_setup()
{
	enum LOOT // ID of each type of loot
	{
		EFF = 0,
		ITM = 1,
		THM = 2
	}
	
	global.loot_name[LOOT.EFF] = global.eff_name;
	global.loot_name[LOOT.ITM] = global.itm_name;
	global.loot_name[LOOT.THM] = global.thm_name;
	
	global.loot_unlocked[LOOT.EFF] = global.eff_unlocked;
	global.loot_unlocked[LOOT.ITM] = global.itm_unlocked;
	global.loot_unlocked[LOOT.THM] = global.thm_unlocked;
}


function fn_loot_unlock(_loot, _piece)
{
	if (fn_obj_exists(obj_player) == true && obj_player.move_stg <= -1)
	{
		var l = _loot;
		var p = _piece;
		
		array_set(global.loot_unlocked[l], p, true);
		fn_profile_file_save();
		fn_menu_obj_create("unlock", l, array_get(global.loot_name[l], p));
		obj_player.move_stg = -2;
	}
}
