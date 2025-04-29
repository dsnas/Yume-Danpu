/// @descr create

for (var z = 0; z < lvl_maxAmt; z++)
{
	for (var i = 0; i < opt_maxAmt; i++)
	{	
		var _opt = fn_txtdata("menu_" + string(i));
		if (_opt != undefined)
		{
			opt_txt[z, i] = _opt;
			
			//draw_set_font();
		}
		else
		{
			
		}
		
		/*
		var _option = textdata_get("menu_chara_0_" + string(i));
		if (_option != undefined)
		{
			option[l, i] = _option;
			draw_set_font(option_font[l, i]);
			option_w[l, i] = string_width(option[l, i]);
			option_h[l, i] = string_height(option[l, i]);
			
			if (i == 0)
				option_wMax[l] = option_w[l, i];
			else if (i >= 1)
				option_wMax[l] = max(option_wMax[l], option_w[l, i])
			
			continue;
		}
		else
		{
			option_amt[l] = i;
			break;
		}
		*/
	}
}

opt_txt[0, 0] = "Salenis";
