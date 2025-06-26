
//////// Functions related to the room transition sequence


function fn_rmTrans_getData()
{
	end_player_dir = obj_player.MOVE_DIR_DN;
	delay_durMax = 15;
	type = type_fade;
	
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