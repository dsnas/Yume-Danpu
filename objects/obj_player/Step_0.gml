
event_inherited();

fn_player_setup_actor();
fn_actor_evStep();


if (talk_act == true && fn_key_pressed(talk_key) == true && move_stg == -1)
{
	var _objAhead = instance_place(fn_actor_get_xAhead(id, x), fn_actor_get_yAhead(id, y), obj_talker_parent)
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
			}
		}
		
		move_stg = -2;
	}
}


if (menu_act == true && move_stg == -1)
{
	for (var i = 0; i < array_length(menu_key); i++)
	{
		if (fn_key_pressed(menu_key[i]) == true)
		{
			fn_menu_obj_create(menu_id[i]);
			move_stg = -2;
		}
	}
}




// The messages that have been erased remain in our hearts and minds.
