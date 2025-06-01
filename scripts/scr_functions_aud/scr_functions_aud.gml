
function fn_aud_play(_aud, _aud_volIdx, _aud_lps = 0, _aud_vol = 1, _aud_volDur = 0, _aud_pit = 1, _aud_ofs = 0) // (plays the specified audio with the given characteristics)
{
	aud = _aud;					// (audio)
	aud_volIdx = _aud_volIdx;	// (volume index) (index in the volume array from settings) (audio_vol will be multiplied to the volume in the array)
	aud_lps = _aud_lps;			// (loops)
	aud_vol = _aud_vol;			// (volume)
	aud_volDur = _aud_volDur;	// (volume duration) (duration of the volume fade-in)
	aud_pit = _aud_pit;			// (pitch)
	aud_ofs = _aud_ofs;			// (offset) (the time in seconds to start playing)
	
	fn_aud_fix(); // (adjusts the volume of the specified audio to be consistent with other sounds, and its offset)
	
	aud_id = audio_play_sound(aud, 0, aud_lps, 0, aud_ofs, aud_pit); // (plays audio)
	
	aud_vol = ((aud_vol * global.sett_vol[aud_volIdx]) * global.sett_vol[SETT_VOL.MAIN]);
	audio_sound_gain(aud_id, aud_vol, aud_volDur);
	
	audio_sound_pitch(aud_id, aud_pit);
	audio_sound_set_track_position(aud_id, aud_ofs);
}

function fn_aud_fix() // (adjusts the volume of the specified audio to be consistent with other sounds, but also its offset and pitch) (!!!!!!!!!!!! aud_vol MUST BE MULTIPLIED, NOT ADDED OR SUBTRACTED)
{
	if (aud == snd_wrld_chara_foot) // (player footsteps)
		aud_vol *= 0.75;
	
	
	var _thm = global.chara_thm;
	if (aud == global.thm_snd_optMove[_thm]) // (menu sounds)
	{
		if (_thm == THM.MADOT)
			aud_vol *= 0.4;
	}
	if (aud == global.thm_snd_optSlct[_thm])
	{
		if (_thm == THM.MADOT)
			aud_vol *= 0.2;
	}
	if (aud == global.thm_snd_optCncl[_thm])
	{
		if (_thm == THM.MADOT)
			aud_vol *= 0.2;
	}
	if (aud == global.thm_snd_optFail[_thm])
	{
		if (_thm == THM.MADOT)
			aud_vol *= 0.4;
	}
	
	
	if (aud == snd_wrld_npc_macaco_citizen_0) // (Macacolandia citizens sounds)
	{
		aud_vol *= 0.75;
		aud_ofs = 0.25;
	}
	if (aud == snd_wrld_npc_macaco_citizen_1)
		aud_ofs = 0.25;
	if (aud == snd_wrld_npc_macaco_citizen_2)
		aud_vol *= 0.35;
	if (aud == snd_wrld_npc_macaco_citizen_3)
	{
		aud_vol *= 1;
		aud_ofs = 0.25;
	}
	if (aud == snd_wrld_npc_macaco_citizen_5)
		aud_vol *= 0.5;
	if (aud == snd_wrld_npc_macaco_citizen_6)
	{
		aud_vol *= 0.35;
		aud_ofs = 0.25;
	}
	
	
	return aud_vol;
}

function fn_aud_stop(_aud)
{
	audio_stop_sound(_aud);
}

function fn_aud_isPl(_aud_id) // (returns if audio is playing)
{
	return audio_is_playing(_aud_id);
}
