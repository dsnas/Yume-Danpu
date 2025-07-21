
if (active == true)
{
	// Room's music [#0]
	for (var m = 0; m < mus_lenMax; m++)
	{
		// Saves the previous music's main data and resets of the current's
		musOld_asset[m] = mus_asset[m];
		musOld_id[m] = mus_id[m];
	
		fn_rmCtrl_mus_add(m, -1);
	}


	fn_rmCtrl_evStep();


	// Room's music [#1]
	for (var m = 0; m < mus_lenMax; m++)
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
			mus_id[m] = fn_aud_play(mus_asset[m], mus_style[m], mus_vol[m], , mus_pch[m], true);
			fn_log($"Started playing the current music ({audio_get_name(mus_asset[m])})");
		}
	
		// Updates the current music's data
		else if (mus_asset[m] != -1 && mus_asset[m] == musOld_asset[m] && mus_id[m] != -1)
		{
			fn_aud_vol(mus_asset[m], mus_id[m], mus_style[m], mus_vol[m]);
			fn_aud_pch(mus_asset[m], mus_id[m], mus_pch[m]);
		}
	}
}
