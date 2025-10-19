
if (is_array(lvl) == true)
{
	var l = lvl_curr;
	
	
	// Options
	if (is_array(lvl[l].option) == true && lvl_fader.stg == -1)
	{
		// Movement
		if (lvl[l].option_move.act == true)
		{
			var _option_move = lvl[l].option_move;
			var _option_currOld = lvl[l].option_curr;
			
			// List type
			if (_option_move.list.act == true)
			{
				lvl[l].option_curr += (fn_config_key_pressed(_option_move.list.key[1]) - fn_config_key_pressed(_option_move.list.key[0]));
				if (lvl[l].option_curr <= -1)
					lvl[l].option_curr = (array_length(lvl[l].option) - 1);
				if (lvl[l].option_curr >= array_length(lvl[l].option))
					lvl[l].option_curr = 0;
			}
			
			if (_option_currOld != lvl[l].option_curr)
			{
				_opt_curr = lvl[l].option_curr;
				_move_snd = lvl[l].option_move.snd;
				event_user(4);
				fn_aud_play(_move_snd, CONFIG_AUD_EMTR.MENU);
			}
		}
		var o = lvl[l].option_curr;
		_opt_curr = lvl[l].option_curr;
		
		
		// Confirmation
		if (lvl[l].option_confirm.act == true && fn_config_key_pressed(lvl[l].option_confirm.key) == true)
		{
			_confirm_snd = lvl[l].option_confirm.snd;
			event_user(0);
			if (_confirm_snd != -1)
				fn_aud_play(_confirm_snd, CONFIG_AUD_EMTR.MENU);
		}
		
		// Cancellation
		else if (lvl[l].option_cancel.act == true && fn_config_key_pressed(lvl[l].option_cancel.key) == true)
		{
			_cancel_snd = lvl[l].option_cancel.snd;
			event_user(1);
			if (_cancel_snd != -1)
				fn_aud_play(_cancel_snd, CONFIG_AUD_EMTR.MENU);
		}
		
		// Value cycling
		else if (lvl[l].option[o].value.act == true && (fn_config_key_pressed(lvl[l].option[o].value.key[0]) == true || fn_config_key_pressed(lvl[l].option[o].value.key[1]) == true))
		{
			event_user(2);
			fn_aud_play(global.player.thm[global.player.thm_curr].snd.move, CONFIG_AUD_EMTR.MENU, , , 1.5);
			for (var a = 0; a < (2 * !global.config.access.rdcdMot); a++)
			{
				if (fn_config_key_pressed(lvl[l].option[o].value.key[a]) == true)
					lvl[l].option[o].value.arrow[a].scale = lvl[l].option[o].value.arrow[a].scaleMax;
			}
		}
		
		
		// Value update
		for (var o = 0; o < array_length(lvl[l].option); o++)
		{
			if (lvl[l].option[o].value.act == true)
			{
				_option_curr = lvl[l].option_curr;
				event_user(3);
				break;
			}
		}
	}
	
	
	// Fade transition
	if (lvl_fader.stg > -1)
	{
		if (lvl_fader.stg == 0)
		{
			lvl[l].alpha = fn_lerp(lvl[l].alpha, 0, lvl_fader.alpSpd);
			if (lvl[l].alpha <= lvl_fader.alpJump)
			{
				lvl[l].alpha = 0;
				lvl_curr = lvl_fader.tgt.lvl;
				lvl_fader.stg = 1;
			}
		}
		else if (lvl_fader.stg == 1 && lvl_fader.wait_dur <= 0)
		{
			lvl[l].alpha = fn_lerp(lvl[l].alpha, 1, lvl_fader.alpSpd);
			if (lvl[l].alpha >= (1 - lvl_fader.alpJump))
			{
				lvl[l].alpha = 1;
				lvl_fader.stg = -1;
				if (lvl_fader.tgt.snd != -1)
					fn_aud_play(lvl_fader.tgt.snd, CONFIG_AUD_EMTR.MENU);
				lvl_fader.tgt.snd = -1;
				lvl_fader.wait_dur = 0;
			}
		}
		else if (lvl_fader.stg == 1 && lvl_fader.wait_dur > 0)
			lvl_fader.wait_dur -= 1;
	}
}


if (lang_curr != global.config.lang_curr) || (thm_curr != global.player.thm_curr)
{
	var _lvl_curr = lvl_curr;
	var _lvl_option_curr = -1;
	for (var l = 0; l < array_length(lvl); l++)
		_lvl_option_curr[l] = lvl[l].option_curr;
	event_perform(ev_create, 0);
	lvl_curr = _lvl_curr;
	lvl[lvl_curr].alpha = 1;
	for (var l = 0; l < array_length(lvl); l++)
		lvl[l].option_curr = _lvl_option_curr[l];
	lvl_fader.stg = -1;
	lvl_fader.tgt.lvl = -1;
}
