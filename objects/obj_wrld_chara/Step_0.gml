

wrld_chara_fac();



















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















if (move_stage == -1)
{	
	for (var i = 0; i < 4; i++)
	{
		if (fac_inp[i] == true)
		{
			fac = i;
			move_stage = 0;
			
			sprite_index = fac_spr[fac];
			image_index += 1;
			audio_play(snd_wrld_chara_step, 0, 1, 0, VOL_PLAYER);
			
			break;
		}
	}
}



if (move_stage == 0)
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
		
		//debug("room position = [" + string(x) + ", " + string(y) + "] | grid position = [" + string(x / 16) + ", " + string(y / 16) + "] | depth = " + string(depth));
	}
}



if (cam_act == true)
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
}

















