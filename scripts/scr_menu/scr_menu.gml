
//////// Functions related to the menu system


// Levels
function fn_menu_lvl_add(_idx)
{
	lvl[_idx] =
	{
		alpha : 1,
		
		
		// Panels
		panel : -1,
		
		
		// Cards
		card : -1,
		
		
		// Options
		option : -1,
		option_curr : 0,
		
			// Movement
		option_move :
		{
			act : true,
			snd : global.player.thm[global.player.thm_curr].snd.move,
			
			// List type
			list :
			{
				act : true,
				key : [CONFIG_KEY.UP, CONFIG_KEY.DN]
			},
			
			// Table type
			table :
			{
				act : false
			}
		},
		
			// Confirmation
		option_confirm :
		{
			act : true,
			key : CONFIG_KEY.CONFIRM,
			snd : global.player.thm[global.player.thm_curr].snd.confirm
		},
		
			// Cancellation
		option_cancel :
		{
			act : true,
			key : CONFIG_KEY.CANCEL,
			snd : global.player.thm[global.player.thm_curr].snd.cancel
		}
	}
}

	// Panels
function fn_menu_lvl_panel_add(_lvl, _idx, _spr = global.player.thm[global.player.thm_curr].spr.panel, _img, _x, _y, _width, _height)
{
	var l = _lvl;
	var p = _idx;
	
	lvl[l].panel[p] =
	{
		spr : _spr,
		img : _img,
		
		x : _x,
		y : _y,
		width : _width,
		height : _height
	}
}

	// Cards
function fn_menu_lvl_card_add(_lvl, _idx, _spr = global.player.thm[global.player.thm_curr].spr.panel, _img, _x, _y, _width, _height)
{
	var l = _lvl;
	var c = _idx;
	
	lvl[l].card[c] =
	{
		spr : _spr,
		img : _img,
		
		x : _x,
		y : _y,
		width : _width,
		height : _height
	}
}

	// Options
function fn_menu_lvl_option_add(_lvl, _idx, _text, _x, _y, _cursor_act = true, _value_act = false, _value_xDist = 32, _button_act = false, _button_xDist = 6, _button_yDist = 3)
{	
	var l = _lvl;
	var o = _idx;
	
	lvl[l].option[o] =
	{
		text : _text,
		x : _x,
		y : _y,
		
		color : // Colors
		[
			[global.player.thm[global.player.thm_curr].color.grayLight, global.player.thm[global.player.thm_curr].color.grayDark], // Inactive (Unselected)
			[global.player.thm[global.player.thm_curr].color.whiteLight, global.player.thm[global.player.thm_curr].color.whiteLight] // Active (Selected)
		],
		
		// Selection indicator
		select :
		{
			act : _cursor_act,
			spr : global.player.thm[global.player.thm_curr].spr.option_select,
			
			x : 0,
			y : 0,
			xDist : 6,
			yDist : 3,
			width : 0,
			height : 0,
		},
		
		// Value label (the text beside the options in the settings menu, like "Yes", "No" and "100%")
		value :
		{
			act : _value_act,
			key : [CONFIG_KEY.LT, CONFIG_KEY.RT],
			text : "",
			
			x : undefined,
			y : undefined,
			xDist : _value_xDist,
			yDist : 0,
			
			color : [global.player.thm[global.player.thm_curr].color.grayLight, global.player.thm[global.player.thm_curr].color.grayDark],
			alpha : [0.5 /* Inactive (Unselected) */, 1 /* Active (Selected) */],
			
			xAlign : fa_center,
			yAlign : fa_top,
			
			// Arrows
			arrow : -1
		},
		
		// Button
		button :
		{
			act : _button_act,
			spr : global.player.thm[global.player.thm_curr].spr.option_button,
			img_inact : 0, // image_index while inactive (unselected)
			img_act : 1, // image_index while active (selected)
			
			x : undefined,
			y : undefined,
			width : 0,
			height : 0,
		}
	}
	
		// Selection indicator
	if (lvl[l].option[o].select.act == true)
	{
		var _xDist = lvl[l].option[o].select.xDist;
		var _yDist = lvl[l].option[o].select.yDist;
		lvl[l].option[o].select.x = (lvl[l].option[o].x - _xDist);
		lvl[l].option[o].select.y = (lvl[l].option[o].y - _yDist);
		lvl[l].option[o].select.width = ((_xDist * 2) + fn_text_w(lvl[l].option[o].text) + 1);
		lvl[l].option[o].select.height = ((_yDist * 2) + fn_text_h(lvl[l].option[o].text) + 2);
	}
	
		// Value label (the text beside the options in the settings menu, like "Yes", "No" and "100%")
	if (lvl[l].option[o].value.act == true)
	{
		lvl[l].option[o].value.x = (lvl[l].option[o].x + fn_text_w(lvl[l].option[o].text) + lvl[l].option[o].value.xDist);
		lvl[l].option[o].value.y = (lvl[l].option[o].y + lvl[l].option[o].value.yDist);
		
		// Arrows
		for (var a = 0; a < 2; a++)
		{
			lvl[l].option[o].value.arrow[a] =
			{
				act : true,
				text : undefined,
				
				x : undefined,
				xDist : 6,
				color : [global.player.thm[global.player.thm_curr].color.whiteLight, global.player.thm[global.player.thm_curr].color.whiteLight],
				
				scale : 1,
				scaleMin : 1,
				scaleMax : 1.5,
				scaleSpd : 0.15,
				xAlign : fa_center,
				yAlign : fa_middle,
				
				move :
				{
					act : true,
					xCurr : 0,
					xMax : 2,
					xSpd : 1,
					xSign : undefined,
					
					wait : 0,
					waitMax : 8
				}
			}
		}
		
		lvl[l].option[o].value.arrow[0].text = "<";
		lvl[l].option[o].value.arrow[0].move.xSign = -1;
			
		lvl[l].option[o].value.arrow[1].text = ">";
		lvl[l].option[o].value.arrow[1].move.xSign = 1;
	}
	
		// Button
	if (lvl[l].option[o].button.act == true)
	{
		lvl[l].option[o].button.x = (lvl[l].option[o].x - lvl[l].option[o].button.xDist);
		lvl[l].option[o].button.y = (lvl[l].option[o].y - lvl[l].option[o].button.yDist);
		lvl[l].option[o].button.width = ((lvl[l].option[o].button.xDist * 2) + fn_text_w(lvl[l].option[o].text) + 1);
		lvl[l].option[o].button.height = ((lvl[l].option[o].button.yDist * 2) + fn_text_h(lvl[l].option[o].text) + 2);
	}
}
