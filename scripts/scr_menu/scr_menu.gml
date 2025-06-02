
function fn_menu_opt_sizedata(_lvl, _id)
{
	var z = _lvl;
	var i = _id;
	
	opt_w[z, i] = fn_txt_w(opt_txt[z, i]);
	opt_h[z, i] = fn_txt_h(opt_txt[z, i]);
	if (i == 0)
		opt_wMax[z] = opt_w[z, i];
	else if (i >= 1)
		opt_wMax[z] = max(opt_wMax[z], opt_w[z, i])
}

function fn_menu_opt_txtdata(_lvl, _key)
{
	var l = _lvl;
	
	for (var i = 0; i < opt_amtMax; i++)
	{	
		var _txt = fn_txtdata(string(_key) + "_" + string(i));
		if (_txt != undefined)
		{
			opt_txt[l, i] = _txt;
			fn_menu_opt_sizedata(l, i);
			
			continue;
		}
		else
		{
			opt_amt[l] = i;
			break;
		}	
	}
}

function fn_menu_lbl_txtdata(_lvl, _idx, _key)
{
	var l = _lvl;
	var i = _idx;
	
	var _txt = fn_txtdata(_key);
	if (_txt != undefined)
	{
		lbl_txt[l, i] = _txt;
		
		lbl_w[l, i] = fn_txt_w(_txt);
		lbl_h[l, i] = fn_txt_h(_txt);
	}
}

function fn_menu_optSlctr_drawdata(_lvl, _opt_idx) // (Applies the default position and size to the selector of the specified option)
{
	var l = _lvl;
	var i = _opt_idx;
	
	optSlctr_x[l, i] = (opt_x[l, i] + optSlctr_xFix[l, i] - optSlctr_xDist[l, i]); // this took SO long omgg
	optSlctr_y[l, i] = (opt_y[l, i] + optSlctr_yFix_0[l, i] - optSlctr_yDist[l, i]);
	optSlctr_w[l, i] = (opt_w[l, i] - optSlctr_xFix[l, i] + (optSlctr_xDist[l, i] * 2));
	optSlctr_h[l, i] = (opt_h[l, i] - 1 - optSlctr_yFix_0[l, i] - optSlctr_yFix_1[l, i] + (optSlctr_yDist[l, i] * 2));
}

function fn_menu_lvlTrans(_lvlTgt, _killMenu = false) // lvlTrans (Starts transition sequence between levels) (trans rights, am i right?!!)
{
	lvlTrans_act = true;
	lvlTrans_lvlTgt = _lvlTgt;
	lvlTrans_killMenu = _killMenu;
}

function fn_menu_opt_move(_type_id) // (Option movement, type is set by an ID)
{
	if (opt_move == true)
	{
		var l = lvl;
		var _pos_old = opt_pos[l];
		
		
		if (_type_id == 0) || (_type_id == 1) // dflt (Default)
		{
			var _dflt_inp_0 = inp_dn; // (Type 0: up and down arrows)
			var _dflt_inp_1 = inp_up;
			if (_type_id == 1)
			{
				_dflt_inp_0 = inp_rt; // (Type 1: left and right arrows)
				_dflt_inp_1 = inp_lt;
			}
			
			opt_pos[l] += (_dflt_inp_0 - _dflt_inp_1); // (Movement)
			
			if (opt_pos[l] < 0) // (Teleports option position to the other side of the list if it goes out of the array's range)
				opt_pos[l] = (opt_amt[l] - 1);
			if (opt_pos[l] >= opt_amt[l])
				opt_pos[l] = 0;
		}
		
		
		if (_pos_old != opt_pos[l]) // optMove snd (Plays moving sound if the option position changes)
			fn_aud_play(global.thm_snd_optMove[global.chara_thm], SETT_VOL.MENU);
	}
}












