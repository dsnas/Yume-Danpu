
function menu_opt_sizeData(_lvl, _id)
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

function menu_opt_txtdata(_lvl, _key)
{
	var z = _lvl;
	
	for (var i = 0; i < opt_amtMax; i++)
	{	
		var _txt = fn_txtdata(string(_key) + "_" + string(i));
		if (_txt != undefined)
		{
			opt_txt[z, i] = _txt;
			menu_opt_sizeData(z, i);
			
			continue;
		}
		else
		{
			opt_amt[z] = i;
			
			break;
		}	
	}
}

function menu_lbl_txtdata(_lvl, _id, _key)
{
	var z = _lvl;
	var i = _id;
	
	var _txt = fn_txtdata(_key);
	if (_txt != undefined)
	{
		lbl_txt[z, i] = _txt;
		
		lbl_w[z, i] = fn_txt_w(_txt);
		lbl_h[z, i] = fn_txt_h(_txt);
	}
}

function menu_optSlctr_drawData(_lvl, _id) // enable default optSlctr position and size for specified option
{
	var z = _lvl;
	var i = _id;
	
	optSlctr_x[z, i] = (opt_x[z, i] + optSlctr_xDistFix[z, i] - optSlctr_xDist[z, i]); // this took SO long omgg
	optSlctr_y[z, i] = (opt_y[z, i] + optSlctr_yDistFix_0[z, i] - optSlctr_yDist[z, i]);
	optSlctr_w[z, i] = (opt_w[z, i] - optSlctr_xDistFix[z, i] + (optSlctr_xDist[z, i] * 2));
	optSlctr_h[z, i] = (opt_h[z, i] - 1 - optSlctr_yDistFix_0[z, i] - optSlctr_yDistFix_1[z, i] + (optSlctr_yDist[z, i] * 2));
}













