
fac_inp[FAC_LEFT]	= inp.hold[INP_LEFT]; // fac input
fac_inp[FAC_RIGHT]	= inp.hold[INP_RIGHT];
fac_inp[FAC_UP]		= inp.hold[INP_UP];
fac_inp[FAC_DOWN]	= inp.hold[INP_DOWN];

int_inp = inp.press[INP_SELECT]; // int input



if (move_stage == -1) // idle
{	
	for (var i = 0; i < 4; i++) // loops through each inp
	{
		if (fac_inp[i] == true) // checks if inp has been pressed, changes facing
		{
			fac = i;
			sprite_index = fac_spr[fac];
		}
		
		var _xTgt = (x + (move_spd * move_maxTime * move_spdMul[i]) * (fac_orient[i] == FAC_ORIENT_HOR)); // get move target position
		var _yTgt = (y + (move_spd * move_maxTime * move_spdMul[i]) * (fac_orient[i] == FAC_ORIENT_VER));
		
		var _collTgt = instance_place(_xTgt, _yTgt, obj_wrld_coll_parent); // check for collision and start move
		if (fac_inp[i] == true && _collTgt == noone)
		{
			move_stage = 0;
			move_xTgt = _xTgt;
			move_yTgt = _yTgt;
			
			break;
		}
		
		var _intTgt = instance_place(_xTgt, _yTgt, obj_wrld_int_parent); // check for int and start it
		if (int_inp == true && _intTgt != noone)
		{
			if (_intTgt.int_isNpc == false)
			|| (_intTgt.int_isNpc == true && _intTgt.move_stage < 0 && _intTgt.move_stage > -2)
			{
				_intTgt.move_stage = -2;
				_intTgt.int_stage = 0;
				
				move_stage = -2;
				
				break;
			}
		}
	}
}



if (move_stage == 0) // prepare for move
{
	x = move_xTgt;
	y = move_yTgt;
	image_index += 1;
	
	fn_audio_play(snd_wrld_chara_foot, false, VOL_PLAYER, 1, 0);
	
	move_stage = 1;
	move_time = 0;
}

if (move_stage == 1) // move
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
	
	move_time += 1;
	if (move_time == (move_maxTime / 2))
		image_index += 1;
	if (move_time >= move_maxTime)
	{
		draw_x = x;
		draw_y = y;
		move_stage = -1;
		
		if (dbg == true)
		{
			fn_dbg("room position = [" + string(x) + ", " + string(y) + "] | grid position = [" + string(x / 16) + ", " + string(y / 16) + "] | room depth = " + string(depth));
			fn_dbg("camera = [" + string(cam) + "] | camera position = [" + string(cam_x) + ", " + string(cam_y) + "]");
		}
	}
	
	depth = -draw_y;
}



if (inp.press[INP_WRLD_INV] == true)
{
	
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
instance_activate_all();
var _npc_parent = obj_wrld_npc_parent;
for (var i = 0; i < instance_number(_npc_parent); i++)
{
	var _npc = instance_find(_npc_parent, i);
	if !(_npc.x >= (cam_x - 16) && _npc.y >= (cam_y - 16) && _npc.x < (cam_x + cam_w + 16) && _npc.y < (cam_y + cam_h + 16))
		instance_deactivate_object(_npc);
}
*/
