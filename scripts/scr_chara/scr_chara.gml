
function fn_chara_start() // start chara info
{
	global.chara_awake = false;
	
	global.chara_name_txt = "Eleanor";
	
	global.chara_mny[0] = 0; // (while sleeping)		// mny (money)
	global.chara_mny[1] = 0; // (while awake)
	
	global.chara_ccy[0] = "₢$ "; // (while sleeping)	// ccy (currency)
	global.chara_ccy[1] = "R$ "; // (while awake)
	
	global.chara_thm = 2; // thm (current theme)
}


