
function fn_sett_start() // start settings
{
	#macro LANG_EN 0 // language
	#macro LANG_BR 1
	
	global.sett_lang = LANG_EN;
	
	
	
	global.sett_fscr = false; // fullscreen
	
	
	
	#macro VOL_MASTER 0	// volume
	#macro VOL_MUSIC 1
	#macro VOL_PLAYER 2
	#macro VOL_MENU 3
	#macro VOL_CREATURES 4
	#macro VOL_ENVIRONMENT 5
	
	global.sett_vol[VOL_MASTER] = 1;
	global.sett_vol[VOL_MUSIC] = 0;
	global.sett_vol[VOL_PLAYER] = 1;
	global.sett_vol[VOL_MENU] = 1;
	global.sett_vol[VOL_CREATURES] = 1;
	global.sett_vol[VOL_ENVIRONMENT] = 0;
	
	
	
	#macro INP_LT 0 // start inp (inputs/controls)
	#macro INP_RT 1
	#macro INP_UP 2
	#macro INP_DN 3
	global.sett_inp[INP_LT] = vk_left;
	global.sett_inp[INP_RT] = vk_right;
	global.sett_inp[INP_UP] = vk_up;
	global.sett_inp[INP_DN] = vk_down;
	
	#macro INP_SLCT 4
	#macro INP_CNCL 5
	global.sett_inp[INP_SLCT] = ord("Z");
	global.sett_inp[INP_CNCL] = ord("X");
	
	#macro INP_FSCR 6
	global.sett_inp[INP_FSCR] = vk_f4;
	
}

function fn_inp(_type, _inp)
{
	if (_type == "press")
	{
		return keyboard_check_pressed(global.sett_inp[_inp]);
	}
	else if (_type == "hold")
	{
		return keyboard_check(global.sett_inp[_inp]);
	}
}


/*
	global.sett_gfx = true;
	
	global.sett_showfps = false;
	global.sett_autowalk = false;
*/
