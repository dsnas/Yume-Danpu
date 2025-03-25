/// @descr fac

/*
i hate that this is almost identical to obj_wrld_chara's user event 0, but i'm not going to do anything about it. it wouldn't be useful, it would only take time.
i don't even know what i could do to make it "more stylish".
*/



FAC_LEFT = 0;
FAC_RIGHT = 1;
FAC_UP = 2;
FAC_DOWN = 3;
	
fac_spr[FAC_LEFT]		= spr_wrld_npc;
fac_spr[FAC_RIGHT]		= spr_wrld_npc;
fac_spr[FAC_UP]			= spr_wrld_npc;
fac_spr[FAC_DOWN]		= spr_wrld_npc;
	
fac_spdMul[FAC_LEFT]	= -1;
fac_spdMul[FAC_RIGHT]	= 1;
fac_spdMul[FAC_UP]		= -1;
fac_spdMul[FAC_DOWN]	= 1;
	
	
	
FAC_ORIENT_HOR = 0;
FAC_ORIENT_VER = 1;
	
fac_orient[FAC_LEFT]	= FAC_ORIENT_HOR;
fac_orient[FAC_RIGHT]	= FAC_ORIENT_HOR;
fac_orient[FAC_UP]		= FAC_ORIENT_VER;
fac_orient[FAC_DOWN]	= FAC_ORIENT_VER;
