
function fn_mus_start() // start mus (starts/resets the array that will store the music's information)
{
	mus_amt = 5;
	for (var i = 0; i < mus_amt; i++)
	{
		mus_aud[i] = -1;
		mus_id[i] = -1;
		mus_volIdx[i] = SETT_VOL.MUS;
		mus_volDur[i] = 0;
	}
}

function fn_mus_upd() // upd mus (updates, starts and stops the music of the player is currently in)
{
	for (var i = 0; i < mus_amt; i++) // (starts the array that stores the previous music's information)
	{
		musOld_aud[i] = mus_aud[i];
		musOld_id[i] = mus_id[i];
		musOld_volIdx[i] = mus_volIdx[i];
		musOld_volDur[i] = mus_volDur[i];
	}
	
	fn_mus_start(); // start mus (starts/resets the array that will store the music's information)
	
	
	
	
	if (room == temp_rm_menu_main) // main menu
	{
		mus_aud[0] = mus_menu_main;
	}
	
	if (room == rm_wrld_macaco) // Macacolandia
	{
		mus_aud[0] = mus_wrld_macaco;
		mus_vol[0] = 0.25;
	}

	if (room == rm_wrld_pikini) // Fenda bo Pikini
	{
		mus_aud[0] = mus_wrld_pikini;
	
		mus_aud[1] = snd_wrld_pikini;
		mus_volIdx[1] = SETT_VOL.AMB;
	}
	
	
	
	
	for (var i = 0; i < mus_amt; i++)
	{
		if (musOld_id[i] != -1 && musOld_aud[i] == mus_aud[i])
			/* if current music is playing, saves its audio ID */ mus_id[i] = musOld_id[i];
		
		if (musOld_aud[i] != -1 && musOld_aud[i] != mus_aud[i])
		{
			/* stops old/previous music */ fn_aud_stop(musOld_id[i]);
			fn_dbg_log(musOld_id[i]);
		}
		
		if (mus_aud[i] != -1 && mus_aud[i] != musOld_aud[i])
		{
			/* starts music */ fn_aud_play(mus_aud[i], mus_volIdx[i], true, 1, mus_volDur[i], 1, 0);
			mus_id[i] = aud_id;
		}
	}
}


