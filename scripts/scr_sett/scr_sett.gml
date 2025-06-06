
function fn_sett_start() // start sett (settings)
{
	enum SETT_LANG // lang (languages)
	{
		EN = 0, // (English)
		BR = 1 // (Brazilian Portuguese)
	}
	global.sett_lang = SETT_LANG.EN;
	
	
	global.sett_fscr = false; // fscr (fullscreen)
	
	
	enum SETT_VOL // vol (volume)
	{
		MAIN = 0,
		MUS = 1,
		MENU = 2,
		CHARA = 3,
		PROP = 4,
		NPC = 5,
		AMB = 6
	}
	global.sett_vol[SETT_VOL.MAIN]	= 1; // (master: controls all the others)
	global.sett_vol[SETT_VOL.MUS]	= 1; // (music)
	global.sett_vol[SETT_VOL.MENU]	= 1; // (menu) 
	global.sett_vol[SETT_VOL.CHARA]	= 1; // (player)
	global.sett_vol[SETT_VOL.PROP]	= 1; // (props)
	global.sett_vol[SETT_VOL.NPC]	= 1; // (NPCs)
	global.sett_vol[SETT_VOL.AMB]	= 1; // (ambience)
	
	
	enum SETT_INP // inp (inputs/controls)
	{
		RT = 0,
		LT = 1,
		UP = 2,
		DN = 3,
		SLCT = 4,
		CNCL = 5,
		MENU_INV = 6,
		MENU_PSE = 7,
		FSCR = 8
	}
	global.sett_inp[SETT_INP.RT] = vk_right;
	global.sett_inp[SETT_INP.LT] = vk_left;
	global.sett_inp[SETT_INP.UP] = vk_up;
	global.sett_inp[SETT_INP.DN] = vk_down;
	global.sett_inp[SETT_INP.SLCT] = ord("Z");
	global.sett_inp[SETT_INP.CNCL] = ord("X");
	global.sett_inp[SETT_INP.MENU_INV] = ord("C");
	global.sett_inp[SETT_INP.MENU_PSE] = vk_escape;
	global.sett_inp[SETT_INP.FSCR] = vk_f4;
	
	
	global.sett_lowGFX = false; // lowGFX (low graphics)
	global.sett_rdcdMot = false; // rdcdMot (reduced motion)
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
