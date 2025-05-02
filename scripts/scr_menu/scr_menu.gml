
function menu_lvl_txtdata(_lvl, _key)
{
	var z = _lvl;
	
	for (var i = 0; i < opt_maxAmt; i++)
	{	
		var _txt = fn_txtdata(string(_key) + "_" + string(i));
		if (_txt != undefined)
		{
			opt_txt[z, i] = _txt;
			
			draw_set_font(global.fnt_main);
			opt_w[z, i] = string_width(_txt);
			opt_h[z, i] = string_height(_txt);
			
			continue;
		}
		else
		{
			opt_amt[z] = i;
			
			break;
		}	
	}
}
