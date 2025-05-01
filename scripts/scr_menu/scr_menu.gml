
function menu_opt_txtdata()
{
	for (var z = 0; z < lvl_maxAmt; z++)
	{
		for (var i = 0; i < opt_maxAmt; i++)
		{	
			var _txt = fn_txtdata("menu_" + string(i));
			if (_txt != undefined)
			{
				opt_txt[z, i] = _txt;
			
				draw_set_font(global.fnt_main);
				opt_w[z, i] = string_width(_txt);
				opt_h[z, i] = string_height(_txt);
			
				if (i == 0)
					option_wMax[z] = option_w[z, i];
				else if (i >= 1)
					option_wMax[z] = max(option_wMax[z], option_w[z, i])
			}
			else
			{
			
			}
		
		
		}
	}
}
