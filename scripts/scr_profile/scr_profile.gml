
function fn_profile_setup()
{
	// Player
	global.player_name = "Eleanor";
	global.player_awake = false
	
	// Money
	fn_money_setup();
	
	// Effects, items and themes
	fn_eff_setup();
	fn_itm_setup();
	fn_thm_setup();
}
