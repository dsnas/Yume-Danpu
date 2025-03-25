
event_user(0);
event_user(1);



if (move_stage == -1) // idle
{	
	for (var i = 0; i < 4; i++) // loop through all facings
	{
		if (fac_inp[i] == true) // update facing
			fac = i;
		
		if (fac_inp[i] == true && coll_objPlc[i] == noone) // start movement
		{
			move_stage = 0;
			break;
		}
		
		if (i == fac && inp.press_sel == true && int_objPlc[i] != noone) // start interaction
		{
			var _obj = int_objPlc[i];
			if (_obj.isNpc == false) || (_obj.isNpc == true && _obj.move_stage < 0 && _obj.move_stage > -2)
			{
				move_stage = -2;
				int_objPlc[i].move_stage = -2;
				int_objPlc[i].int_stage = 0;
				break;
			}
		}
	}
}



if (move_stage == 0) // movement
{
	// ugly bazoonga
	
	if (move_time == 0)
	{
		image_index += 1;
		fn_audio_play(snd_wrld_chara_step, false, VOL_PLAYER, 1, 0);
	}
	
	if (fac_orient[fac] == FAC_ORIENT_HOR)
		x += (move_spd * fac_spdMul[fac]);
	else if (fac_orient[fac] == FAC_ORIENT_VER)
		y += (move_spd * fac_spdMul[fac]);
	depth = -bbox_bottom;
	
	move_time += 1;
	if (move_time == (move_maxTime / 2))
		image_index += 1;
	if (move_time >= move_maxTime)
	{
		move_stage = -1;
		move_time = 0;
		
		// fn_debug("room position = [" + string(x) + ", " + string(y) + "] | grid position = [" + string(x / 16) + ", " + string(y / 16) + "] | depth = " + string(depth));
	}
}



if (cam_act == true) // camera
{
	cam_x = x + (sprite_width / 2)	- (cam_w / 2);
	cam_y = y - (sprite_height / 2)	- (cam_h / 2);
	
	if (cam_clamp == true)
	{
		cam_x = clamp(cam_x, 0, wrld_w - cam_w);
		cam_y = clamp(cam_y, 0, wrld_h - cam_h);
	}
	
	camera_set_view_size(cam, cam_w, cam_h);
	camera_set_view_pos(cam, cam_x, cam_y);
	
	// fn_debug("camera = [" + string(cam) + "] | camera position = [" + string(cam_x) + ", " + string(cam_y) + "]");
}



sprite_index = fac_spr[fac];
