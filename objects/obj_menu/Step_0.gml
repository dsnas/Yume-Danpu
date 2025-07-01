
fn_config_key_quick();

fn_menu_evStep();


// Option movement, selection and cancellation sequences
if (opt_amt[lvl] > 0)
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
				opt_move_pos[lvl] = (opt_amt[lvl] - 1);
			if (opt_move_pos[lvl] >= opt_amt[lvl])
				opt_move_pos[lvl] = 0;
		}
		
		// Inventory's effects, items and themes list type
		else if (opt_move_type[lvl] == OPT_MOVE_TYPE_invList)
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
				if (opt_move_pos[lvl] + 2) <= (opt_amt[lvl] - 1)
					opt_move_pos[lvl] += 2;
				else
					opt_move_pos[lvl] = (0 + (opt_move_pos[lvl] % 2));
			}
			else if (press_up == true)
			{
				if ((opt_move_pos[lvl] - 2) >= 0)
					opt_move_pos[lvl] -= 2;
				else
					opt_move_pos[lvl] = (opt_amt[lvl] - 1 - !(opt_move_pos[lvl] % 2));
			}
		}
		
		
		// Starts playing the option movement sound
		if (_opt_move_posOld != opt_move_pos[lvl])
			fn_aud_play(opt_move_snd[lvl], CONFIG_VOLTYPE.MENU);
	}
	
	
	// Option selection and cancellation sequences, and options' settings movement sequence
	var l = lvl;
	var o = opt_move_pos[lvl];
	
		// Options' settings movement sequence
	if (o < array_length(opt_config_text[l]) && opt_config_text[l, o] != "%%%")
		fn_menu_opt_config_move();
	
		// Option selection sequence
	if (opt_slct_key[l] != -1 && fn_config_key_press(opt_slct_key[l]) == true)
	{
		fn_menu_opt_slct(); // Retrieves the option selection sequence determined by the menu's ID
		
		// Starts playing the option selection sound
		if (opt_slct_snd[l, o] != -1)
			fn_aud_play(opt_slct_snd[l, o], CONFIG_VOLTYPE.MENU);
	}
	
		// Option cancellation sequence
	else if (opt_cncl_key[l] != -1 && fn_config_key_press(opt_cncl_key[l]) == true)
	{
		fn_menu_opt_cncl(); // Retrieves the option cancellation sequence determined by the menu's ID
		
		// Starts playing the option cancellation sound
		if (opt_cncl_snd[l, o] != -1)
			fn_aud_play(opt_cncl_snd[l, o], CONFIG_VOLTYPE.MENU);
	}
}


// 
if (lvlNew != -1)
{
	lvl = lvlNew;
	lvl_alpDelay[lvl] = lvlNew_alpDelay;
	lvl_selfDstr[lvl] = lvlNew_selfDstr;
	lvl_gameEnd[lvl] = lvlNew_gameEnd;
	
	lvlNew = -1;
}


// Updates the alpha of each level
for (var l = 0; l < (lvl_amtMax + 1); l++)
{
	if (lvl_alpDelay[l] <= 0)
	{
		// Changes the alpha of the level
		var _alpTgt = (l == lvl);
		lvl_alp[l] = fn_lerp(lvl_alp[l], _alpTgt, lvl_alpSpd);
		
		var _alpDiff = abs(lvl_alp[l] - _alpTgt); // Difference between the current alpha and the target alpha
		var _alpSlack = 0.05;
		if (_alpDiff <= _alpSlack)
		{
			lvl_alp[l] = _alpTgt;
			
			// Destroys itself
			if (lvl_selfDstr[l] == true)
				fn_obj_destroy();
			
			// Ends the game
			if (lvl_gameEnd[l] == true)
				game_end();
		}
	}
	else
		lvl_alpDelay[l] -= 1;
}


// Reloads all the text if the selected language changed
if (config_langOld != global.config_lang)
{
	fn_menu_evCreate_0();
	config_langOld = global.config_lang;
}



/*
// Update the text of the options' settings
fn_menu_opt_config_upd();

// Movement sequence of the option's setting
if (opt_move_pos[lvl] < array_length(opt_config_text[lvl]) && opt_config_text[lvl, opt_move_pos[lvl]] != "%%%" && (press_lt == true || press_rt == true))
{
	fn_menu_opt_config_move();
	fn_aud_play(opt_move_snd[lvl], CONFIG_VOLTYPE.MENU);
}
*/