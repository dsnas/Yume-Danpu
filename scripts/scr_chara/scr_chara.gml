
function fn_chara_start() // Start chara info (the player's information)
{
	global.chara_name_txt = "Eleanor";
	global.chara_awake = false;
	
	
	/* mny (Money) */
	global.chara_mny[0] = 0; // (While sleeping)
	global.chara_mny[1] = 0; // (While awake)
	
	/* ccy (Currency) */
	global.chara_ccy[0] = "₢$ "; // (While sleeping)
	global.chara_ccy[1] = "R$ "; // (While awake)
	
	
	
}
