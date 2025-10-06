
function fn_menu_lvl_add(_idx)
{
	lvl[_idx] =
	{
		box : -1,
		
		opt : -1,
		opt_curr : 0,
	}
}


function fn_menu_lvl_opt_add(_lvl, _idx, _text, _x, _y, _box_act = true, _box_xDist = 6, _box_yDist = 3)
{	
	var o = _idx;
	var l = _lvl;
	
	lvl[l].opt[o] =
	{
		text : _text,
		x : _x,
		y : _y,
		
		col :
		[
			[global.player.thm[global.player.thm_curr].col.grayLight, global.player.thm[global.player.thm_curr].col.grayDark], // Inactive
			[global.player.thm[global.player.thm_curr].col.whiteLight, global.player.thm[global.player.thm_curr].col.whiteLight] // Active
		],
		
		box :
		{
			act : _box_act,
			spr : global.player.thm[global.player.thm_curr].opt_slctr_spr,
			
			x : 0,
			y : 0,
			w : 0,
			h : 0,
		}
	}
	
	lvl[l].opt[o].box.x = (lvl[l].opt[o].x - _box_xDist);
	lvl[l].opt[o].box.y = (lvl[l].opt[o].y - _box_yDist);
	lvl[l].opt[o].box.w = ((_box_xDist * 2) + fn_text_w(lvl[l].opt[o].text) + 1);
	lvl[l].opt[o].box.h = ((_box_yDist * 2) + fn_text_h(lvl[l].opt[o].text) + 2);
}
