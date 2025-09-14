
if (itm_old != global.player.itm_curr) || (eff_old != global.player.eff_curr)
{
	fn_actor_evCreate();
	itm_old = global.player.itm_curr;
	eff_old = global.player.eff_curr;
}




// the actual code is at {obj_prop_parent} and {obj_actor_parent}, you silly
event_inherited();


if (move.stg == -1)
{
	if (fn_key_pressed(CONFIG_KEY.MENU_INV) == true) || (fn_key_pressed(CONFIG_KEY.MENU_PSE) == true)
	{
		move.stg = -2;
		
		if (fn_key_pressed(CONFIG_KEY.MENU_INV) == true)
		{
			fn_menu_obj_create("inv");
		}
		else if (fn_key_pressed(CONFIG_KEY.MENU_PSE) == true)
		{
			fn_menu_obj_create("pse");
		}
	}
}




// The messages that have been erased remain in our hearts and minds.
