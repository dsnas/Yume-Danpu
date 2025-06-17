
fn_keyQuick();

move_dir_key[MOVE_DIR_LT] = key_lt_hold;
move_dir_key[MOVE_DIR_RT] = key_rt_hold;
move_dir_key[MOVE_DIR_UP] = key_up_hold;
move_dir_key[MOVE_DIR_DN] = key_dn_hold;


// Autowalk
if (global.player_atwlk == true)
{
	for (var d = 0; d < 4; d++)
	{
		if (move_dir_key[d] == true)
			move_atwlk_lastDirKey = d;
	}
}


// Idle, inactive movement sequence
if (move_stg == -1) // Checks for movement key inputs and collision, also for interaction key input and interactables
{
	// Autowalk
	if (global.player_atwlk == true)
	{
		if (move_atwlk_lastDirKey != -1)
			move_dir_key[move_atwlk_lastDirKey] = true;
		else
			move_dir_key[move_dir] = true;
		move_atwlk_lastDirKey = -1;
	}
	
	
	// Loops through each movement direction
	for (var d = 0; d < 4; d++)
	{		
		// Checks for movement key inputs
		if (move_dir_key[d] == true)
		{
			sprite_index = move_dir_spr[d];
			move_dir = d;
			
			
			// Calculates movement target position
			move_dir_x[d] = (x + (move_spd * move_durMax * move_dir_spdMul[d]) * (move_dir_axis[d] == MOVE_DIR_AXIS_HOR));
			move_dir_y[d] = (y + (move_spd * move_durMax * move_dir_spdMul[d]) * (move_dir_axis[d] == MOVE_DIR_AXIS_VER));
			
			
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
				
				fn_aud_play(snd_player_fstep, VOL_IDX.PLAYER);
				
				break;
			}
			else
				continue;
		}
		
		
		// Checks for interaction key input and for interactables
		var _interact_obj = instance_place(move_dir_x[d], move_dir_y[d], obj_interact);
		if (d == move_dir && key_slct_press && _interact_obj != noone)
		{
			if (_interact_obj.solid_type == _interact_obj.SOLID_TYPE_INTERACT)
			|| (_interact_obj.solid_type == _interact_obj.SOLID_TYPE_ENTITY && _interact_obj.move_stg == -1)
			{
				// Starts the interactable's interaction sequence
				_interact_obj.pet_stg = 0;
				if (_interact_obj.solid_type == _interact_obj.SOLID_TYPE_ENTITY)
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
	for (var m = 0; m < array_length(menu_key_idx); m++)
	{
		if (fn_key(KEY_CHECKtype.PRESS, menu_key_idx[m]) == true && fn_obj_exists(obj_menu) == false)
		{
			fn_menu_create(menu_id[m]);
			move_stg = -2;
			
			break;
		}
		else
			continue;
	}
}


// Moving, active movement sequence
if (move_stg == 0) // Moves
{
	self_x += ((move_spd * move_dir_spdMul[move_dir]) * (move_dir_axis[move_dir] == MOVE_DIR_AXIS_HOR));
	self_y += ((move_spd * move_dir_spdMul[move_dir]) * (move_dir_axis[move_dir] == MOVE_DIR_AXIS_VER));
	depth = -self_y;
	
	move_dur -= 1;
	if (move_dur == (move_durMax / 2))
		image_index += 1;
	if (move_dur <= 0)
	{
		self_x = x;
		self_y = y;
		move_stg = -1;
		
		if (global.dbg_act == true)
		{
			fn_dbg_log("room position = [" + string(x) + ", " + string(y) + "] | grid position = [" + string(x / 16) + ", " + string(y / 16) + "] | room depth = " + string(depth));
			fn_dbg_log("camera = [" + string(cam_id) + "] | camera position = [" + string(cam_x) + ", " + string(cam_y) + "]");
			fn_dbg_log("");
		}
	}
}


// Camera movement
if (cam_act == true)
{
	cam_x = (self_x + (sprite_width / 2) - (cam_w / 2));
	cam_y = (self_y - (sprite_height / 2) - (cam_h / 2));
	if (cam_clamp == true)
	{
		cam_x = clamp(cam_x, 0, (room_width - cam_w));
		cam_y = clamp(cam_y, 0, (room_height - cam_h));
	}
	
	camera_set_view_size(cam_id, cam_w, cam_h);
	camera_set_view_pos(cam_id, cam_x, cam_y);
}



