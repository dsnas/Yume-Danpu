/// @descr interaction - snd

if (int_stage == 0) // snd
{
	fn_audio_play(int_snd[int_snd_pos], false, VOL_CREATURES, int_snd_gainLvl[int_snd_pos], 0);
	int_stage = 1;
}
if (int_stage == 1) // unfreeze player and self
{
	if (int_delay >= 30)
	{
		move_stage = -1;
		int_stage = -1;
		int_delay = 0;
		wrld_chara.move_stage = -1;
	}
	else
		int_delay += 1;
}
