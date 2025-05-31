
move_inp[MOVE_RT] = fn_inp("hold", SETT_INP.RT); // (movement inputs)
move_inp[MOVE_LT] = fn_inp("hold", SETT_INP.LT);
move_inp[MOVE_UP] = fn_inp("hold", SETT_INP.UP);
move_inp[MOVE_DN] = fn_inp("hold", SETT_INP.DN);


if (move_stg == -1) // idle
{	
	for (var d = 0; d < 4; d++) // loops through each direction
	{
		move_xAhead[d] = (x + (move_spd * move_durMax * move_spdMul[d]) * (move_axis[d] == MOVE_HOR)); // (get position ahead)
		move_yAhead[d] = (y + (move_spd * move_durMax * move_spdMul[d]) * (move_axis[d] == MOVE_VER));
		
		if (move_inp[d] == true)
		{
			move_fac = d;
			sprite_index = move_spr[move_fac];
			
			if (instance_place(move_xAhead[d], move_yAhead[d], obj_wrld_solid_parent) == noone) // (checks for the player and solids, and starts movement if none are found empty)
			{
				move_stg = 0;
				move_xTgt = move_xAhead[d];
				move_yTgt = move_yAhead[d];
				
				break;
			}
		}
		
		var _interactable_inp = fn_inp("press", SETT_INP.SLCT) == true;
		var _interactable_ahead = instance_place(move_xAhead[d], move_yAhead[d], obj_wrld_interactable); // (checks for an interactable and starts interaction sequence)
		if (d == move_fac && _interactable_inp == true && _interactable_ahead != noone)
		{
			if (_interactable_ahead.isNpc == false) || (_interactable_ahead.isNpc == true && _interactable_ahead.move_stg == -1)
			{
				_interactable_ahead.move_stg = -2;
				_interactable_ahead.poke_stg = 0;
				
				move_stg = -2;
				
				break;
			}
		}
	}
}
if (move_stg == 0) // (prepare for movement)
{
	x = move_xTgt;
	y = move_yTgt;
	image_index += 1;
	
	fn_aud_play(snd_wrld_chara_foot, SETT_VOL.CHARA);
	
	move_stg = 1;
	move_dur = move_durMax;
}
if (move_stg == 1) // (movement sequence)
{
	draw_x += ((move_spd * move_spdMul[move_fac]) * (move_axis[move_fac] == MOVE_HOR)); // (moves to target position)
	draw_y += ((move_spd * move_spdMul[move_fac]) * (move_axis[move_fac] == MOVE_VER));
	
	if (fn_exists(wrld_rpt) == true) // (teleports the player to the opposite side of the repeating world)
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
	
	move_dur -= 1;
	if (move_dur == (move_durMax / 2))
		image_index += 1;
	if (move_dur <= 0)
	{
		draw_x = x;
		draw_y = y;
		move_stg = -1;
		
		if (global.dbg_act == true)
		{
			fn_dbg_log("room position = [" + string(x) + ", " + string(y) + "] | grid position = [" + string(x / 16) + ", " + string(y / 16) + "] | room depth = " + string(depth));
			fn_dbg_log("camera = [" + string(cam_id) + "] | camera position = [" + string(cam_x) + ", " + string(cam_y) + "]");
			fn_dbg_log("");
		}
	}
}


if (fn_inp("press", SETT_INP.MENU_INV) == true && move_stg == -1 && fn_exists(obj_menu_inv) == false) // inv open (inventory)
{
	fn_spawn(obj_menu_inv, 0, 0);
	move_stg = -2;
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
	
	camera_set_view_size(cam_id, cam_w, cam_h);
	camera_set_view_pos(cam_id, cam_x, cam_y);
}






/* (unused) deactivate NPCs outside of the screen
instance_activate_all();
var _npc_parent = obj_wrld_npc_parent;
for (var i = 0; i < instance_number(_npc_parent); i++)
{
	var _npc = instance_find(_npc_parent, i);
	if !(_npc.x >= (cam_x - 16) && _npc.y >= (cam_y - 16) && _npc.x < (cam_x + cam_w + 16) && _npc.y < (cam_y + cam_h + 16))
		instance_deactivate_object(_npc);
}
*/
