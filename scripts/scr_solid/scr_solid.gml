
//////// Functions related to solid objects


function fn_solid_evCreate()
{
	fn_draw_self_setup();
	
	
	// Types
	SOLID_TYPE =
	{
		DFLT : 0, // Default type
		TALKER : 1, // Talker type, is an interactable object
		ENTITY : 2, // Entity type, is an entity
		PLAYER : 3 // Player type, is the player
	}

	solid_typeCurr = SOLID_TYPE.DFLT; // Determines the current type
	
	
	// Noise, audio that can only be heard if the player is near the object
	noise =
	{
		act : false,
		aud_asset : -1,
		aud_style : -1,
		aud_loops : true,
		aud_vol : 0,
		aud_id : -1,
		
		delay :
		{
			act : false,
			durMin : 0,
			durMax : 0,
			durCurr : 0
		}
	}
}
function fn_solid_evStep()
{
	// Noise
	if (noise.act == true && noise.aud_asset != -1 && noise.aud_style != -1)
	{	
		if (noise.aud_id == -1)
		{
			if (noise.delay.act == false) || (noise.delay.act == true && noise.delay.durCurr <= 0)
			{
				if (noise.delay.act == true)
					noise.delay.durCurr = irandom_range(noise.delay.durMin, noise.delay.durMax);
				
				noise.aud_id = fn_aud_play(noise.aud_asset, noise.aud_style, 0, , , noise.aud_loops);
			}
			else
				noise.delay.durCurr -= 1;
		}
		else
		{
			if (audio_is_playing(noise.aud_id) == true)
			{
				var _vol_distMin = (160 + 40);
				var _vol_distCurr = clamp(distance_to_object(obj_player), 0, _vol_distMin);
				var _volTgt = (1 - (_vol_distCurr / _vol_distMin));
				var _vol_spd = 0.05;
				noise.aud_vol = lerp(noise.aud_vol, _volTgt, _vol_spd);
				
				fn_log(noise.aud_vol);
				fn_aud_vol(noise.aud_asset, noise.aud_id, noise.aud_style, noise.aud_vol);
			}
			else
				noise.aud_id = -1;
		}
	}
}