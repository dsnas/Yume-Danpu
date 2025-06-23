
if (type == RMTRANS_TYPE.FADE)
{
	type_fade_alp = lerp(type_fade_alp, type_fade_alpTgt, type_fade_alpSpd);
		
	var _slack = 0.05;
	if (stg == 0 && type_fade_alp >= (type_fade_alpTgt - _slack)) || (stg == 1 && type_fade_alp <= _slack)
	{
		type_fade_alp = type_fade_alpTgt;
			
		if (stg == 0)
		{
			room_goto(rmTgt);
			type_fade_alpTgt = 0;
			stg = 1;
		}
		else if (stg == 1)
		{
			fn_obj_dstr();
		}
	}
}
