
fn_wrld_chara_fac();
fn_wrld_chara_coll();



if (move_stage == -1) // idle
{	
	for (var i = 0; i < 4; i++) // check for movement
	{
		if (fac_inp[i] == true)
		&& (instance_place(coll_xPlc[i], coll_yPlc[i], obj_coll_parent) == noone)
		{
			fac = i;
			move_stage = 0;
			
			sprite_index = fac_spr[fac];
			image_index += 1;
			fn_audio_play(snd_wrld_chara_step, false, VOL_PLAYER, 1, 0);
			
			break;
		}
	}
}



if (move_stage == 0) // moving
{
	if (fac_orient[fac] == FAC_ORIENT_HOR)
		x += (move_spd * fac_spdMul[fac]);
	else if (fac_orient[fac] == FAC_ORIENT_VER)
		y += (move_spd * fac_spdMul[fac]);
	depth = -bbox_bottom;
	
	move_time += 1;
	
	if (move_time == (move_timeMax / 2))
		image_index += 1;
	if (move_time >= move_timeMax)
	{
		move_time = 0;
		move_stage = -1;
		
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





















/*
var _checkType = 0;
while (_checkType <= 2)
{
	if (move == 1 && moving == 0)
	{
		// open chara menu
		if (_checkType == 0)
		{
			if (control.press_master == 1)
			{
				create(0, 0, obj_menu_chara);
				move = 0;
			}
		}
		
		
		// check for interact parent objects
		if (_checkType == 1)
		{
			
		}
		
		
		// check for transition starters
		if (_checkType == 2)
		{
			var _starter = instance_place(x, y, obj_transition_starter);
			if (_starter != noone)
			{
				transition(_starter);
				move = 0;
			}
		}
	}
	else
		break;
	
	_checkType += 1;
}
*/

/*
if (move_stage == -1)
{
	wrld_chara_int();
	
	for (var i = 0; i < 2; i++)
	{
		if (control.press_select == 1 && int_obj[i] != noone)
		{
			
		}
		
		
		if (control.press_select == 1 && interact_obj[i] != noone && interact_obj[i].interact_stage == 0 && ((interact_obj[i].interact_type != "npc") || (interact_obj[i].interact_type == "npc" && interact_obj[i].npc_move_stage == 0)))
		{
			interact_obj[i].interact_stage = 1;
			if (interact_obj[i].interact_stopChara == 1)
				move = 0;
			break;
		}
		else
			continue;
		
	}
}
*/







