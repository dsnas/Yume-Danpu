
//////// Functions related to money


function fn_money_setup() // Sets up the money
{
	// While sleeping
	global.money_amt[0] = 0;
	global.money_ccy[0] = "₢$ "; // Currency
	
	// While awake
	global.money_amt[1] = irandom_range(4, 13);
	global.money_ccy[1] = "R$ "; // Currency
}


function fn_money_amt_mod(_value)
{
	global.money_amt[global.player_awake] += _value;
	fn_profile_file_save();
}
