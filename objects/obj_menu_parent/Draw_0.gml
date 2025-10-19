
if (is_array(lvl) == true)
{
	var l = lvl_curr;
	
	// Title element
	if (lvl[l].title != -1)
	{
		var _title = lvl[l].title;
		
		// Title's panel
		fn_draw_spr_stretch(_title.panel.spr, _title.panel.img, _title.panel.x, _title.panel.y, _title.panel.width, _title.panel.height, , lvl[l].alpha);
		
		// Title
		fn_draw_text(textdata(_title.text), _title.x, _title.y, _title.color[0], _title.color[1], lvl[l].alpha, , , _title.xAlign, _title.yAlign);
	}
	
	// Panel elements
	if (is_array(lvl[l].panel) == true)
	{
		for (var p = 0; p < array_length(lvl[l].panel); p++)
		{
			var _panel = lvl[l].panel[p];
			fn_draw_spr_stretch(_panel.spr, _panel.img, _panel.x, _panel.y, _panel.width, _panel.height, , lvl[l].alpha);
		}
	}
	
	// Card elements
	if (is_array(lvl[l].card) == true)
	{
		for (var c = 0; c < array_length(lvl[l].card); c++)
		{
			var _card = lvl[l].card[c];
			fn_draw_spr_stretch(_card.spr, _card.img, _card.x, _card.y, _card.width, _card.height, , lvl[l].alpha);
		}
	}
	
	// Label elements
	if (is_array(lvl[l].label) == true)
	{
		for (var a = 0; a < array_length(lvl[l].label); a++)
		{
			var _label = lvl[l].label[a];
			fn_draw_text(textdata(_label.text), _label.x, _label.y, _label.color[0], _label.color[1], lvl[l].alpha, , , _label.xAlign, _label.yAlign);
		}
	}
	
	// Decoration elements
	if (is_array(lvl[l].decor) == true)
	{
		for (var d = 0; d < array_length(lvl[l].decor); d++)
		{
			var _decor = lvl[l].decor[d];
			fn_draw_spr(_decor.spr, _decor.img, _decor.x, _decor.y, _decor.color, (_decor.alpha * lvl[l].alpha));
		}
	}
	
	// Option elements
	if (is_array(lvl[l].option) == true)
	{
		for (var o = 0; o < array_length(lvl[l].option); o++)
		{
			var _opt = lvl[l].option[o];
			var _opt_color = _opt.color;
			
			
				// Button
			if (_opt.button.act == true)
			{
				var _button_x = ((_opt.button.x != 0) ? _opt.button.x : (_opt.x - _opt.button.xDist));
				var _button_y = ((_opt.button.y != 0) ? _opt.button.y : (_opt.y - _opt.button.yDist));
				var _button_width = ((_opt.button.width != 0) ? _opt.button.width : ((_opt.button.xDist * 2) + fn_textdata_width(_opt.text) + 1));
				var _button_height = ((_opt.button.height != 0) ? _opt.button.height : ((_opt.button.yDist * 2) + fn_textdata_height(_opt.text) + 2));
				fn_draw_spr_stretch(_opt.button.spr, ((o != lvl[l].option_curr) ? _opt.button.img_inact : _opt.button.img_act), _button_x, _button_y, _button_width, _button_height, , lvl[l].alpha);
			}
			
			
				// Selection indicator
			if (_opt.select.act == true && o == lvl[l].option_curr)
			{
				var _select_x = ((_opt.select.x != 0) ? _opt.select.x : (_opt.x - _opt.select.xDist));
				var _select_y = ((_opt.select.y != 0) ? _opt.select.y : (_opt.y - _opt.select.yDist + 1));
				var _select_width = ((_opt.select.width != 0) ? _opt.select.width : ((_opt.select.xDist * 2) + fn_textdata_width(_opt.text) + 1));
				var _select_height = ((_opt.select.height != 0) ? _opt.select.height : ((_opt.select.yDist * 2) + fn_textdata_height(_opt.text) - 0));
				fn_draw_spr_stretch(_opt.select.spr, _opt.select.img, _select_x, _select_y, _select_width, _select_height, , lvl[l].alpha);
			}
			
			
				// Icon
			if (_opt.icon != -1 && _opt.icon.spr != -1)
			{
				var _icon_x = ((_opt.icon.x != 0) ? _opt.icon.x : (_opt.x - (fn_spr_width(_opt.icon.spr) / 2) - _opt.icon.xDist));
				var _icon_y = ((_opt.icon.y != 0) ? _opt.icon.y : (_opt.y + (fn_textdata_height(_opt.text) / 2) + 1));
				fn_draw_spr(_opt.icon.spr, _opt.icon.img, _icon_x, _icon_y, _opt.icon.color, (_opt.icon.alpha[(o == lvl[l].option_curr)] * lvl[l].alpha));
			}
			
			
			// Option
			fn_draw_text(textdata(_opt.text), _opt.x, _opt.y, _opt_color[(o == lvl[l].option_curr), 0], _opt_color[(o == lvl[l].option_curr), 1], lvl[l].alpha, , , _opt.xAlign, _opt.yAlign);
			
			
				// Value label (the text beside the options in the settings menu, like "Yes", "No" and "100%")
			if (_opt.value != -1 && _opt.value.text != "")
			{
				// Value label
				var _val = _opt.value;
				var _val_x = ((_val.x != 0) ? _val.x : (_opt.x + fn_textdata_width(_opt.text) + _opt.value.xDist));
				var _val_y = ((_val.y != 0) ? _val.y : _opt.y);
				fn_draw_text(_val.text, _val_x, _val_y, _val.color[0], _val.color[1], (_val.alpha[(o == lvl[l].option_curr)] * lvl[l].alpha), , , fa_center);
				
				
					// Value label's arrows
				if (_val.arrow != -1 && o == lvl[l].option_curr)
				{
					var _arrow_x;
					_arrow_x[0] = (_val_x - (fn_text_width(_val.text) / 2) - _val.arrow[0].xDist - fn_text_width(_val.arrow[0].text));
					_arrow_x[1] = (_val_x + (fn_text_width(_val.text) / 2) + _val.arrow[1].xDist);
					
					for (var a = 0; a < 2; a++)
					{
						var _arrow = _val.arrow[a];
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
						fn_draw_text(_arrow.text, (_arrow_x[a] + (_arrow.move.xCurr * _arrow.move.xSign * _arrow.move.act) + (fn_text_width(_arrow.text) / 2)), (_val_y + (fn_text_height(_arrow.text) / 2)), _arrow.color[0], _arrow.color[1], lvl[l].alpha, _arrow.scale, _arrow.scale, fa_center, fa_middle);
					}
				}
			}
		}
	}
}
