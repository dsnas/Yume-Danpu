
function fn_game_inp_create() // create event
{
	fscr = -1;
	fscr_delay = 0;
	fscr_maxDelay = 30;
}

function fn_game_inp_step() // step event
{
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
}

















/*
	left	= global.sett_inp[INP_LEFT];
	right	= global.sett_inp[INP_RIGHT];
	up		= global.sett_inp[INP_UP];
	down	= global.sett_inp[INP_DOWN];
	select	= global.sett_inp[INP_SELECT];
	cancel	= global.sett_inp[INP_CANCEL];
	
	
	press_left	= keyboard_check_pressed(left);
	press_right	= keyboard_check_pressed(right);
	press_up	= keyboard_check_pressed(up);
	press_down	= keyboard_check_pressed(down);
	
	hold_left	= keyboard_check(left);
	hold_right	= keyboard_check(right);
	hold_up		= keyboard_check(up);
	hold_down	= keyboard_check(down);
	
	
	press_select = keyboard_check_pressed(select);
	press_cancel = keyboard_check_pressed(cancel);
	
	hold_select = keyboard_check(select);
	hold_cancel = keyboard_check(cancel);
	
	
	press_fscr		= keyboard_check_pressed(global.sett_inp[INP_FSCR]);
	press_atwalk	= keyboard_check_pressed(global.sett_inp[INP_ATWALK]);
	*/