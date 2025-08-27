
fn_obj_img( , , , , 0);
fn_obj_depth( , -11000);


// Data of the starting position of the room transition sequence
start_obj = -1; // Object index of the one that started the room transition sequence
start_obj_id = -1;

// Data of the ending/target position of the room transition sequence
end_rm = -1;

end_player_x = 0;
end_player_y = 0;
end_player_dirCurr = -1;
end_player_changed = false; // Determines if the player's data has already been changed


// Stages and delay
stg = 0; // ID number of the current stage (-1 == inactive, 0+ active)

delay_dur = 0;
delay_durMax = 0;


// Types, which determine the room transition sequence's behavior and appearance
type = -1; // ID number of the current type (-1 == none)

	// Fade type, fades out of the starting room and fades in to the ending one
TYPE_FADE = 0;
fade_col = c_black;
fade_alp = 0;
fade_alpSpd = 0.15;

	// Normal door type, opens the door and fades out of the starting room, and then fades in to the ending one
TYPE_DOORNORMAL = 1;
doorNormal_stg = 0;


destroy = false;





