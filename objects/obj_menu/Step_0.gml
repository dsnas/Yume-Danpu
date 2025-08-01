
fn_key_quick();

fn_menu_evStep();


// Option movement, selection and cancellation sequences
if (opt_len[lvl] > 0 && lvl_alp[lvl] == 1)
{	
	// Option movement sequence
	if (opt_move_act[lvl] == true)
	{
		var _opt_move_posOld = opt_move_pos[lvl];
		
		
		// Vertical and horizontal default types
		if (opt_move_type[lvl] == OPT_MOVE_TYPE_dfltVer) || (opt_move_type[lvl] == OPT_MOVE_TYPE_dfltHor)
		{
			var _key_0 = press_dn;
			var _key_1 = press_up;
			if (opt_move_type[lvl] == OPT_MOVE_TYPE_dfltHor)
			{
				_key_0 = press_rt;
				_key_1 = press_lt;
			}
			
			opt_move_pos[lvl] += (_key_0 - _key_1);
			if (opt_move_pos[lvl] < 0)
				opt_move_pos[lvl] = (opt_len[lvl] - 1);
			if (opt_move_pos[lvl] >= opt_len[lvl])
				opt_move_pos[lvl] = 0;
		}
		
		// Inventory's effects, items and themes list type
		else if (opt_move_type[lvl] == OPT_MOVE_TYPE_invOther)
		{
			// I don't know. I made this while only half-awake. Surprisingly, it WORKS ?
			
			if (press_rt == true) || (press_lt == true)
			{
				if (opt_move_pos[lvl] % 2 == 0)
					opt_move_pos[lvl] += 1;
				else if (opt_move_pos[lvl] % 2 == 1)
					opt_move_pos[lvl] -= 1;
			}
			
			if (press_dn == true)
			{
				if (opt_move_pos[lvl] + 2) <= (opt_len[lvl] - 1)
					opt_move_pos[lvl] += 2;
				else
					opt_move_pos[lvl] = (0 + (opt_move_pos[lvl] % 2));
			}
			else if (press_up == true)
			{
				if ((opt_move_pos[lvl] - 2) >= 0)
					opt_move_pos[lvl] -= 2;
				else
					opt_move_pos[lvl] = (opt_len[lvl] - 1 - !(opt_move_pos[lvl] % 2));
			}
		}
		
		
		// Starts playing the option movement sound
		if (_opt_move_posOld != opt_move_pos[lvl])
			fn_aud_play(opt_move_snd[lvl], CONFIG_AUD_STYLE.MENU);
	}
	
	
	// Option selection and cancellation sequences, and options' settings movement sequence
	var l = lvl;
	var o = opt_move_pos[lvl];
	
		// Options' settings movement sequence
	if (opt_config_text[l, o] != "%%%")
		fn_menu_opt_config_move();
	
		// Option selection sequence
	if (opt_slct_act[l] == true && opt_slct_key[l] != -1 && fn_key_pressed(opt_slct_key[l]) == true)
	{
		fn_menu_opt_slct(); // Retrieves the option selection sequence determined by the menu's ID
		
		// Starts playing the option selection sound
		if (opt_slct_snd[l, o] != -1)
			fn_aud_play(opt_slct_snd[l, o], CONFIG_AUD_STYLE.MENU);
	}
	
		// Option cancellation sequence
	else if (opt_cncl_act[l] == true && ((opt_cncl_key[l, 0] != -1 && fn_key_pressed(opt_cncl_key[l, 0]) == true) || (opt_cncl_key[l, 1] != -1 && fn_key_pressed(opt_cncl_key[l, 1]) == true)))
	{
		fn_menu_opt_cncl(); // Retrieves the option cancellation sequence determined by the menu's ID
		
		// Starts playing the option cancellation sound
		if (opt_cncl_snd[l] != -1)
			fn_aud_play(opt_cncl_snd[l], CONFIG_AUD_STYLE.MENU);
	}
}


// Updates the text of the options' settings
if (opt_len[lvl] > 0 && opt_config_text[lvl, opt_move_pos[lvl]] != "%%%")
	fn_menu_opt_config_update();


// Changes the current level to the new one
if (lvlNew != -1)
{
	lvl = lvlNew;
	lvl_alpDelay[lvl] = lvlNew_alpDelay;
	lvl_alpTgt_selfDstr[lvl] = lvlNew_selfDstr;
	lvl_alpTgt_gameEnd[lvl] = lvlNew_gameEnd;
	
	lvlNew = -1;
}


// Updates the alpha of each levels
for (var l = 0; l < (lvl_lenMax + 1); l++) // Loops through each level, including the empty one
{
	var _lvl_alpTgt = (l == lvl);
	if (lvl_alp[l] != _lvl_alpTgt)
	{
		if (lvl_alpDelay[l] <= 0)
		{
			lvl_alp[l] = fn_lerp(lvl_alp[l], _lvl_alpTgt, lvl_alpSpd);
			var _lvl_alpTgtDiff = abs(lvl_alp[l] - _lvl_alpTgt); // Difference between the current alpha and the target alpha
			if (_lvl_alpTgtDiff <= 0.05)
			{
				lvl_alp[l] = _lvl_alpTgt;
			
				// Destroys itself
				if (lvl_alpTgt_selfDstr[l] == true)
				{
					if (fn_obj_exists(obj_player) == true)
					{
						with (obj_player)
						{
							move_stg = -1;
							menu_delay_dur = 5;
						}
					}
					
					fn_obj_destroy();
				}
				
				// Ends the game
				if (lvl_alpTgt_gameEnd[l] == true)
					game_end();
			}
		}
		else
			lvl_alpDelay[l] -= 1;
	}
}


// Reloads all the text if the language or theme changed
if (config_langOld != global.config_langCurr) || (thmOld != global.player_thmCurr)
{
	for (l = 0; l < lvl_lenMax; l++)
		opt_move_posOld[l] = opt_move_pos[l];
	
	fn_menu_evCreate_0();
	config_langOld = global.config_langCurr;
	thmOld = global.player_thmCurr;
	
	for (var l = 0; l < lvl_lenMax; l++)
		opt_move_pos[l] = opt_move_posOld[l];
}
