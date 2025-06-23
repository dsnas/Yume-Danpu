
//////// Functions related to the room transition system


function fn_rmTrans_setup() // Sets up the main variables of the room transition sequence
{
	enum RMTRANS_TYPE // ID of each type
	{
		FADE = 0 // Fades out of the current room and in to the target one
	}
}


function fn_rmTrans_start(_rmTgt, _type = RMTRANS_TYPE.FADE) // Starts the transition sequence to the specified room
{
	rmTrans_obj = fn_obj_create(obj_rmTrans);
	with (rmTrans_obj)
	{
		rmTgt = _rmTgt;
		type = _type;
	}
}
