
function menu_lvl_txtdata(_lvl, _key)
{
	var z = _lvl;
	
	for (var i = 0; i < opt_amtMax; i++)
	{	
		var _txt = fn_txtdata(string(_key) + "_" + string(i));
		if (_txt != undefined)
		{
			opt_txt[z, i] = _txt;
			
			draw_set_font(global.fnt_main);
			opt_w[z, i] = string_width(_txt);
			opt_h[z, i] = string_height(_txt);
			
			if (i == 0)
				opt_wMax[z] = opt_w[z, i];
			else if (i >= 1)
				opt_wMax[z] = max(opt_wMax[z], opt_w[z, i])
			
			continue;
		}
		else
		{
			opt_amt[z] = i;
			
			break;
		}	
	}
}
