
if (itm_old != global.player_itmCurr) || (eff_old != global.player_effCurr)
{
	fn_actor_evCreate();
	itm_old = global.player_itmCurr;
	eff_old = global.player_effCurr;
}

event_inherited();


// the actual code is at {obj_prop_parent} and {obj_actor_parent}, you silly



// The messages that have been erased remain in our hearts and minds.
