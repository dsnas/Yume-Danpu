
// Functions related to the player's profile, which contains their main information


function fn_profile_setup()
{
	global.player_name = "Eleanor";
	global.player_awake = false;
	
	fn_money_setup();
	fn_eff_setup();
	fn_itm_setup();
	fn_thm_setup();
	fn_loot_setup();
	
	global.profile_file_name = "profile.ini";
	if (file_exists(global.profile_file_name) == false)
		fn_profile_file_save();
	else
		fn_profile_file_load();
}


// Functions related to saving and loading the player's profile
function fn_profile_file_save()
{
	ini_open(global.profile_file_name);
	ini_write_real("game", "ver", global.GAME_VER);
	ini_write_string("game", "msg", "Gosh, I wonder why someone would come here. It wouldn’t be to cheat, would it?");
	
	
	// Player
	ini_write_string("player", "name", global.player_name);
	
	// Money
	for (var m = 0; m < 2; m++)
		ini_write_real("money", $"amt_{m}", global.money_amt[m]);
	
	// Effects
	for (var e = 0; e < array_length(global.eff_unlocked); e++)
		ini_write_real("eff", $"unlocked_{e}", global.eff_unlocked[e]);
	
	// Items
	for (var i = 0; i < array_length(global.itm_unlocked); i++)
		ini_write_real("itm", $"unlocked_{i}", global.itm_unlocked[i]);
	
	// Themes
	for (var t = 0; t < array_length(global.thm_unlocked); t++)
		ini_write_real("thm", $"unlocked_{t}", global.thm_unlocked[t]);
	
	
	ini_close();
}
function fn_profile_file_load()
{
	ini_open(global.profile_file_name);
	
	
	if (ini_read_real("game", "ver", 0) == global.GAME_VER)
	{
		// Player
		global.player_name = ini_read_string("player", "name", "Salenis");
		
		// Money
		for (var m = 0; m < 2; m++)
			global.money_amt[m] = ini_read_real("money", $"amt_{m}", 0);
		
		// Effects
		for (var e = 0; e < array_length(global.eff_unlocked); e++)
			global.eff_unlocked[e] = ini_read_real("eff", $"unlocked_{e}", false);
		
		// Items
		for (var i = 0; i < array_length(global.itm_unlocked); i++)
			global.itm_unlocked[i] = ini_read_real("itm", $"unlocked_{i}", false);
		
		// Themes
		for (var t = 0; t < array_length(global.thm_unlocked); t++)
			global.thm_unlocked[t] = ini_read_real("thm", $"unlocked_{t}", false);
	}
	
	
	ini_close();
}
