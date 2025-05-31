
function fn_wrld_interactable_id() // retrieves the ID of the interactable, which determines its behavior and appearance
{
	interactable_id = "";
	
	if (wrld_rm == rm_wrld_dbg)
		interactable_id = "dbg_0";
}
function fn_wrld_interactable_create() // create event based on the interactable's ID
{
	var i = interactable_id;
	
	if (i == "dbg_0")
	{
		image_alpha = 1;
		chirp_aud[0] = snd_hulapoca;
	}
}
function fn_wrld_interactable_step() // step event based on the interactable's ID
{
	var i = interactable_id;
	
	if (i == "dbg_0")
	{
		if (poke_stg == 0)
			chirp_idx = 0;
		fn_wrld_interactable_chirp();
	}
}

function fn_wrld_interactable_chirp() // chirp (plays audio as an answer to being interacted with)
{
	if (poke_stg == 0)
	{
		fn_aud_play(chirp_aud[chirp_idx], chirp_aud_volIdx[chirp_idx]);	
		poke_dur = poke_durMax;
		poke_stg = 1;
	}
	if (poke_stg == 1)
	{
		poke_dur -= 1;
		if (poke_dur <= 0)
		{
			poke_stg = -1;
			if (isNpc == true)
				move_stg = -1;
			
			wrld_chara.move_stg = -1;
		}
	}
}
