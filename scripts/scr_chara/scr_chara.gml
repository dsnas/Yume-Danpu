
function fn_chara_start() // start chara info
{
	global.chara_awake = false;
	
	global.chara_name_txt = "Eleanor";
	
	global.chara_mny[0] = 0; // (while sleeping)		// mny (money)
	global.chara_mny[1] = 0; // (while awake)
	
	global.chara_ccy[0] = "₢$ "; // (while sleeping)	// ccy (currency)
	global.chara_ccy[1] = "R$ "; // (while awake)
	
	
	for (var i = 0; i < global.eff_amtMax; i++) // (array of effects the player has)
		global.chara_effInv[i] = false;
	global.chara_effInv[0] = true;
	global.chara_effInv[1] = true;
	global.chara_effInv[2] = true;
	global.chara_effInv[3] = true;
	
	
	for (var i = 0; i < global.thm_amtMax; i++) // (array of themes the player has)
		global.chara_thmInv[i] = false;
	global.chara_thmInv[THM_DFLT] = true;
	global.chara_thmInv[THM_SIMPLE] = true;
	global.chara_thmInv[THM_MADOT] = true;
	global.chara_thm = 2; // thm (equipped theme)
}
