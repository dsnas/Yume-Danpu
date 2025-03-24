
function fn_wrld_chara_fac() // get each facing direction information
{
	FAC_LEFT = 0;
	FAC_RIGHT = 1;
	FAC_UP = 2;
	FAC_DOWN = 3;
	
	FAC_ORIENT_HOR = 0;
	FAC_ORIENT_VER = 1;
	
	
	
	fac_inp[FAC_LEFT]		= inp.hold_left;
	fac_inp[FAC_RIGHT]		= inp.hold_right;
	fac_inp[FAC_UP]			= inp.hold_up;
	fac_inp[FAC_DOWN]		= inp.hold_down;
	
	fac_spr[FAC_LEFT]		= spr_wrld_chara_left;
	fac_spr[FAC_RIGHT]		= spr_wrld_chara_right;
	fac_spr[FAC_UP]			= spr_wrld_chara_up;
	fac_spr[FAC_DOWN]		= spr_wrld_chara_down;
	
	fac_spdMul[FAC_LEFT]	= -1;
	fac_spdMul[FAC_RIGHT]	= 1;
	fac_spdMul[FAC_UP]		= -1;
	fac_spdMul[FAC_DOWN]	= 1;
	
	fac_orient[FAC_LEFT]	= FAC_ORIENT_HOR;
	fac_orient[FAC_RIGHT]	= FAC_ORIENT_HOR;
	fac_orient[FAC_UP]		= FAC_ORIENT_VER;
	fac_orient[FAC_DOWN]	= FAC_ORIENT_VER;
}

function fn_wrld_chara_coll()
{
	coll_xPlc[FAC_LEFT]		= (x - move_timeMax);
	coll_xPlc[FAC_RIGHT]	= (x + move_timeMax);
	coll_xPlc[FAC_UP]		= x;
	coll_xPlc[FAC_DOWN]		= x;
	
	coll_yPlc[FAC_LEFT]		= y;
	coll_yPlc[FAC_RIGHT]	= y;
	coll_yPlc[FAC_UP]		= (y - move_timeMax);
	coll_yPlc[FAC_DOWN]		= (y + move_timeMax);
}

























