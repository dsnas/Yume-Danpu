/// @descr create

LVL_MAIN = 0;



var z = LVL_MAIN;

bg_spr[z, 0] = spr_menu_bg_0;
bg_x[z, 0] = 16;
bg_y[z, 0] = 8;
bg_w[z, 0] = 480;
bg_h[z, 0] = 240;

menu_lvl_txtdata(z, "salenis");
for (var i = 0; i < opt_amt[z]; i++)
{
	opt_x[z, i] = bg_x[z, 0] + (draw_dist / 2);
	opt_y[z, i] = bg_y[z, 0] + (draw_dist / 2) + (draw_dist * i);
}



// name's Template. Menu Template.
