
function fn_chara_start() // start chara info
{
	global.chara_name_txt = "Eleanor";
	global.chara_awake = false;
	
	
	global.chara_mny[0] = 0; // (while sleeping)		// mny (money)
	global.chara_mny[1] = 0; // (while awake)
	
	global.chara_ccy[0] = "₢$ "; // (while sleeping)	// ccy (currency)
	global.chara_ccy[1] = "R$ "; // (while awake)
	
	
	for (var i = 0; i < global.eff_amtMax; i++) // effInv (array of effects the player has)
		global.chara_effInv[i] = false;
	global.chara_effInv[0] = true;
	global.chara_effInv[1] = true;
	global.chara_effInv[2] = true;
	
	for (var i = 0; i < global.itm_amtMax; i++) // itmInv (array of items the player has)
		global.chara_itmInv[i] = false;
	global.chara_itmInv[i] = true;
	
	for (var i = 0; i < global.thm_amtMax; i++) // thmInv (array of themes the player has)
		global.chara_thmInv[i] = false;
	global.chara_thmInv[THM.DFLT] = true;
	global.chara_thmInv[THM.SMPL] = true;
	global.chara_thmInv[THM.MADOT] = true;
	global.chara_thm = THM.DFLT; // (equipped theme)
}
