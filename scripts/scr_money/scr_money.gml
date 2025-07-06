
//////// Functions related to money


function fn_money_setup() // Sets up the money
{
	// While sleeping
	global.money[0] = 0;
	global.money_ccy[0] = "₢$ "; // Currency
	
	// While awake
	global.money[1] = 0;
	global.money_ccy[1] = "R$ "; // Currency
}


function fn_money_mod(_value)
{
	global.money[global.player_awake] += _value;
}
