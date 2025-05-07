
if (fn_inp("press", SETT_INP_FSCR) == true) // toggles fscr sett
{
	global.sett_fscr = !global.sett_fscr;
}

if (fscr_delay <= 0) // toggles fscr mode with a delay (to avoid issues)
{
	if (fscr != global.sett_fscr)
	{
		fscr = global.sett_fscr;
		fscr_delay = fscr_maxDelay;
		window_set_fullscreen(global.sett_fscr);
	}
}
else
	fscr_delay -= 1;
