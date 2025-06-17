
//////// Functions related to the player


function fn_player_setup() // Sets up the player's main information
{
	global.player_name = "Eleanor";
	global.player_awake = false;
	
	
	// Money
	global.player_mny[0] = 0; // While sleeping
	global.player_mny[1] = 0; // While awake
	
	// Currency
	global.player_ccy[0] = "₢$ "; // While sleeping
	global.player_ccy[1] = "R$ "; // While awake
	
	
	// Autowalk
	global.player_atwlk = false;
}
