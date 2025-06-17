
//////// Functions related to music


function fn_mus_setup() // Sets up array that will store the music's information
{
	mus_amtMax = 5;
	for (var i = 0; i < mus_amtMax; i++)
	{
		mus_aud[i] = -1;
		mus_aud_volIdx[i] = VOL_IDX.MUS;
		mus_aud_volDur[i] = 0;
		mus_aud_id[i] = -1;
	}
}
function fn_mus() // Starts or stops the music that should or not be playing, based on the room the player is in
{
	for (var i = 0; i < mus_amtMax; i++) // Previous music's information
	{
		musOld_aud[i] = mus_aud[i];
		musOld_aud_id[i] = mus_aud_id[i];
	}
	fn_mus_setup();
	
	
	// Main menu
	if (room == temp_rm_menu_home)
	{
		if (global.menu_home_obj != -1 && global.menu_home_obj.lvl != global.menu_home_obj.lvl_amtMax && global.flag[0] == true)
			mus_aud[0] = mus_menu_home;
	}
	
	// Macacolandia
	if (room == rm_macaco)
	{
		mus_aud[0] = mus_macaco;
	}
	
	// Fenda bo Pikini
	if (room == rm_wrld_pikini)
	{
		mus_aud[0] = mus_wrld_pikini;
	
		mus_aud[1] = snd_wrld_pikini;
		mus_aud_volIdx[1] = VOL_IDX.AMBIENT;
	}
	
	
	for (var i = 0; i < mus_amtMax; i++)
	{
		// Checks if the music that should be playing is already playing, saving its audio ID
		if (musOld_aud_id[i] != -1 && musOld_aud[i] == mus_aud[i])
			mus_aud_id[i] = musOld_aud_id[i];
		
		// Stops playing previous music
		if (musOld_aud[i] != -1 && musOld_aud[i] != mus_aud[i])
		{
			fn_aud_stop(musOld_aud_id[i]);
			fn_dbg_log($"Stopped playing previous music ({audio_get_name(musOld_aud[i])})");
		}
		
		// Starts playing the current music
		if (mus_aud[i] != -1 && mus_aud[i] != musOld_aud[i])
		{
			fn_aud_play(mus_aud[i], mus_aud_volIdx[i], true, 1, mus_aud_volDur[i], 1, 0);
			mus_aud_id[i] = aud_id;
			
			fn_dbg_log($"Started playing the current music ({audio_get_name(mus_aud[i])})");
		}
	}
}


