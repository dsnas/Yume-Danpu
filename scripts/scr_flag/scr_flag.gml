
function fn_flag_start() // Starts flags (variables that makes certain events happen only once)
{
	global.flag_amtMax = 25;
	for (var f = 0; f < global.flag_amtMax; f++)
		global.flag[f] = -1;
	
	global.flag[0] = false; // (Whether a language was chosen the first time the game started)
}
