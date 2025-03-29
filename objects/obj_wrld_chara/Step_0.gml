
fac_inp[FAC_LEFT]	= inp.hold_left; // fac input
fac_inp[FAC_RIGHT]	= inp.hold_right;
fac_inp[FAC_UP]		= inp.hold_up;
fac_inp[FAC_DOWN]	= inp.hold_down;



if (move_stage == -1) // idle
{	
	coll_xPlc[FAC_LEFT]		= (x - move_maxTime);
	coll_xPlc[FAC_RIGHT]	= (x + move_maxTime);
	coll_xPlc[FAC_UP]		= x;
	coll_xPlc[FAC_DOWN]		= x;
	
	coll_yPlc[FAC_LEFT]		= y;
	coll_yPlc[FAC_RIGHT]	= y;
	coll_yPlc[FAC_UP]		= (y - move_maxTime);
	coll_yPlc[FAC_DOWN]		= (y + move_maxTime);
	
	for (var i = 0; i < 4; i++) // loop through all facings
	{
		coll_objPlc[i] = instance_place(coll_xPlc[i], coll_yPlc[i], obj_wrld_coll_parent);
		int_objPlc[i] = instance_place(coll_xPlc[i], coll_yPlc[i], obj_wrld_int_parent);
		
		if (fac_inp[i] == true) // update facing
			fac = i;
		
		if (fac_inp[i] == true && coll_objPlc[i] == noone) // start movement
		{
			image_index += 1;
			move_stage = 0;
			fn_audio_play(snd_wrld_chara_step, false, VOL_PLAYER, 1, 0);
			break;
		}
		
		if (i == fac && inp.press_sel == true && int_objPlc[i] != noone) // start interaction
		{
			var _obj = int_objPlc[i];
			if (_obj.npc == false) || (_obj.npc == true && _obj.move_stage < 0 && _obj.move_stage > -2)
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
	x += (move_spd * fac_spdMul[fac] * (fac_orient[fac] == FAC_ORIENT_HOR));
	y += (move_spd * fac_spdMul[fac] * (fac_orient[fac] == FAC_ORIENT_VER));
	
	if (fn_exists(wrld_rpt) == true)
	{
		if (x < 0)
			x += wrld_w;
		if (x >= wrld_w)
			x -= wrld_w;
	
		if (y <= 0)
			y += wrld_h;
		if (y > wrld_h)
			y -= wrld_h;
	}
	
	depth = -bbox_bottom;
	
	move_time += 1;
	if (move_time == (move_maxTime / 2))
		image_index += 1;
	if (move_time >= move_maxTime)
	{
		move_stage = -1;
		move_time = 0;
		
		if (debug == true)
			fn_debug("room position = [" + string(x) + ", " + string(y) + "] | grid position = [" + string(x / 16) + ", " + string(y / 16) + "] | depth = " + string(depth));
	}
}



if (cam_act == true) // camera
{
	cam_x = (x + (sprite_width / 2) - (cam_w / 2));
	cam_y = (y - (sprite_height / 2) - (cam_h / 2));
	if (cam_clamp == true)
	{
		cam_x = clamp(cam_x, 0, wrld_w - cam_w);
		cam_y = clamp(cam_y, 0, wrld_h - cam_h);
	}
	
	camera_set_view_size(cam, cam_w, cam_h);
	camera_set_view_pos(cam, cam_x, cam_y);
	
	if (debug == true)
		fn_debug("camera = [" + string(cam) + "] | camera position = [" + string(cam_x) + ", " + string(cam_y) + "]");
}
