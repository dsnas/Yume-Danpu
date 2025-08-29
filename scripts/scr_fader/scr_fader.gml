
//////// Functions related to the room transition sequence


function fn_fader_evCreate()
{
	if (src.obj.object_index == obj_prop_macaco_door) // Door of Macacolandia
	{
		type.fade.act = true;
		if (src.rm == rm_nexus)
		{
			tgt.rm = rm_macaco;
			type.fade.iris.act = true;
			type.fade.iris.x = (src.obj.x + (src.obj.sprite_width / 2));
			type.fade.iris.y = (src.obj.y - (src.obj.sprite_height / 4));
		}
		else if (src.rm == rm_macaco)
		{
			tgt.rm = rm_nexus;
			tgt.player.x = 160;
			tgt.player.y = 112;
		}
	}
}


function fn_fader_start()
{
	fader = fn_obj_create(obj_fader);
	fader.src.rm = room;
	fader.src.obj = id;
	with (fader)
		fn_fader_evCreate();
}
