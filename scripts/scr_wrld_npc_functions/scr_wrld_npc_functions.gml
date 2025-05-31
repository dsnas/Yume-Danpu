
function fn_wrld_npc_id() // retrieves the ID of the NPC, which determines its behavior and appearance
{
	npc_id = "";
	
	if (wrld_rm == rm_wrld_dbg) || (wrld_rm == rm_wrld_macaco) // Macacolandia monkey citizen
		npc_id = "macaco_citizen";
}
function fn_wrld_npc_create() // create event based on the NPC's ID
{
	if (npc_id == "macaco_citizen") // Macacolandia monkey citizen
	{
		move_spr[MOVE_RT] = spr_wrld_npc_macaco_citizen;
		move_spr[MOVE_LT] = move_spr[MOVE_RT];
		move_spr[MOVE_UP] = move_spr[MOVE_RT];
		move_spr[MOVE_DN] = move_spr[MOVE_RT];
		
		image_speed = random_range(0.5, 1.5);
		
		poke_durMax = 60;
		
		for (var i = 0; i < chirp_amtMax; i++)
		{
			var _aud = asset_get_index("snd_wrld_npc_macaco_citizen_" + string(i));
			chirp_aud[i] = _aud;
			if (_aud == -1)
			{
				chirp_amt = i;
				break;
			}
		}
	}
}
function fn_wrld_npc_step() // step event based on the NPC's ID
{
	if (npc_id == "macaco_citizen") // Macacolandia monkey citizen
	{
		fn_wrld_npc_move(); // move (movement)
		
		if (poke_stg == 0)
		{
			chirp_idx = irandom_range(0, 4);
			var i = irandom_range(1, 100);
			if (i <= 5)
				chirp_idx = irandom_range(5, 6);
		}
		fn_wrld_interactable_chirp(); // chirp (plays audio as an answer to being interacted with)
	}
}

function fn_wrld_npc_move() // move (movement)
{
	if (move_stg == -1) // (delays movement)
	{
		if (move_dly_stg == 0) // (gets delay duration)
		{
			move_dly_dur = (irandom_range(move_dly_durMin, move_dly_durMax) * move_dly_act);
			move_dly_stg = 1;
		}
		if (move_dly_stg == 1) // (delays)
		{
			move_dly_dur -= 1;
			if (move_dly_dur <= 0)
			{
				move_stg = 0;
				move_dly_stg = 0;
			}
		}
	}
	if (move_stg == 0) // (starts movement sequence)
	{
		for (var i = 0; i < 25; i++) // (attempt movement multiple times before giving up)
		{
			if (move_chaseChara == false) // (moving normally, get random direction)
			{
				move_fac = irandom_range(MOVE_LT, MOVE_DN);
			}
			else if (move_chaseChara == true) // (chasing player, get most logical direction)
			{
				var _dir = point_direction(x, y, wrld_chara.x, wrld_chara.y);
				if (_dir >= 0 && _dir < 45) || (_dir >= 315 && _dir < 360)
					move_fac = MOVE_RT;
				else if (_dir >= 45 && _dir < 135)
					move_fac = MOVE_UP;
				else if (_dir >= 135 && _dir < 225)
					move_fac = MOVE_LT;
				else if (_dir >= 225 && _dir < 315)
					move_fac = MOVE_DN;
			}
			sprite_index = move_spr[move_fac];
			
			
			move_xAhead[move_fac] = (x + (move_spd * move_durMax * move_spdMul[move_fac]) * (move_axis[move_fac] == MOVE_HOR)); // (gets movement target position)
			move_yAhead[move_fac] = (y + (move_spd * move_durMax * move_spdMul[move_fac]) * (move_axis[move_fac] == MOVE_VER));
			
			if (instance_place(move_xAhead[move_fac], move_yAhead[move_fac], obj_wrld_chara) == noone // (checks for the player and solids, and starts movement if none are found empty)
			&& instance_place(move_xAhead[move_fac], move_yAhead[move_fac], obj_wrld_solid_parent) == noone)
			{
				if (move_chain_act == false) || (move_chain_act == true && abs(xstart - move_xAhead[move_fac]) < move_chain_dist && abs(ystart - move_yAhead[move_fac]) < move_chain_dist) // (prevents NPC from moving too far from its starting position)
				{
					move_stg = 1;
					move_xTgt = move_xAhead[move_fac];
					move_yTgt = move_yAhead[move_fac];
			
					break;
				}
			}
		}
	}
	if (move_stg == 1) // (prepares for movement)
	{
		x = move_xTgt;
		y = move_yTgt;
		depth = -move_yTgt;
	
		move_dur = move_durMax;
		move_stg = 2;
	}
	if (move_stg == 2) // (moves)
	{
		draw_x += ((move_spd * move_spdMul[move_fac]) * (move_axis[move_fac] == MOVE_HOR)); // (moves to target position)
		draw_y += ((move_spd * move_spdMul[move_fac]) * (move_axis[move_fac] == MOVE_VER));
	
		move_dur -= 1;
		if (move_dur <= 0)
		{
			draw_x = x;
			draw_y = y;
			move_stg = -1;
		}
	
		if (distance_to_object(wrld_chara) <= 8)
			depth = -draw_y;
	}
}
