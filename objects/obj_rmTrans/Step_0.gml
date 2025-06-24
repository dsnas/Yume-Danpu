
if (type == global.rmTrans_type.fade)
{
	if (delay <= 0)
	{
		type_fade_alp = lerp(type_fade_alp, type_fade_alpTgt, type_fade_alpSpd);
	
		var _slack = 0.05;
		if (stg == 0 && type_fade_alp >= (type_fade_alpTgt - _slack)) || (stg == 1 && type_fade_alp <= _slack)
		{
			type_fade_alp = type_fade_alpTgt;
			
			if (stg == 0)
			{
				stg = 1;
				delay = 15;
				type_fade_alpTgt = 0;
				room_goto(tgt);
			}
			else if (stg == 1)
			{
				fn_obj_dstr();
			}
		}
	}
	else
		delay -= 1;
}
