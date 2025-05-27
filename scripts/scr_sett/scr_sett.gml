
function fn_sett_start() // start sett (settings)
{
	#macro SETT_LANG_EN 0 // English					// lang (languages)
	#macro SETT_LANG_BR 1 // Brazilian Portuguese
	global.sett_lang = SETT_LANG_EN;
	
	
	
	global.sett_fscr = false; // fullscreen
	
	
	
	#macro SETT_VOL_MAIN 0 // (master volume)	// vol (volume)
	global.sett_vol[SETT_VOL_MAIN] = 1;
	
	#macro SETT_VOL_MUS 1 // (music)
	global.sett_vol[SETT_VOL_MUS] = 0;
	
	#macro SETT_VOL_MENU 2 // (menu)
	global.sett_vol[SETT_VOL_MENU] = 1;
	
	#macro SETT_VOL_CHARA 3 // (player)
	global.sett_vol[SETT_VOL_CHARA] = 1;
	
	#macro SETT_VOL_OBJ 4 // (ambience)
	global.sett_vol[SETT_VOL_OBJ] = 1;
	
	#macro SETT_VOL_NPC 5 // (NPCs)
	global.sett_vol[SETT_VOL_NPC] = 1;
	
	#macro SETT_VOL_AMB 6 // (ambience)
	global.sett_vol[SETT_VOL_AMB] = 1;
	
	
	
	#macro SETT_INP_LT 0 // start inp (inputs/controls)
	#macro SETT_INP_RT 1
	#macro SETT_INP_UP 2
	#macro SETT_INP_DN 3
	global.sett_inp[SETT_INP_LT] = vk_left;
	global.sett_inp[SETT_INP_RT] = vk_right;
	global.sett_inp[SETT_INP_UP] = vk_up;
	global.sett_inp[SETT_INP_DN] = vk_down;
	
	#macro SETT_INP_SLCT 4
	#macro SETT_INP_CNCL 5
	global.sett_inp[SETT_INP_SLCT] = ord("Z");
	global.sett_inp[SETT_INP_CNCL] = ord("X");
	
	#macro SETT_INP_MENU_INV 6
	global.sett_inp[SETT_INP_MENU_INV] = ord("C");
	
	#macro SETT_INP_FSCR 7
	global.sett_inp[SETT_INP_FSCR] = vk_f4;
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
