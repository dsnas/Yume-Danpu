
//////// Functions related to effects, items and themes


function fn_loot_setup()
{
	enum LOOT // ID of each type of loot
	{
		EFF = 0,
		ITM = 1,
		THM = 2
	}
	
	fn_eff_setup();
	fn_itm_setup();
	fn_thm_setup();
}


function fn_loot_unlock(_loot, _piece)
{
	if (fn_obj_exists(obj_player) == true && obj_player.move_stg <= -1)
	{
		var p = _piece;
		var _piece_name = "%%%";
		
		if (_loot == LOOT.EFF)
		{
			global.eff_unlocked[p] = true;
			_piece_name = global.eff_name[p];
		}
		else if (_loot == LOOT.ITM)
		{
			global.itm_unlocked[p] = true;
			_piece_name = global.itm_name[p];
		}
		else if (_loot == LOOT.THM)
		{
			global.thm_unlocked[p] = true;
			_piece_name = global.thm_name[p];
		}
		
		
		fn_menu_obj_create("unlock", _loot, _piece_name);
		obj_player.move_stg = -2;
	}
}
