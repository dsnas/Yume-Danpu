
event_inherited();

fn_chara_move();


if (talk_act == true && fn_key_pressed(talk_key) == true && move_stg == -1)
{
	var _objAhead = instance_place(fn_chara_get_xAhead(id), fn_chara_get_yAhead(id), obj_talker_parent)
	if (_objAhead != noone)
	{
		with (_objAhead)
		{
			if (solid_typeCurr == SOLID_TYPE.TALKER)
			|| (solid_typeCurr == SOLID_TYPE.ENTITY && move_stg == -1)
			{
				talk_stg = 0;
				if (solid_typeCurr == SOLID_TYPE.ENTITY)
					move_stg = -2;
				
				other.move_stg = -2;
			}
		}
	}
}


if (menu_act == true && move_stg == -1)
{
	for (var i = 0; i < array_length(menu_key); i++)
	{
		if (fn_key_pressed(menu_key[i]) == true)
			fn_menu_obj_create(menu_id[i]);
	}
}
