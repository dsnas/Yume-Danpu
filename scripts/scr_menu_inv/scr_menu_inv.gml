
//////// Functions related to the inventory menu


// Functions related to setting up the menu
function fn_menu_inv_evCreate_0()
{
	// Main level [#0]
	LVL_MAIN = 0;
	var l = LVL_MAIN;
	
	
	
	
	// All levels
	for (var l = 0; l < lvl_amtMax; l++)
	{
		// Dark translucent background
		var _rect_alp = 0.5;
		if (l != LVL_MAIN)
			_rect_alp = 0.75;
		fn_menu_rect_add(l, 0, 0, 0, 320, 240, global.thm_col[global.thm].blackDark, _rect_alp);
	}
	
	
	
	
	// Main level [#1]
	var l = LVL_MAIN;
	
	
		// Information box
	var _box_x = round(draw_dist / 1);
	var _box_y = round(draw_dist / 2);
	var _box_w = (draw_dist * 6);
	var _box_h = (draw_dist * 7);
	fn_menu_box_add(l, 0, _box_x, _box_y, _box_w, _box_h);
	
			// Player's picture frame
	main_picFrm_spr = global.thm_plyrFrm_spr[global.thm];
	main_picFrm_w = fn_spr_w(main_picFrm_spr);
	main_picFrm_h = fn_spr_h(main_picFrm_spr);
	main_picFrm_x = (box_x[l, 0] + round(box_w[l, 0] / 2) - round(main_picFrm_w / 2));
	main_picFrm_y = (box_y[l, 0] + draw_dist);
	
			// Player's picture
	main_pic_spr = obj_player.move_dir_spr[obj_player.MOVE_DIR_DN];
	main_pic_snd = snd_player_fstep;
	var c = irandom_range(1, 100);
	if (c == 1)
	{
		main_pic_spr = spr_entity_macaco_citizen;
		main_pic_snd = snd_entity_macaco_citizen_1;
	}
	
	main_pic_w = fn_spr_w(main_pic_spr);
	main_pic_h = fn_spr_h(main_pic_spr);
	main_pic_x = (main_picFrm_x + round(main_picFrm_w / 2) - round(main_pic_w / 2));
	main_pic_y = (main_picFrm_y + round(main_picFrm_h / 2) + round(main_pic_h / 2) - 1);
	main_pic_xSc = 1;
	main_pic_ySc = 1;
	main_pic_scAmt = 0.2;
	main_pic_scSpd = 0.35;
	
			// Player's name
	var _name_text = global.player_name;
	fn_menu_info_add(l, 0, _name_text);
	var _name_w = info_w[l, 0];
	var _name_h = info_h[l, 0];
	var _name_x = (main_picFrm_x + round(main_picFrm_w / 2) - round(_name_w / 2));
	var _name_yDist = round(draw_dist / 8);
	var _name_y = (main_picFrm_y + main_picFrm_h + _name_yDist);
	info_x[l, 0] = _name_x;
	info_y[l, 0] = _name_y;
	
			// Player's currency [#0]
	var _ccy_text = global.player_ccy[global.player_awake];
	fn_menu_info_add(l, 1, _ccy_text);
	var _ccy_w = info_w[l, 1];
	var _ccy_h = info_h[l, 1];
	
			// Player's money [#0]
	var _mny_text = global.player_mny[global.player_awake];
	fn_menu_info_add(l, 2, _mny_text);
	var _mny_w = info_w[l, 2];
	
			// Icon of the player's money [#0]
	main_mnyIcon_spr = spr_menu_inv_mnyIcon;
	main_mnyIcon_w = fn_spr_w(main_mnyIcon_spr);
	main_mnyIcon_h = fn_spr_h(main_mnyIcon_spr);
	var _mnyIcon_xTextGap = round(draw_dist / 4);
	var _mnyIcon_wAll = (main_mnyIcon_w + _mnyIcon_xTextGap + _ccy_w + _mny_w);
	main_mnyIcon_x = (main_picFrm_x + round(main_picFrm_w / 2) - round(_mnyIcon_wAll / 2) - 1);
	var _mnyIcon_yNameGap = (draw_dist / 2);
	main_mnyIcon_y = (_name_y + _name_h + _mnyIcon_yNameGap);
	main_mnyIcon_col = global.thm_col[global.thm].whiteLight;
	
			// Player's currency [#1]
	var _ccy_x = (main_mnyIcon_x + main_mnyIcon_w + _mnyIcon_xTextGap);
	var _ccy_y = (main_mnyIcon_y + round(main_mnyIcon_h / 2) - round(_ccy_h / 2) - 1);
	var _ccy_col_0 = global.thm_col[global.thm].grayLight;
	var _ccy_col_1 = global.thm_col[global.thm].grayDark;
	info_x[l, 1] = _ccy_x;
	info_y[l, 1] = _ccy_y;
	info_col[l][1][0] = _ccy_col_0;
	info_col[l][1][1] = _ccy_col_1;
	
			// Player's money [#1]
	var _mny_x = (_ccy_x + _ccy_w);
	var _mny_y = _ccy_y;
	var _mny_col_0 = global.thm_col[global.thm].whiteLight;
	var _mny_col_1 = global.thm_col[global.thm].whiteDark;
	info_x[l, 2] = _mny_x;
	info_y[l, 2] = _mny_y;
	info_col[l][2][0] = _mny_col_0;
	info_col[l][2][1] = _mny_col_1;
	
	
		// Option box
	var _box_x = box_x[l, 0];
	var _box_y = (box_y[l, 0] + box_h[l, 0] + box_y[l, 0]);
	var _box_w = box_w[l, 0]
	var _box_h = 70;
	fn_menu_box_add(l, 1, _box_x, _box_y, _box_w, _box_h);
	
			// Options [#0]
	fn_menu_opt_add_ext(l, "menu_inv_main_opt_");
	opt_cncl_key[l, 1] = CONFIG_KEY.MENU_INV;
	
			// Icon of the options [#0]
	main_optIcon_spr = spr_menu_inv_optIcon;
	main_optIcon_w = fn_spr_w(main_optIcon_spr);
	main_optIcon_h = fn_spr_h(main_optIcon_spr);
	var _optIcon_xTextGap = _mnyIcon_xTextGap;
	var _optIcon_wAll = (main_optIcon_w + _optIcon_xTextGap + opt_wMax[l]);
	main_optIcon_x = (box_x[l, 1] + round(box_w[l, 1] / 2) - round(_optIcon_wAll / 2) - 1);
	var _optIcon_yDist = round(draw_dist / 1);
	var _optIcon_hAll = ((_optIcon_yDist * (opt_amt[l] - 1)) + main_optIcon_h);
	
			// Icon of the options [#1], options [#1]
	for (var o = 0; o < opt_amt[l]; o++)
	{
		// Icon of the options [#1]
		main_optIcon_y[o] = (box_y[l, 1] + round(box_h[l, 1] / 2) - round(_optIcon_hAll / 2) + (_optIcon_yDist * o));
		
		// Options [#1]
		opt_x[l, o] = (main_optIcon_x + main_optIcon_w + _optIcon_xTextGap);
		opt_y[l, o] = (main_optIcon_y[o] + round(main_optIcon_h / 2) - round(opt_h[l, o] / 2) - 1);
		
			// Option selector
		fn_menu_opt_slctr_add(l, o);
		opt_slctr_x[l, o] = (opt_slctr_x[l, o] - _optIcon_xTextGap - main_optIcon_w - 1);
		opt_slctr_w[l, o] = (opt_slctr_w[l, o] + _optIcon_xTextGap + main_optIcon_w + 1);
	}
	
	
	
	
	// Other levels (Effects, Items and Themes)
	LVL_OTHER_EFF = 1;
	LVL_OTHER_ITM = 2;
	LVL_OTHER_THM = 3;
	
	for (var l = LVL_OTHER_EFF; l <= LVL_OTHER_THM; l++)
	{
		// Get data of the current level
		other_textData_key = "eff";
		other_amtMax = global.eff_amtMax;
		other_hasArr = global.eff_has;
		other_nameArr = global.eff_name;
		other_descArr = global.eff_desc;
		
		if (l == LVL_OTHER_ITM)
		{
			other_textData_key = "itm";
			other_amtMax = global.itm_amtMax;
			other_hasArr = global.itm_has;
			other_nameArr = global.itm_name;
			other_descArr = global.itm_desc;
		}
		
		else if (l == LVL_OTHER_THM)
		{
			other_textData_key = "thm";
			other_amtMax = global.thm_amtMax;
			other_hasArr = global.thm_has;
			other_nameArr = global.thm_name;
			other_descArr = global.thm_desc;
		}
		
		
		// Title
		fn_menu_ttl_add(l, fn_getText($"menu_inv_{other_textData_key}_ttl"));
		
		// Box
		var _box_xMargin = (draw_dist * 2);
		var _box_yMargin = draw_dist;
		
		var _box_x = _box_xMargin;
		var _box_y = (ttl_box_y[l] + ttl_box_h[l] + _box_yMargin);
		var _box_w = (320 - (_box_x * 2));
		var _box_h = (240 - _box_y - _box_yMargin);
		fn_menu_box_add(l, 0, _box_x, _box_y, _box_w, _box_h);
		
		// Options
		var _opt_xMul = 0;
		var _opt_yMul = 0;
		for (var o = 0; o < other_amtMax; o++)
		{
			// Options
			var _opt_text = "----------";
			var _opt_slct_snd = global.thm_opt_fail_snd[global.thm];
			if (array_get(other_hasArr, o) == true)
			{
				_opt_text = array_get(other_nameArr, o);
				_opt_slct_snd = global.thm_opt_slct_snd[global.thm];
			}
			fn_menu_opt_add(l, o, _opt_text);
			
			opt_x[l, o] = (box_x[l, 0] + ((box_w[l, 0] / 2) * _opt_xMul) + (draw_dist * 2));
			opt_y[l, o] = (box_y[l, 0] + draw_dist + (draw_dist * _opt_yMul));
			opt_slct_snd[l, o] = _opt_slct_snd;
			_opt_xMul += 1;
			if (_opt_xMul == 2)
			{
				_opt_xMul = 0;
				_opt_yMul += 1;
			}
			
			fn_menu_opt_slctr_add(l, o); // Option selector
			
			
				// Options' description
			if (array_get(other_hasArr, o) == true)
			{
				var _info_text = array_get(other_descArr, o);
				fn_menu_opt_desc_add(l, o, _info_text);
				
				opt_desc_x[l, o] = (box_x[l, 0] + draw_dist);
				opt_desc_y[l, o] = (box_y[l, 0] + box_h[l, 0] - draw_dist - opt_desc_h[l, o]);
			}
		}
		opt_move_type[l] = OPT_MOVE_TYPE_invOther;
	}
}
function fn_menu_inv_evCreate_1()
{
	// Main level
	lvl = LVL_MAIN;
	fn_aud_play(global.thm_opt_slct_snd[global.thm], CONFIG_VOLTYPE.MENU);
}
function fn_menu_inv_evDrawGUI_2(l)
{
	// Main level
	if (l == LVL_MAIN)
	{	
		// Information box
			// Draws the player's picture frame
		fn_draw_spr(main_picFrm_spr, 0, main_picFrm_x, main_picFrm_y, , (lvl_alp[l] * draw_alp));
		
			// Draws the player's picture
		var _ptr_press = mouse_check_button_pressed(mb_left);
		if (_ptr_press == true)
		{
			var _ptr_x = (window_mouse_get_x() / 2);
			var _ptr_y = (window_mouse_get_y() / 2);
			var _ptr_xMeet = (_ptr_x > main_pic_x && _ptr_x < (main_pic_x + main_pic_w));
			var _ptr_yMeet = (_ptr_y < main_pic_y && _ptr_y > (main_pic_y - main_pic_h));
			var _ptr_meet = (_ptr_xMeet == true && _ptr_yMeet == true)
			if (_ptr_meet == true)
			{
				var _pic_scAmt_mulMin = 0.75;
				var _pic_scAmt_mulMax = 1.5;
				main_pic_xSc += (main_pic_scAmt * random_range(_pic_scAmt_mulMin, _pic_scAmt_mulMax));
				main_pic_ySc -= (main_pic_scAmt * random_range(_pic_scAmt_mulMin, _pic_scAmt_mulMax));
				
				var _ptr_snd_pitch = random_range(0.75, 2.25);
				var _ptr_snd = fn_aud_play(main_pic_snd, CONFIG_VOLTYPE.PLAYER);
				fn_aud_pitch(_ptr_snd, _ptr_snd_pitch);
			}
		}
		
		fn_draw_spr(main_pic_spr, 0, main_pic_x - ((main_pic_w / 2) * abs(main_pic_xSc - 1)), main_pic_y, , (lvl_alp[l] * draw_alp), main_pic_xSc, main_pic_ySc);
		main_pic_xSc = lerp(main_pic_xSc, 1, main_pic_scSpd);
		main_pic_ySc = lerp(main_pic_ySc, 1, main_pic_scSpd);
		
			// Draws the icon of the player's money
		fn_draw_spr(main_mnyIcon_spr, 0, main_mnyIcon_x, main_mnyIcon_y, main_mnyIcon_col, (lvl_alp[l] * draw_alp), , , , true);
		
		
		// Option box
			// Icon of the options
		for (var o = 0; o < opt_amt[l]; o++)
			fn_draw_spr(main_optIcon_spr, o, main_optIcon_x, main_optIcon_y[o], opt_col[l][o][0], (opt_alp[l, o] * lvl_alp[l] * draw_alp), , , , true);
	}
}


// Functions related to the options
function fn_menu_inv_opt_slct()
{
	var l = lvl;
	var o = opt_move_pos[l];
	
	// Main level
	if (l == LVL_MAIN)
		fn_menu_lvlNew((o + 1));
	
	// Other levels (Effects, Items and Themes)
	else if (l == LVL_OTHER_THM)
	{
		if (global.thm_has[o] == true)
			global.thm = o;
	}
}
function fn_menu_inv_opt_cncl()
{
	var l = lvl;
	
	// Main level
	if (l == LVL_MAIN)
		fn_menu_lvlNew(LVL_EMPTY, , true);
	
	// Other levels (Effects, Items and Themes)
	else if (l >= LVL_OTHER_EFF && l <= LVL_OTHER_THM)
		fn_menu_lvlNew(LVL_MAIN);
}
