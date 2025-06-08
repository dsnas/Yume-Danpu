
function fn_menu_opt_sizedata(_lvl_id, _opt_idx)
{
	var z = _lvl_id;
	var o = _opt_idx;
	
	opt_w[z, o] = fn_txt_w(opt_txt[z, o]);
	opt_h[z, o] = fn_txt_h(opt_txt[z, o]);
	if (o == 0)
		opt_wMax[z] = opt_w[z, o];
	else if (o >= 1)
		opt_wMax[z] = max(opt_wMax[z], opt_w[z, o])
}

function fn_menu_opt_txtdata(_lvl_id, _opt_txtdata_key)
{
	var l = _lvl_id;
	
	for (var o = 0; o < opt_amtMax; o++)
	{	
		var _opt_txt = fn_txtdata(string(_opt_txtdata_key) + "_" + string(o));
		if (_opt_txt != undefined)
		{
			opt_txt[l, o] = _opt_txt;
			fn_dbg_log(opt_txt[l, o]);
			fn_menu_opt_sizedata(l, o);
			
			continue;
		}
		else
		{
			opt_amt[l] = o;
			break;
		}	
	}
}

function fn_menu_lbl_txtdata(_lvl_id, _lbl_idx, _lbl_txtdata_key)
{
	var l = _lvl_id;
	var i = _lbl_idx;
	
	var _lbl_txt = fn_txtdata(_lbl_txtdata_key);
	if (_lbl_txt != undefined)
	{
		lbl_txt[l, i] = _lbl_txt;
		
		lbl_w[l, i] = fn_txt_w(_lbl_txt);
		lbl_h[l, i] = fn_txt_h(_lbl_txt);
	}
}

function fn_menu_optSlctr_drawdata(_lvl, _opt_idx) // (Applies the default position and size to the selector of the specified option)
{
	var l = _lvl;
	var o = _opt_idx;
	
	optSlctr_x[l, o] = (opt_x[l, o] + optSlctr_xFix[l, o] - optSlctr_xDist[l, o]); // this took SO long omgg
	optSlctr_y[l, o] = (opt_y[l, o] + optSlctr_yFix_0[l, o] - optSlctr_yDist[l, o]);
	optSlctr_w[l, o] = (opt_w[l, o] - optSlctr_xFix[l, o] + (optSlctr_xDist[l, o] * 2));
	optSlctr_h[l, o] = (opt_h[l, o] - 1 - optSlctr_yFix_0[l, o] - optSlctr_yFix_1[l, o] + (optSlctr_yDist[l, o] * 2));
}

function fn_menu_lvlTrans(_lvlTgt, _killMenu = false, _rmTgt = -1) // lvlTrans (Starts transition sequence between levels) (trans rights, am i right?!!)
{
	lvlTrans_act = true;
	lvlTrans_lvlTgt = _lvlTgt;
	lvlTrans_killMenu = _killMenu;
	lvlTrans_rmTgt = _rmTgt;
}

function fn_menu_opt_move(_type_id) // opt move (Option movement, type is set by an ID)
{
	var l = lvl;
	var _opt_posOld = opt_pos[l];
		
		
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
		
	else if (_type_id == 2) // inv list (Inventory effects/items/themes list)
	{
		if (inp_rt == true) || (inp_lt == true)
		{
			if (opt_pos[lvl] % 2 == 0)
				opt_pos[lvl] += 1;
			else if (opt_pos[lvl] % 2 == 1)
				opt_pos[lvl] -= 1;
		}
		
		if (inp_dn == true)
		{
			if (opt_pos[lvl] + 2) <= (opt_amt[lvl] - 1)
				opt_pos[lvl] += 2;
			else
				opt_pos[lvl] = (0 + (opt_pos[lvl] % 2));
		}
		else if (inp_up == true)
		{
			if ((opt_pos[lvl] - 2) >= 0)
				opt_pos[lvl] -= 2;
			else
				opt_pos[lvl] = (opt_amt[lvl] - 1 - !(opt_pos[lvl] % 2));
		}
	}
		
		
	if (_opt_posOld != opt_pos[l]) // optMove snd (Plays moving sound if the option position changes)
		fn_aud_play(global.thm_snd_optMove[global.thm_cur], SETT_VOL.MENU);
}












