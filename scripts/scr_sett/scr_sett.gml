
function fn_sett_start() // start sett (settings)
{
	#macro SETT_LANG_EN 0 // English					// lang (languages)
	#macro SETT_LANG_BR 1 // Brazilian Portuguese
	global.sett_lang = SETT_LANG_EN;
	
	
	
	global.sett_fscr = false; // fullscreen
	
	
	
	#macro VOL_MAIN 0 // (master volume)	// vol (volume)
	global.sett_vol[VOL_MAIN] = 1;
	
	#macro VOL_MUS 1 // (music)
	global.sett_vol[VOL_MUS] = 0;
	
	#macro VOL_CHARA 2 // (player)
	global.sett_vol[VOL_CHARA] = 1;
	
	#macro VOL_OBJ 3 // (ambience)
	global.sett_vol[VOL_OBJ] = 1;
	
	#macro VOL_NPC 4 // (NPCs)
	global.sett_vol[VOL_NPC] = 1;
	
	#macro VOL_AMB 5 // (ambience)
	global.sett_vol[VOL_AMB] = 1;
	
	
	
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
