
//////// Funtions related to flags, variables that makes certain events happen only once


function fn_flag_setup() // Sets up flags
{
	global.flag_amtMax = 25;
	for (var f = 0; f < global.flag_amtMax; f++)
		global.flag[f] = -1;
	
	global.flag[0] = false; // Determines whether the player has selected a language when game started for the first time
}
