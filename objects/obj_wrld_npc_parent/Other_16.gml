/// @descr int - snd (0)

if (int_stage == 0) // stop previous snd and play new one
{
	if (int_snd_pos != -1) // stop previous snd
		fn_audio_stop(int_snd[int_snd_pos]);
	
	event_user(7); // (child) int - snd (0)
	
	fn_audio_play(int_snd[int_snd_pos], false, SETT_VOL_NPC, int_snd_gainLvl[int_snd_pos], 0); // play snd
	fn_audio_time(audio_id, int_snd_time[int_snd_pos]);
	
	int_delay = (60 * 1.5);
	int_stage = 1;
}
if (int_stage == 1) // unfreeze player and self
{
	if (int_delay <= 0)
	{
		int_stage = -1;
		int_delay = 0;
		move_stage = -1;
		
		wrld_chara.move_stage = -1;
	}
	else
		int_delay -= 1;
}
