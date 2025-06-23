
//////// Functions related to characters, like entities and the player


function fn_chara_start() // Sets up the main variables of the character (Some of them are used only by entities or by the player)
{
	fn_draw_self_setup();
	
	
	// Movement sequence
	MOVE_DIR_LT = 0; // ID numbers of each direction the character can move to
	MOVE_DIR_RT = 1;
	MOVE_DIR_UP = 2;
	MOVE_DIR_DN = 3;
	move_dir = MOVE_DIR_DN; // Current direction the character is looking to
	
	MOVE_DIR_AXIS_HOR = 0; // ID numbers of each axis the character can move to
	MOVE_DIR_AXIS_VER = 1;
	move_dir_axis[MOVE_DIR_LT] = MOVE_DIR_AXIS_HOR; // Axis of each direction the character can move to
	move_dir_axis[MOVE_DIR_RT] = MOVE_DIR_AXIS_HOR;
	move_dir_axis[MOVE_DIR_UP] = MOVE_DIR_AXIS_VER;
	move_dir_axis[MOVE_DIR_DN] = MOVE_DIR_AXIS_VER;
	
	for (var d = 0; d < 4; d++)
	{
		move_dir_spr[d] = -1;
		move_dir_x[d] = 0;
		move_dir_y[d] = 0;
	}
	
	move_dir_spdMul[MOVE_DIR_LT] = -1;
	move_dir_spdMul[MOVE_DIR_RT] = 1;
	move_dir_spdMul[MOVE_DIR_UP] = -1;
	move_dir_spdMul[MOVE_DIR_DN] = 1;
	
	move_dir_key[MOVE_DIR_LT] = KEY_IDX.LT;
	move_dir_key[MOVE_DIR_RT] = KEY_IDX.RT;
	move_dir_key[MOVE_DIR_UP] = KEY_IDX.UP;
	move_dir_key[MOVE_DIR_DN] = KEY_IDX.DN;
	
	move_stg = -1; // ID of the current stage of the movement sequence (-1 == idle, 0+ active)
	move_spd = 1;
	move_dur = 0;
	move_durMax = 16;
	move_tgtX = 0;
	move_tgtY = 0;
	move_chasePlayer = false;
	
	moveDelay_stg = -1;
	moveDelay_dur = 0;
	moveDelay_durMin = 0;
	moveDelay_durMax = 240;
	moveDelay_act = false;
	
	moveChain_act = false; // Determines if the character can NOT move too far from their starting position
	moveChain_dist = 48;
}

function fn_chara_rm_loop()
{
	var _xDist = 0;
	var _yDist = 0;
	
	if (obj_rm.loop_xAct == true)
	{
		if (self_x < 0)
			_xDist = room_width;
		if (self_x >= room_width)
			_xDist = -room_width;
		
		x += _xDist;
		self_x += _xDist;
	}
	
	if (obj_rm.loop_yAct == true)
	{
		if (self_y <= 0)
			_yDist = room_height;
		if (self_y > room_height)
			_yDist = -room_height;
		
		y += _yDist;
		self_y += _yDist;
	}
}
