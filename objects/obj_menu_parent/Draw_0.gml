
if (is_array(lvl) == true)
{
	var l = lvl_curr;
	
	// Panels
	if (is_array(lvl[l].panel) == true)
	{
		for (var p = 0; p < array_length(lvl[l].panel); p++)
		{
			var _panel = lvl[l].panel[p];
			fn_draw_spr_stretch(_panel.spr, _panel.img, _panel.x, _panel.y, _panel.width, _panel.height, , lvl[l].alpha);
		}
	}
	
	// Cards
	if (is_array(lvl[l].card) == true)
	{
		for (var c = 0; c < array_length(lvl[l].card); c++)
		{
			var _card = lvl[l].card;
			fn_draw_spr_stretch(_card.spr, _card.img, _card.x, _card.y, _card.width, _card.height, , lvl[l].alpha);
		}
	}
	
	// Options
	if (is_array(lvl[l].option) == true)
	{
		for (var o = 0; o < array_length(lvl[l].option); o++)
		{
			var _opt = lvl[l].option[o];
			var _opt_color = lvl[l].option[o].color;
			
			// Option's button
			if (_opt.button.act == true)
				fn_draw_spr_stretch(_opt.button.spr, ((o != lvl[l].option_curr) ? _opt.button.img_inact : _opt.button.img_act), _opt.button.x, _opt.button.y, _opt.button.width, _opt.button.height, , lvl[l].alpha);
			
			// Option's selection indicator
			if (_opt.select.act == true && o == lvl[l].option_curr)
				fn_draw_spr_stretch(_opt.select.spr, 0, _opt.select.x, _opt.select.y, _opt.select.width, _opt.select.height, , lvl[l].alpha);
			
			// Option
			fn_draw_text(_opt.text, _opt.x, _opt.y, _opt_color[(o == lvl[l].option_curr), 0], _opt_color[(o == lvl[l].option_curr), 1], lvl[l].alpha);
			
			// Option's value label (the text beside the options in the settings menu, like "Yes", "No" and "100%")
			if (_opt.value.act == true)
			{
				var _val = _opt.value;
				fn_draw_text(_val.text, _val.x, _val.y, _val.color[0], _val.color[1], (_val.alpha[(o == lvl[l].option_curr)] * lvl[l].alpha), , , _val.xAlign, _val.yAlign);
				
				// Value label's arrows
				if (_val.arrow != -1 && o == lvl[l].option_curr)
				{
					for (var a = 0; a < 2; a++)
					{
						if (_val.arrow[a].act == true)
						{
							var _arrow = _val.arrow[a];
							
							if (a == 0)
								lvl[l].option[o].value.arrow[0].x = (_val.x - (fn_text_w(_val.text) / 2) - _arrow.xDist - fn_text_w(_arrow.text));
							else
								lvl[l].option[o].value.arrow[1].x = (_val.x + (fn_text_w(_val.text) / 2) + _arrow.xDist);
							
							if (_arrow.move.act == true)
							{
								if (_arrow.move.wait >= _arrow.move.waitMax)
								{
									if (_arrow.move.xCurr < _arrow.move.xMax)
										_arrow.move.xCurr += _arrow.move.xSpd;
									else
										_arrow.move.xCurr = 0;
									lvl[l].option[o].value.arrow[a].move.wait = 0;
								}
								else
									lvl[l].option[o].value.arrow[a].move.wait += 1;
							}
							
							lvl[l].option[o].value.arrow[a].scale = lerp(_arrow.scale, _arrow.scaleMin, _arrow.scaleSpd);
							
							fn_draw_text(_arrow.text, (_arrow.x + (_arrow.move.xCurr * _arrow.move.xSign * _arrow.move.act) + (fn_text_w(_arrow.text) / 2)), (_val.y + (fn_text_h(_arrow.text) / 2)), _arrow.color[0], _arrow.color[1], lvl[l].alpha, _arrow.scale, _arrow.scale, _arrow.xAlign, _arrow.yAlign);
						}
					}
				}
			}
		}
	}
}
