/// @descr start NPC

event_inherited();
image_alpha = 1;
solid_type = solid_type_entity;
interact_meow_volType = CONFIG_VOLTYPE.ENTITY;


fn_entity_getId();


fn_chara_start();
move_spd = 0.5;
move_durMax = 32;
moveDelay_act = true;
moveChain_act = true;	

fn_entity_evCreate();

sprite_index = move_dir_spr[move_dir];
if (move_chasePlayer == true)
{
	move_durMax = 0;
	moveChain_act = false;
}




// HUA-LATUCA-PAYA!!!! HO-POPAPO-TUYA!!!!!!! AAAAAAAAAAAAAARRRRRRRGHHHHHHH!!!!!!!!!!!
