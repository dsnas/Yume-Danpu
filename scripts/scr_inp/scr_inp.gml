
function fn_inp_step()
{
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
}


