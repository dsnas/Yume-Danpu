/// @descr (eff lvl) desc

var l = LVL_EFF;

lbl_txt[l, 1] = ""; // eff desc (effect description)
var _pos = opt_pos[l];
if (global.chara_effInv[_pos] == true)
{
	lbl_txt[l, 1] = global.eff_desc_txt[_pos];
	fn_dbg(global.eff_desc_txt[_pos]);
}
lbl_x[l, 1] = (wnd_x[l, 1] + draw_dist);
lbl_y[l, 1] = (wnd_y[l, 1] + wnd_h[l, 1] - draw_dist);
lbl_vAl[l, 1] = fa_bottom;
