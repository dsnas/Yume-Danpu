
//////// Functions related to the room transition sequence


function fn_fader_evCreate()
{
	if (fader.src.obj == obj_prop_macaco_door)
	{
		
		if (fader.tgt.rm == rm_macaco)
		{
			
		}
	}
}


function fn_fader_start()
{
	var _obj = fn_obj_create(obj_fader);
	with (_obj)
	{
		fader.src.rm = room;
		fader.src.obj = object_index;
		
		fn_fader_evCreate();
	}
}
