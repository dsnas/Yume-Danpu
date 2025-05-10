/// @descr create

image_speed = random_range(0.5, 1.5);



fac_spr[FAC_LT]	= spr_wrld_npc_macaco_citizen;
fac_spr[FAC_RT]	= spr_wrld_npc_macaco_citizen;
fac_spr[FAC_UP]		= spr_wrld_npc_macaco_citizen;
fac_spr[FAC_DN]	= spr_wrld_npc_macaco_citizen;



for (var i = 0; i < int_snd_amt; i++)
{
	var _audio = asset_get_index("snd_wrld_npc_macaco_citizen_" + string(i));
	if (dbg == true)
		fn_dbg(_audio);
	
	if (_audio != -1)
	{
		int_snd[i] = _audio;
		continue;
	}
	else
	{
		int_snd_amt = i;
		break;
	}
}

int_snd_gainLvl[0] = 0.75;
int_snd_gainLvl[2] = 0.35;
int_snd_gainLvl[3] = 1.25;
int_snd_gainLvl[5] = 0.5;
int_snd_gainLvl[6] = 0.35;

int_snd_time[0] = 0.25;
int_snd_time[1] = 0.25;
int_snd_time[3] = 0.25;
int_snd_time[6] = 0.25;
