
//////// Functions related to the menu system


// Levels
function fn_menu_lvl_add(_idx)
{
	lvl[_idx] =
	{
		alpha : 0,
		
		
		// Title element
		title : -1,
		
		
		// Panel elements
		panel : -1,
		
		
		// Card elements
		card : -1,
		
		
		// Label elements
		label : -1,
		
		
		// Decoration elements
		decor : -1,
		
		
		// Option elements
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

	// Fade transition
function fn_menu_lvl_fader_start(_tgt_lvl, _tgt_snd = -1, _tgt_destroy = false, _wait_dur = 0)
{
	lvl_fader =
	{
		stg : 0, // ID number of the current stage of the fade transition
		alpSpd : 0.3, // Alpha speed (speed at which the alpha changes during the fade transition) (1 == instantaneous)
		alpJump : 0.05, // Alpha jump (if the difference between the current alpha and the target alpha reaches this value, the current alpha will jump to the target alpha)
		
		tgt :
		{
			lvl : _tgt_lvl,
			snd : _tgt_snd,
			destroy : _tgt_destroy
		},
		
		wait_dur : _wait_dur,
	}
}

	// Title
function fn_menu_lvl_title_add(_lvl, _text = "")
{
	var l = _lvl;
	
	lvl[l].title =
	{
		text : _text,
		x : 0,
		y : 0,
		
		color : [global.player.thm[global.player.thm_curr].color.whiteLight, global.player.thm[global.player.thm_curr].color.whiteLight],
		
		xAlign : fa_center,
		yAlign : fa_top,
		
			// Title's panel
		panel :
		{
			spr : global.player.thm[global.player.thm_curr].spr.panel,
			img : 0,
			
			x : 0,
			y : 0,
			width : 0,
			height : 0
		}
	}
	var _title = lvl[l].title;
	
	lvl[l].title.panel.x = -16;
	lvl[l].title.panel.y = -16;
	lvl[l].title.panel.width = ((abs(_title.panel.x) * 2) + global.config.vid.resW);
	lvl[l].title.panel.height = (abs(_title.panel.y) + 32);
	
	lvl[l].title.x = round(_title.panel.x + (_title.panel.width / 2));
	lvl[l].title.y = round(((_title.panel.height - abs(_title.panel.y)) / 2) - (fn_textdata_height(_title.text) / 2) - 2)
}

	// Panels
function fn_menu_lvl_panel_add(_lvl, _idx, _img = 0, _x = 0, _y = 0, _width = 0, _height = 0)
{
	var l = _lvl;
	var p = _idx;
	
	lvl[l].panel[p] =
	{
		spr : global.player.thm[global.player.thm_curr].spr.panel,
		img : _img,
		
		x : _x,
		y : _y,
		width : _width,
		height : _height
	}
}

	// Cards
function fn_menu_lvl_card_add(_lvl, _idx, _img = 0, _x = 0, _y = 0, _width = 0, _height = 0)
{
	var l = _lvl;
	var c = _idx;
	
	lvl[l].card[c] =
	{
		spr :  global.player.thm[global.player.thm_curr].spr.panel,
		img : _img,
		
		x : _x,
		y : _y,
		width : _width,
		height : _height
	}
}

	// Labels
function fn_menu_lvl_label_add(_lvl, _idx, _text = "", _x = 0, _y = 0, _color = [global.player.thm[global.player.thm_curr].color.whiteLight, global.player.thm[global.player.thm_curr].color.whiteLight], _xAlign = fa_left, _yAlign = fa_top)
{
	var l = _lvl;
	var a = _idx;
	
	lvl[l].label[a] =
	{
		text : _text,
		x : _x,
		y : _y,
		
		color : _color,
		
		xAlign : _xAlign,
		yAlign : _yAlign,
	}
}

	// Decorations
function fn_menu_lvl_decor_add(_lvl, _idx, _spr = -1, _img = 0, _x = 0, _y = 0, _color = c_white, _alpha = 1)
{
	var l = _lvl;
	var d = _idx;
	
	lvl[l].decor[d] =
	{
		spr : _spr,
		img : _img,
		
		x : _x,
		y : _y,
		
		color : _color,
		alpha : _alpha
	}
}

	// Options
function fn_menu_lvl_option_add(_lvl, _idx, _text = "", _x = 0, _y = 0, _select_act = true, _button_act = false, _button_xDist = 6, _button_yDist = 3)
{	
	var l = _lvl;
	var o = _idx;
	
	
	// Option
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
		
		xAlign : fa_left,
		yAlign : fa_top,
		
		
		// Selection indicator
		select :
		{
			act : _select_act,
			
			spr : global.player.thm[global.player.thm_curr].spr.option_select,
			img : 1,
			
			x : 0,
			y : 0,
			xDist : 6,
			yDist : 2,
			width : 0,
			height : 0,
		},
		
		
		// Value label (the text beside the options in the settings menu, like "Yes", "No" and "100%")
		value : -1,
		
		
		// Icon
		icon : -1,
		
		
		// Button
		button :
		{
			act : _button_act,
			
			spr : global.player.thm[global.player.thm_curr].spr.option_button,
			img_inact : 0, // image_index while inactive (unselected)
			img_act : 1, // image_index while active (selected)
			
			x : 0,
			y : 0,
			width : 0,
			height : 0,
		}
	}
}

		// Value label (the text beside the options in the settings menu, like "Yes", "No" and "100%")
function fn_menu_lvl_option_value_add(_lvl, _idx, _xDist = 64)
{
	var l = _lvl;
	var o = _idx;
	
	
	// Value label
	lvl[l].option[o].value =
	{
		text : "Salenis",
		key : [CONFIG_KEY.LT, CONFIG_KEY.RT],
			
		x : 0,
		y : 0,
		xDist : _xDist,
			
		color : [global.player.thm[global.player.thm_curr].color.grayLight, global.player.thm[global.player.thm_curr].color.grayDark],
		alpha : [0.5 /* Inactive (Unselected) */, 1 /* Active (Selected) */],
			
			
		// Arrows
		arrow : -1
	}
	
		// Arrows
	for (var a = 0; a < 2; a++)
	{
		lvl[l].option[o].value.arrow[a] =
		{
			text : ((a == 0) ? "<" : ">"),
				
			xDist : 6,
			color : [global.player.thm[global.player.thm_curr].color.whiteLight, global.player.thm[global.player.thm_curr].color.whiteLight],
				
			scale : 1,
			scaleMin : 1,
			scaleMax : 1.75,
			scaleSpd : 0.15,
				
			move :
			{
				act : !global.config.access.rdcdMot,
				xCurr : 0,
				xMax : 2,
				xSpd : 1,
				xSign : ((a == 0) ? -1 : 1),
					
				wait : 0,
				waitMax : 8
			}
		}
	}
	
	
	event_user(3);
}

		// Icon
function fn_menu_lvl_option_icon_add(_lvl, _idx, _spr = -1, _img = 0)
{
	var l = _lvl;
	var o = _idx;
	
	lvl[l].option[o].icon =
	{
		spr : _spr,
		img : _img,
			
		x : 0,
		y : 0,
		xDist : 5,
			
		color : c_white,
		alpha : [0.35 /* Inactive (Unselected) */, 1 /* Active (Selected) */]
	}
}
