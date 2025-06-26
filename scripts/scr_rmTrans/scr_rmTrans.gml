
//////// Functions related to the room transition sequence


function fn_rmTrans_getData()
{
	if (fn_obj_exists(obj_player) == true)
		end_player_dir = obj_player.MOVE_DIR_DN;
	delay_durMax = 10;
	type = type_fade;
	
	// Menus
	if (start_obj == obj_menu)
	{
		var i = start_obj.menu_id
		
		if (i == "home") // Main menu
			end_rm = rm_nexus;
		else if (i == "pse") // Pause menu
			end_rm = temp_rm_menu_home;
	}
	
	// Door of Macacolandia
	if (start_obj == obj_interact_macaco_door)
	{	
		end_rm = rm_macaco;
		if (room == rm_macaco)
		{
			end_rm = rm_nexus;
			end_player_x = 160;
			end_player_y = 112;
		}
		
		type = type_doorNormal;
	}
}


function fn_rmTrans_start() // Starts the transition sequence
{
	var _starter_obj = object_index;
	
	rmTrans_obj = fn_obj_create(obj_rmTrans);
	with (rmTrans_obj)
	{
		start_obj = _starter_obj;
		fn_rmTrans_getData();
	}
	
	fn_log($"Room transition sequence started by {object_get_name(object_index)}");
}