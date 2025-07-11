
fn_config_key_quick();


// Frozen, movement sequence will not activate
if (move_stg == -2)
	sprite_index = dir_spr[dir];


// Movement sequence
move_manual_atwlk_act = global.config_atwlk;
fn_chara_move();


// Interaction sequence
for (var d = 0; d < dir_amt; d++)
{
	var _interact_obj = instance_place(move_dir_x[d], move_dir_y[d], obj_interact);
	if (d == dir && press_slct && _interact_obj != noone)
	{
		if (_interact_obj.solid_type == _interact_obj.solid_type_interact)
		|| (_interact_obj.solid_type == _interact_obj.solid_type_entity && _interact_obj.move_stg == -1)
		{
			// Starts the interactable's interaction sequence
			_interact_obj.interact_stg = 0;
			if (_interact_obj.solid_type == _interact_obj.solid_type_entity)
				_interact_obj.move_stg = -2;
				
			move_stg = -2;
				
			break;
		}
		else
			continue;
	}
}


// Menu-opening sequence
if (move_stg == -1) // Checks for menu key inputs and created the menu object
{
	if (menu_dly_dur <= 0)
	{
		for (var m = 0; m < menu_len; m++)
		{
			if (fn_config_key_press(menu_key[m]) == true && fn_obj_exists(obj_menu) == false)
			{
				fn_menu_obj_create(menu_id[m]);
				move_stg = -2;
			
				break;
			}
			else
				continue;
		}
	}
	else
		menu_dly_dur -= 1;
}

/*

*/