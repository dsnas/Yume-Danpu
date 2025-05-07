
if (int_delay <= 0)
{
	if (int_stage == 0)
	{
		fn_audio_play(snd_hulapoca, false, SETT_VOL_OBJ, 1, 0);
	
		int_stage = 1;
		int_delay = 30;
	}
	else if (int_stage == 1)
	{
		wrld_chara.move_stage = -1;
		int_stage = -1;
	}
}
else
	int_delay -= 1;
