
// Saves the the current music's information before updating it
for (var i = 0; i < mus_amtMax; i++)
{
	musOld_aud[i] = mus_aud[i];
	musOld_aud_id[i] = mus_aud_id[i];
	fn_rm_mus_add(i, -1);
}


if (room != temp_rm_cur)
	event_perform(ev_create, 0);

fn_rm_evStep();


// Updates the current music determined by the room's ID
for (var i = 0; i < mus_amtMax; i++)
{
	// Checks if the music that should be playing is already playing, saving its audio ID
	if (musOld_aud_id[i] != -1 && musOld_aud[i] == mus_aud[i])
		mus_aud_id[i] = musOld_aud_id[i];
		
	// Stops playing previous music
	if (musOld_aud[i] != -1 && musOld_aud[i] != mus_aud[i])
	{
		fn_aud_stop(musOld_aud_id[i]);
		fn_log($"Stopped playing previous music ({audio_get_name(musOld_aud[i])})");
	}
		
	// Starts playing the current music
	if (mus_aud[i] != -1 && mus_aud[i] != musOld_aud[i])
	{
		fn_aud_play(mus_aud[i], mus_volIdx[i], true, mus_vol[i], mus_volDur[i], mus_pit[i], 0);
		mus_aud_id[i] = aud_id;
			
		fn_log($"Started playing the current music ({audio_get_name(mus_aud[i])})");
	}
}
