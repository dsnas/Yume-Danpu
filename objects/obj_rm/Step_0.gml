
// Saves the the current music's information before updating it
for (var i = 0; i < mus_amtMax; i++)
{
	musOld_asset[i] = mus_asset[i];
	musOld_id[i] = mus_id[i];
	fn_rm_mus_add(i, -1);
}


if (room != rm_curTemp)
	event_perform(ev_create, 0);

fn_rm_evStep();


// Updates the current music determined by the room's ID
for (var i = 0; i < mus_amtMax; i++)
{
	// Checks if the music that should be playing is already playing, saving its audio ID
	if (musOld_id[i] != -1 && musOld_asset[i] == mus_asset[i])
		mus_id[i] = musOld_id[i];
		
	// Stops playing previous music
	if (musOld_asset[i] != -1 && musOld_asset[i] != mus_asset[i])
	{
		fn_aud_stop(musOld_id[i]);
		fn_log($"Stopped playing previous music ({audio_get_name(musOld_asset[i])})");
	}
		
	// Starts playing the current music
	if (mus_asset[i] != -1 && mus_asset[i] != musOld_asset[i])
	{
		fn_aud_play(mus_asset[i], mus_volType[i], mus_vol[i], 0, mus_pitch[i], true);
		mus_id[i] = aud_id;
			
		fn_log($"Started playing the current music ({audio_get_name(mus_asset[i])})");
	}
}