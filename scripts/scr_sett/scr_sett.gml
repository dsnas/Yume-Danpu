
function fn_sett_start() // start settings
{
	global.sett_fscr = false;
	
	
	
	#macro VOL_MASTER 0 // volume
	#macro VOL_MUSIC 1
	#macro VOL_PLAYER 2
	#macro VOL_MENU 3
	#macro VOL_CREATURES 4
	#macro VOL_ENVIRONMENT 5
	global.sett_vol[VOL_MASTER] = 1;
	global.sett_vol[VOL_MUSIC] = 1;
	global.sett_vol[VOL_PLAYER] = 1;
	global.sett_vol[VOL_MENU] = 1;
	global.sett_vol[VOL_CREATURES] = 1;
	global.sett_vol[VOL_ENVIRONMENT] = 1;
	
	
	
	#macro INP_LEFT 0 // input (controls)
	#macro INP_RIGHT 1
	#macro INP_UP 2
	#macro INP_DOWN 3
	#macro INP_SEL 4
	#macro INP_CAN 5
	#macro INP_FSCR 6
	#macro INP_ATWALK 7
	global.sett_inp[INP_LEFT]	= vk_left;
	global.sett_inp[INP_RIGHT]	= vk_right;
	global.sett_inp[INP_UP]		= vk_up;
	global.sett_inp[INP_DOWN]	= vk_down;
	global.sett_inp[INP_SEL]	= ord("Z");
	global.sett_inp[INP_CAN]	= ord("X");
	global.sett_inp[INP_FSCR]	= vk_f4;
	global.sett_inp[INP_ATWALK]	= ord("V");
}
