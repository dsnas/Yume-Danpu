
//////// Functions related to entities/NPCs


function fn_entity_getId() // Fetches the ID of the NPC, which determines its behavior and appearance
{
	entity_id = "";
	
	// Macacolandia monkey citizen
	if (room == rm_wrld_dbg) || (room == rm_macaco)
		entity_id = "macaco_citizen";
}

function fn_entity_evCreate() // Create Event determined by the NPC's ID
{
	// Macacolandia monkey citizen
	if (entity_id == "macaco_citizen")
	{
		fn_obj_imgSpd(id, random_range(0.5, 1.5));
		
		move_dir_spr[MOVE_DIR_LT] = spr_wrld_entity_macaco_citizen
		move_dir_spr[MOVE_DIR_RT] = move_dir_spr[MOVE_DIR_LT];
		move_dir_spr[MOVE_DIR_UP] = move_dir_spr[MOVE_DIR_LT];
		move_dir_spr[MOVE_DIR_DN] = move_dir_spr[MOVE_DIR_LT];
		
		pet_durMax = 60;
		fn_interact_pet_meow_addAud("snd_entity_macaco_citizen_");
	}
}
function fn_entity_evStep() // Step Event determined by the NPC's ID
{
	// Macacolandia monkey citizen
	if (entity_id == "macaco_citizen")
	{
		fn_entity_move();
		
		
		// Interaction sequence
		if (pet_stg == 0)
		{
			pet_meow_idx = irandom_range(0, 4);
			var i = irandom_range(1, 100);
			if (i <= 5)
				pet_meow_idx = irandom_range(5, 6);
		}
		fn_interact_pet();
	}
}


function fn_entity_move() // Movement sequence
{
	// Idle, movement sequence inactive
	if (move_stg == -1) // Delays movement
	{
		// Calculates random duration for the delay
		if (moveDelay_stg == -1)
		{
			moveDelay_dur = (irandom_range(moveDelay_durMin, moveDelay_durMax) * moveDelay_act);
			moveDelay_stg = 0;
		}
		
		// Delays
		if (moveDelay_stg == 0)
		{
			moveDelay_dur -= 1;
			if (moveDelay_dur <= 0)
			{
				move_stg = 0;
				moveDelay_stg = -1;
			}
		}
	}
	
	
	// Moving, movement sequence active
	if (move_stg == 0) // Calculates movement target position and checks for collision
	{
		// Fetches amount of attempts the character will try for movement
		var _move_attAmt = 16;
		if (move_chasePlayer == true) // Checks if the entity is chasing the player
			_move_attAmt = 1;
		
		
		// Calculates movement target position and checks for collision
		for (var a = 0; a < _move_attAmt; a++)
		{
			// Fetches the direction the character will move to
			move_dir = choose(MOVE_DIR_LT, MOVE_DIR_RT, MOVE_DIR_UP, MOVE_DIR_DN);
			if (move_chasePlayer == true) // Checks if the entity is chasing the player
			{
				var d = point_direction(x, y, obj_player.x, obj_player.y);
				if (d >= 0 && d < 45) || (d >= 315 && d < 360)
					move_dir = MOVE_DIR_RT;
				else if (d >= 45 && d < 135)
					move_dir = MOVE_DIR_UP;
				else if (d >= 135 && d < 225)
					move_dir = MOVE_DIR_LT;
				else if (d >= 225 && d < 315)
					move_dir = MOVE_DIR_DN;
			}
			
			
			// Calculates movement target position
			move_dir_x[move_dir] = (x + (move_spd * move_durMax * move_dir_spdMul[move_dir]) * (move_dir_axis[move_dir] == MOVE_DIR_AXIS_HOR));
			move_dir_y[move_dir] = (y + (move_spd * move_durMax * move_dir_spdMul[move_dir]) * (move_dir_axis[move_dir] == MOVE_DIR_AXIS_VER));
			
			
			// Checks for collision
			if (instance_place(move_dir_x[move_dir], move_dir_y[move_dir], obj_player) == noone
			&& instance_place(move_dir_x[move_dir], move_dir_y[move_dir], obj_solid_parent) == noone)
			{
				// Checks if the character would move too far from their starting position
				if (moveChain_act == false)
				|| (moveChain_act == true
				&& abs(xstart - move_dir_x[move_dir]) < move_chain_dist
				&& abs(ystart - move_dir_y[move_dir]) < move_chain_dist)
				{
					// Starts movement sequence
					x = move_dir_x[move_dir];
					y = move_dir_y[move_dir];
					depth = -y;
					sprite_index = move_dir_spr[move_dir];
					
					move_stg = 1;
					move_dur = move_durMax;
					move_tgtX = move_dir_x[move_dir];
					move_tgtY = move_dir_y[move_dir];
					
					break;
				}
				else
					continue;
			}
			else
				continue;
		}
		
		
		// Cancels movement sequence if no position was found
		if (a >= _move_attAmt)
			move_stg = -1;
	}
	if (move_stg == 1) // Moves
	{
		self_x += ((move_spd * move_dir_spdMul[move_dir]) * (move_dir_axis[move_dir] == MOVE_DIR_AXIS_HOR));
		self_y += ((move_spd * move_dir_spdMul[move_dir]) * (move_dir_axis[move_dir] == MOVE_DIR_AXIS_VER));
		
		move_dur -= 1;
		if (move_dur <= 0)
		{
			self_x = x;
			self_y = y;
			move_stg = -1;
		}
	}
	
	
	// Checks if the entity is near the player and fixes its own depth
	if (distance_to_object(obj_player) <= 8)
		depth = -self_y;
}
