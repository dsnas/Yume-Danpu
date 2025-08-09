
event_inherited();
solid_typeCurr = SOLID_TYPE.PLAYER;


effOld = -2;
itmOld = -2;
fn_actor_evCreate();
fn_player_actor_setup();


talk_act = true;
talk_key = CONFIG_KEY.SLCT;

menu_act = true;
menu_id[0] = "inv";
menu_key[0] = CONFIG_KEY.MENU_INV;
menu_id[1] = "pse";
menu_key[1] = CONFIG_KEY.MENU_PSE;
menu_delay_dur = 5;
menu_delay_durCurr = 0;




// dear diary, i've had one of those bad dreams again
