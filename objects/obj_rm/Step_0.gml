
// Saves the the current music's information before updating it
for (var m = 0; m < mus_amtMax; m++)
{
	musOld_asset[m] = mus_asset[m];
	musOld_id[m] = mus_id[m];
	fn_rm_mus_add(m, -1);
}


if (room != rm_curTemp)
	event_perform(ev_create, 0);

fn_rm_evStep();


// Updates the current music determined by the room's ID
for (var m = 0; m < mus_amtMax; m++)
{
	// Checks if the music that should be playing is already playing, saving its audio ID
	if (musOld_id[m] != -1 && musOld_asset[m] == mus_asset[m])
		mus_id[m] = musOld_id[m];
		
	// Stops playing previous music
	if (musOld_asset[m] != -1 && musOld_id[m] != -1 && mus_asset[m] != musOld_asset[m])
	{
		fn_aud_stop(musOld_id[m]);
		fn_log($"Stopped playing previous music ({audio_get_name(musOld_asset[m])})");
	}
		
	// Starts playing the current music
	if (mus_asset[m] != -1 && mus_asset[m] != musOld_asset[m])
	{
		fn_aud_play(mus_asset[m], mus_volType[m], mus_vol[m], , mus_pitch[m], true);
		mus_id[m] = aud_id;
		
		fn_log($"Started playing the current music ({audio_get_name(mus_asset[m])})");
	}
	
	// Updates the current music's data
	else if (mus_asset[m] != -1 && mus_asset[m] == musOld_asset[m] && mus_id[m] != -1)
	{
		fn_aud_vol(mus_id[m], mus_volType[m], mus_vol[m]);
		fn_aud_pitch(mus_id[m], mus_pitch[m]);
	}
}