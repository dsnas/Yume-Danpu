
//////// Functions related to the room transition sequence


function fn_rmTrans_start() // Starts the transition sequence
{
	var _start_obj = object_index;
	var _start_obj_id = id;
	
	rmTrans_obj = fn_obj_create(obj_rmTrans);
	with (rmTrans_obj)
	{
		start_obj = _start_obj;
		start_obj_id = _start_obj_id;
		fn_rmTrans_getData();
	}
	
	fn_log($"Room transition sequence started by {object_get_name(object_index)}");
}


function fn_rmTrans_getData()
{
	if (fn_obj_exists(obj_player) == true)
		end_player_dir = obj_player.DIR_DN;
	delay_durMax = 10;
	type = TYPE_FADE;
	
	// Menus
	if (start_obj == obj_menu)
	{
		var i = start_obj.menu_id;
		if (i == "home") // Main menu
			end_rm = rm_nexus;
		else if (i == "pse") // Pause menu
			end_rm = temp_rm_menu_home;
	}
	
	// Door of Macacolandia
	if (start_obj == obj_talker_macaco_door)
	{
		end_rm = rm_macaco;
		if (room == rm_macaco)
		{
			end_rm = rm_nexus;
			end_player_x = 160;
			end_player_y = 112;
		}
		type = TYPE_DOORNORMAL;
	}
	
	// Door of Debug World
	if (start_obj == obj_talker_dbgwrld_door)
	{
		end_rm = rm_dbgwrld
		if (room == rm_dbgwrld)
		{
			end_rm = rm_nexus;
			end_player_x = 272;
			end_player_y = 224;
		}
		type = TYPE_DOORNORMAL;
	}
}
