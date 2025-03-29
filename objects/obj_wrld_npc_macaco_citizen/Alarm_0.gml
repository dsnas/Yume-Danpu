
image_speed = random_range(0.5, 1.5);



int_snd[0] = snd_wrld_npc_macaco_citizen_0;
int_snd[1] = snd_wrld_npc_macaco_citizen_1;
int_snd[2] = snd_wrld_npc_macaco_citizen_2;
int_snd[3] = snd_wrld_npc_macaco_citizen_3;
int_snd[4] = snd_wrld_npc_macaco_citizen_4;
int_snd[5] = snd_wrld_npc_macaco_citizen_5;
int_snd[6] = snd_wrld_npc_macaco_citizen_6;

fac_spr[FAC_LEFT]	= spr_wrld_npc_macaco_citizen;
fac_spr[FAC_RIGHT]	= fac_spr[FAC_LEFT];
fac_spr[FAC_UP]		= fac_spr[FAC_LEFT];
fac_spr[FAC_DOWN]	= fac_spr[FAC_LEFT];



event_inherited();
