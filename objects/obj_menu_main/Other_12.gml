/// @descr [draw gui] inside lvls loop

var l = ll;


if (l == LVL_LANG) // lang lvl
{
	for (var f = 0; f < opt_amt[l]; f++) // [lang lvl] flags and slctr
	{
		if (lvlTrans_tgtLvl == -1) || (lvlTrans_tgtLvl != -1 && l == lvlTrans_tgtLvl) // [lang lvl] slctr alp animation
			lang_slctr_alp[f] = fn_lerp(lang_slctr_alp[f], (f == opt_pos[l]), optSlctr_alpSpd);
		var _slctr_alp = (lang_slctr_alp[f]);
		/* [lang lvl] slctr */ fn_draw_spr(lang_slctr_spr, 0, lang_slctr_x[f], lang_slctr_y[f], 1, 1, 0, lang_slctr_col, _slctr_alp, true);
		
		
		var _slctr_alpTgt = lang_flag_alpDflt[f]; // [lang lvl] flags alp animation
		if (f == opt_pos[l])
			_slctr_alpTgt = lang_flag_alpSlct[f];
		lang_flag_alp[f] = lerp(lang_flag_alp[f], _slctr_alpTgt, opt_colSpd);
		/* [lang lvl] flags */ fn_draw_spr(lang_flag_spr, f, lang_flag_x[f], lang_flag_y[f], 1, 1, 0, c_white, (lang_flag_alp[f] * lvl_alp[l] * draw_alp), true);
	}
}
