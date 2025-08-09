
event_inherited();

fn_player_actor_setup();
fn_actor_evStep();


if (talk_act == true && fn_key_pressed(talk_key) == true && move_stg == -1)
{
	var _obj = instance_place(fn_actor_get_xAhead(id, x), fn_actor_get_yAhead(id, y), obj_talker_parent)
	if (_obj != noone)
	{
		if (_obj.solid_typeCurr == SOLID_TYPE.TALKER) || (_obj.solid_typeCurr == SOLID_TYPE.ENTITY && _obj.move_stg == -1)
		{
			with (_obj)
			{
				talk_stg = 0;
				if (solid_typeCurr == SOLID_TYPE.ENTITY)
					move_stg = -2;
			}
			
			move_stg = -2;
		}
	}
}


if (menu_act == true && move_stg == -1)
{
	if (menu_delay_durCurr <= 0)
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
	else
		menu_delay_durCurr -= 1;
}




// The messages that have been erased remain in our hearts and minds.
