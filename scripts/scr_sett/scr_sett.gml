
function fn_sett_start() // start settings
{
	#macro LANG_EN 0	// language
	#macro LANG_BR 1
	global.sett_lang = LANG_EN;
	
	
	global.sett_fscr = false; // fullscreen
	
	
	#macro VOL_MASTER 0	// volume
	#macro VOL_MUSIC 1
	#macro VOL_PLAYER 2
	#macro VOL_MENU 3
	#macro VOL_CREATURES 4
	#macro VOL_ENVIRONMENT 5
	global.sett_vol[VOL_MASTER] = 0.5;
	global.sett_vol[VOL_MUSIC] = 1;
	global.sett_vol[VOL_PLAYER] = 1;
	global.sett_vol[VOL_MENU] = 1;
	global.sett_vol[VOL_CREATURES] = 1;
	global.sett_vol[VOL_ENVIRONMENT] = 1;
	
	
	#macro INP_LEFT 0	// inputs (controls)
	#macro INP_RIGHT 1
	#macro INP_UP 2
	#macro INP_DOWN 3
	#macro INP_SELECT 4
	#macro INP_CANCEL 5
	#macro INP_FSCR 6
	#macro INP_ATWALK 7
	global.sett_inp[INP_LEFT]	= vk_left;
	global.sett_inp[INP_RIGHT]	= vk_right;
	global.sett_inp[INP_UP]		= vk_up;
	global.sett_inp[INP_DOWN]	= vk_down;
	global.sett_inp[INP_SELECT]	= ord("Z");
	global.sett_inp[INP_CANCEL]	= ord("X");
	global.sett_inp[INP_FSCR]	= vk_f4;
	global.sett_inp[INP_ATWALK]	= ord("V");
	global.sett_inpAmt = array_length(global.sett_inp);
}


/*
	global.sett_gfx = true;
	
	global.sett_showfps = false;
	global.sett_autowalk = false;
*/
