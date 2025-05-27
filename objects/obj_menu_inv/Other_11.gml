/// @descr step

if (trans_stg == -1)
{
	event_user(5); // opt move - normal
	
	if (fn_inp("press", SETT_INP_SLCT) == true) // opt slct
	{
		trans_stg = 0;
		
		if (lvl == LVL_MAIN)
			trans_lvl = 1;
	}
}






/* (unused) slide-in trans (transition animation)
draw_xTgt = 0;
if (destroy_stg > -1)
	draw_xTgt = -8;
draw_x = lerp(draw_x, draw_xTgt, 0.25);
*/