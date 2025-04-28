
for (var i = 0; i < global.sett_inpAmt; i++) // separates input as pressed or held into arrays
{
	press[i] = keyboard_check_pressed(global.sett_inp[i]);
	hold[i] = keyboard_check(global.sett_inp[i]);
}



if (press[INP_FSCR] == true) // toggles fullscreen variable on/off
	global.sett_fscr = !global.sett_fscr;

if (fscr_delay <= 0) // toggles fullscreen mode with a delay (to avoid issues)
{
	if (fscr != global.sett_fscr)
	{
		fscr = global.sett_fscr;
		fscr_delay = fscr_maxDelay;
		window_set_fullscreen(fscr);
	}
}
else
	fscr_delay -= 1;
