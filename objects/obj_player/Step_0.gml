
fn_config_key_quick();

move_dir_key[MOVE_DIR_LT] = hold_lt;
move_dir_key[MOVE_DIR_RT] = hold_rt;
move_dir_key[MOVE_DIR_UP] = hold_up;
move_dir_key[MOVE_DIR_DN] = hold_dn;


// Frozen, movement sequence will not activate
if (move_stg == -2)
	sprite_index = move_dir_spr[move_dir];


// Idle, inactive movement sequence
if (move_stg == -1) // Checks for movement key inputs and collision, also for interaction key input and interactables
{
	// Autowalk
	if (global.config_atwlk == true)
	{
		if (move_atwlk_lastDirKey != -1)
			move_dir_key[move_atwlk_lastDirKey] = true;
		else
			move_dir_key[move_dir] = true;
	}
	move_atwlk_lastDirKey = -1;
	
	
	// Loops through each movement direction
	for (var d = 0; d < 4; d++)
	{
		// Calculates movement target position
		move_dir_x[d] = (x + (move_spd * move_durMax * move_dir_spdMul[d]) * (move_dir_axis[d] == MOVE_DIR_AXIS_HOR));
		move_dir_y[d] = (y + (move_spd * move_durMax * move_dir_spdMul[d]) * (move_dir_axis[d] == MOVE_DIR_AXIS_VER));
		
		
		// Checks for movement key inputs
		if (move_dir_key[d] == true)
		{
			sprite_index = move_dir_spr[d];
			move_dir = d;
			
			
			// Checks for collision
			if (instance_place(move_dir_x[d], move_dir_y[d], obj_player) == noone
			&& instance_place(move_dir_x[d], move_dir_y[d], obj_solid_parent) == noone)
			{
				// Starts movement sequence
				x = move_dir_x[d];
				y = move_dir_y[d];
				image_index += 1;
				
				move_stg = 0;
				move_dur = move_durMax;
				move_tgtX = move_dir_x[d];
				move_tgtY = move_dir_y[d];
				
				fn_aud_play(snd_player_fstep, CONFIG_VOLTYPE.PLAYER);
				
				break;
			}
		}
		
		
		// Checks for interaction key input and for interactables
		var _interact_obj = instance_place(move_dir_x[d], move_dir_y[d], obj_interact);
		if (d == move_dir && press_slct && _interact_obj != noone)
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
}
if (move_stg == -1) // Checks for menu key inputs and created the menu object
{
	if (menu_delay_dur <= 0)
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
		menu_delay_dur -= 1;
}

// Moving, active movement sequence
if (move_stg == 0) // Moves
{
	self_x += ((move_spd * move_dir_spdMul[move_dir]) * (move_dir_axis[move_dir] == MOVE_DIR_AXIS_HOR));
	self_y += ((move_spd * move_dir_spdMul[move_dir]) * (move_dir_axis[move_dir] == MOVE_DIR_AXIS_VER));
	fn_chara_rm_loop();
	depth = -self_y;
	
	move_dur -= 1;
	if (move_dur == (move_durMax / 2))
		image_index += 1;
	if (move_dur <= 0)
	{
		self_x = x;
		self_y = y;
		move_stg = -1;
		
		
		if (global.dbg_act == true && global.dbg_excessLog == true)
			fn_log($"position = [{x}, {y}] | grid position = [{x / 16}, {y / 16}] | depth = {depth} | camera = {cam} | camera position = {cam_x}, {cam_y}}");
	}
	
	
	// Autowalk
	if (global.config_atwlk == true)
	{
		for (var d = 0; d < 4; d++)
		{
			if (move_dir_key[d] == true)
				move_atwlk_lastDirKey = d;
		}
	}
}
