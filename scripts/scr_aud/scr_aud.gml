
//////// Functions related to audio, like sounds and music


function fn_aud_play(_asset, _style, _vol = 1, _ofs = 0, _pch = 1, _loops = false)
{
	var _id = audio_play_sound(_asset, 0, false);
	fn_aud_vol(_asset, _id, _style, _vol);
	fn_aud_ofs(_asset, _id, _ofs);
	fn_aud_pch(_asset, _id, _pch);
	audio_sound_loop(_id, _loops);
	
	return _id;
}
function fn_aud_stop(_id)
{
	audio_stop_sound(_id);
}

function fn_aud_vol(_asset, _id, _style, _vol = 1)
{
	_vol = fn_aud_volData(_asset, _vol);
	_vol *= global.config_aud_style[_style].vol;
	_vol *= global.config_aud_style[CONFIG_AUD_STYLE.MASTER].vol;
	
	audio_sound_gain(_id, _vol, 0);
}
function fn_aud_volData(_asset, _vol)
{
	// _vol MUST ONLY BE MULTIPLIED, NOT ADDED or SUBTRACTED
	
	switch (_asset)
	{
		// Menu
			// Default theme
		case snd_player_thm_opt_move_0: // The sound that should be used as reference for all others
			_vol = 1;
			break;
		case snd_player_thm_opt_slct_0:
			_vol *= 1.35;
			break;
		case snd_player_thm_opt_cncl_0:
			_vol *= 0.9;
			break;
		case snd_player_thm_unlock_0_0:
		case snd_player_thm_unlock_1_0:
		case snd_player_thm_unlock_2_0:
			_vol *= 0.45;
			break;
			// Madotsuki theme
		case snd_player_thm_opt_move_1:
			_vol *= 0.4;
			break;
		case snd_player_thm_opt_slct_1:
			_vol *= 0.2;
			break;
		case snd_player_thm_opt_cncl_1:
			_vol *= 0.2;
			break;
		case snd_player_thm_opt_fail_1:
			_vol *= 0.4;
			break;
		
		
		// Player
		case snd_player_fstep:
			_vol *= 0.75;
			break;
		
		
		// Items
		case snd_itm_kart_eng:
			_vol *= 0.65;
			break;
		case snd_itm_kart_brk:
			_vol *= 0.5;
			break;
		case snd_itm_kart_hit:
			_vol *= 0.75;
			break;
		
		
		// Interaction
		case snd_hulapoca:
			_vol *= 0.5;
			break;
		case snd_penyplocde:
			_vol *= 0.35;
			break;
		
		
		// Macacolandia citizens
		case snd_entity_macaco_citizen_0:
			_vol *= 0.5;
			break;
		case snd_entity_macaco_citizen_2:
			_vol *= 0.3;
			break;
		case snd_entity_macaco_citizen_3:
			_vol *= 0.85;
			break;
		case snd_entity_macaco_citizen_4:
			_vol *= 0.65;
			break;
		case snd_entity_macaco_citizen_5:
			_vol *= 0.5;
			break;
		case snd_entity_macaco_citizen_6:
			_vol *= 0.35;
			break;
	}
	
	return _vol;
	// one of the WORST fucking FUNCTIONS i've EVER made in my LIFE.  Jesus       !!!!!
}

function fn_aud_ofs(_asset, _id, _ofs = 0)
{
	_ofs = fn_aud_ofsData(_asset, _ofs);
	
	audio_sound_set_track_position(_id, _ofs);
}
function fn_aud_ofsData(_asset, _ofs)
{
	// _ofs MUST ONLY BE ADDED, NOT SUBTRACTED or MULTIPLIED
	
	switch (_asset)
	{
		// Menu sounds
			// Default theme
		case snd_player_thm_start_0:
			_ofs += 0.15;
			break;
		
		
		// Macacolandia citizens
		case snd_entity_macaco_citizen_0:
			_ofs += 0.25;
			break;
		case snd_entity_macaco_citizen_1:
			_ofs += 0.25;
			break;
		case snd_entity_macaco_citizen_3:
			_ofs += 0.25;
			break;
		case snd_entity_macaco_citizen_6:
			_ofs += 0.25;
			break;
	}
	
	return _ofs;
	// one of the WORST fucking FUNCTIONS i've EVER made in my LIFE Part II: The Hype Never Dies.  Jesus       !!!!!
}

function fn_aud_pch(_asset, _id, _pch = 1)
{
	audio_sound_pitch(_id, _pch);
	
	// _pch MUST ONLY BE ADDED or SUBTRACTED, NOT MULTIPLIED
}




//  MISERABLE.  I AM MISERABLE.  THAT'S WHAT I AM. MISERABLE.  BUT DON'T CALL ME THAT. DON'T CALL ME MISERABLE.  BECAUSE.  THAT WILL MAKE ME.  EVEN MORE.  MISERABLE.
