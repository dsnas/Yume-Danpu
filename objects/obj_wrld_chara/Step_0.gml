
fac_inp[FAC_LEFT]	= inp.hold_left; // fac input
fac_inp[FAC_RIGHT]	= inp.hold_right;
fac_inp[FAC_UP]		= inp.hold_up;
fac_inp[FAC_DOWN]	= inp.hold_down;

int_inp = inp.press_select; // int input



if (move_stage == -1) // idle
{	
	for (var i = 0; i < 4; i++)
	{
		if (fac_inp[i] == true)
			fac = i;
		
		var _xTgt = (x + (move_spd * move_maxTime * move_spdMul[i]) * (fac_orient[i] == FAC_ORIENT_HOR)); // get target position
		var _yTgt = (y + (move_spd * move_maxTime * move_spdMul[i]) * (fac_orient[i] == FAC_ORIENT_VER));
		
		if (fac_inp[i] == true // start movement
		&&  instance_place(_xTgt, _yTgt, obj_wrld_coll_parent) == noone)
		{
			move_stage = 0;
			move_xTgt = _xTgt;
			move_yTgt = _yTgt;
			
			break;
		}
		
		var _int_obj = instance_place(_xTgt, _yTgt, obj_wrld_int_parent); // start interaction
		if (int_inp == true && _int_obj != noone)
		{
			if (_int_obj.npc == false) || (_int_obj.npc == true && _int_obj.move_stage < 0 && _int_obj.move_stage > -2)
			{
				_int_obj.move_stage = -2;
				_int_obj.int_stage = 0;
				
				move_stage = -2;
				
				break;
			}
		}
	}
}

if (move_stage == 0) // prepare for movement
{
	x = move_xTgt;
	y = move_yTgt;
	image_index += 1;
	
	fn_audio_play(snd_wrld_chara_step, false, VOL_PLAYER, 1, 0);
	
	move_stage = 1;
	move_time = 0;
}
if (move_stage == 1) // movement
{
	draw_x += ((move_spd * move_spdMul[fac]) * (fac_orient[fac] == FAC_ORIENT_HOR)); // move to target position
	draw_y += ((move_spd * move_spdMul[fac]) * (fac_orient[fac] == FAC_ORIENT_VER));
	
	if (fn_exists(wrld_rpt) == true) // teleport to the opposite side of the room
	{
		if (draw_x < 0)
		{
			x += wrld_w;
			draw_x += wrld_w;
		}
		if (draw_x >= wrld_w)
		{
			x -= wrld_w;
			draw_x -= wrld_w;
		}
		if (draw_y <= 0)
		{
			y += wrld_h;
			draw_y += wrld_h;
		}
		if (y > wrld_h)
		{
			y -= wrld_h;
			draw_y -= wrld_h;
		}
	}
	
	depth = -draw_y;
	
	move_time += 1;
	if (move_time == (move_maxTime / 2))
		image_index += 1;
	if (move_time >= move_maxTime)
	{
		draw_x = x;
		draw_y = y;
		move_stage = -1;
		
		if (debug == true)
		{
			fn_debug("room position = [" + string(x) + ", " + string(y) + "] | grid position = [" + string(x / 16) + ", " + string(y / 16) + "] | room depth = " + string(depth));
			fn_debug("camera = [" + string(cam) + "] | camera position = [" + string(cam_x) + ", " + string(cam_y) + "]");
		}
	}
}



if (cam_act == true) // camera
{
	cam_x = (draw_x + (sprite_width / 2) - (cam_w / 2));
	cam_y = (draw_y - (sprite_height / 2) - (cam_h / 2));
	if (cam_clamp == true)
	{
		cam_x = clamp(cam_x, 0, (wrld_w - cam_w));
		cam_y = clamp(cam_y, 0, (wrld_h - cam_h));
	}
	
	camera_set_view_size(cam, cam_w, cam_h);
	camera_set_view_pos(cam, cam_x, cam_y);
}

/*
var _npc_parent = obj_wrld_npc_parent;
for (var i = 0; i < instance_number(_npc_parent); i++)
{
	var _npc = instance_find(_npc_parent, i);
	if !(_npc.x >= (cam_x - 16) && _npc.y >= (cam_y - 16) && _npc.x < (cam_x + cam_w + 16) && _npc.y < (cam_y + cam_h + 16))
		instance_deactivate_object(_npc);
}
*/
