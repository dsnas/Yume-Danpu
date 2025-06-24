
//////// Functions related to the room transition system


function fn_rmTrans_setup() // Sets up the main variables of the room transition sequence
{
	// ID of each type
	global.rmTrans_type =
	{
		fade : 0 // Fades out of the current room, and fades in to the target one
	}
}


function fn_rmTrans_start(_tgt, _type = global.rmTrans_type.fade, _player_x = undefined, _player_y = undefined, _player_dir = undefined) // Starts the transition sequence to the specified room
{
	rmTrans_obj = fn_obj_create(obj_rmTrans);
	with (rmTrans_obj)
	{
		tgt = _tgt;
		type = _type;
		
		player_x = _player_x;
		player_y = _player_y;
		player_dir = _player_dir;
	}
}
