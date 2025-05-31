/// @descr start NPC

event_inherited();

image_alpha = 1;




draw_x = x; // (self-drawing info)
draw_y = y;
draw_xSc = 1;
draw_ySc = 1;
draw_ang = 0;


MOVE_RT = 0; // (right)	// directions
MOVE_LT = 1; // (left)
MOVE_UP = 2; // (up)
MOVE_DN = 3; // (down)
MOVE_HOR = 0; // (horizontal)	// orientations
MOVE_VER = 1; // (vertical)
move_fac = choose(MOVE_RT, MOVE_LT, MOVE_UP, MOVE_DN); // (direction the player is currently facing)

move_spr[MOVE_RT] = -1;
move_axis[MOVE_RT] = MOVE_HOR;
move_spdMul[MOVE_RT] = 1;

move_spr[MOVE_LT] = -1;
move_axis[MOVE_LT] = MOVE_HOR;
move_spdMul[MOVE_LT] = -1;

move_spr[MOVE_UP] = -1;
move_axis[MOVE_UP] = MOVE_VER;
move_spdMul[MOVE_UP] = -1;

move_spr[MOVE_DN] = -1;
move_axis[MOVE_DN] = MOVE_VER;
move_spdMul[MOVE_DN] = 1;

move_stg = -1;
move_dly_stg = 0;
move_dly_dur = 0;
move_dly_durMin = 0;
move_dly_durMax = 240;
move_dly_act = true;

move_spd = 0.5;
move_dur = 0;
move_durMax = 32;
move_chain_act = true; // (prevents NPC from moving too far from its starting position)
move_chain_dist = 48;
move_xTgt = 0;
move_yTgt = 0;

move_chaseChara = false;


for (var i = 0; i < chirp_amtMax; i++)
	chirp_aud_volIdx[i] = SETT_VOL.NPC;


isNpc = true;




fn_wrld_npc_id(); // retrieves the ID of the NPC, which determines its behavior and appearance
fn_wrld_npc_create(); // create event based on the NPC's ID




if (move_chaseChara == true)
{
	move_durMax = 0;
	move_chain_act = false;
}

sprite_index = move_spr[move_fac];
depth = -bbox_bottom;




// HUA-LATUCA-PAYA!!!! HO-POPAPO-TUYA!!!!!!! AAAAAAAAAAAAAARRRRRRRGHHHHHHH!!!!!!!!!!!
