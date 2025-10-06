
var l = lvl_curr;

if (is_array(lvl) == true && is_array(lvl[l].opt) == true)
{
	for (var o = 0; o < array_length(lvl[l].opt); o++)
	{
		var _opt = lvl[l].opt[o];
		var _opt_col = lvl[l].opt[o].col;
		
		if (_opt.box.act == true && o == lvl[l].opt_curr)
			fn_draw_spr_stretch(_opt.box.spr, 0, _opt.box.x, _opt.box.y, _opt.box.w, _opt.box.h);
		
		fn_draw_text(_opt.text, _opt.x, _opt.y, _opt_col[(o == lvl[l].opt_curr), 0], _opt_col[(o == lvl[l].opt_curr), 1]);
	}
}
