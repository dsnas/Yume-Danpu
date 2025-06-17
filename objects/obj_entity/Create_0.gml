/// @descr start NPC

event_inherited();
image_alpha = 1;
solid_type = SOLID_TYPE_ENTITY;


fn_chara_start();
move_spd = 0.5;
move_durMax = 32;


fn_entity_getId();
fn_entity_evCreate();


depth = -self_y;
sprite_index = move_dir_spr[move_dir];

if (move_chasePlayer == true)
{
	move_durMax = 0;
	moveChain_act = false;
}




// HUA-LATUCA-PAYA!!!! HO-POPAPO-TUYA!!!!!!! AAAAAAAAAAAAAARRRRRRRGHHHHHHH!!!!!!!!!!!
