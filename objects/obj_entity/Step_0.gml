
// Frozen, movement sequence will not activate
if (move_stg == -2)
	sprite_index = dir_spr[dir];


// Movement sequence
fn_chara_move();


// Checks if the entity is near the player and fixes its own depth
if (distance_to_object(obj_player) <= 8)
	depth = -self_y;


fn_entity_evStep();
