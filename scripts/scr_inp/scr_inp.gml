
function fn_inp_step()
{
	left	= global.sett_inp[INP_LEFT];
	right	= global.sett_inp[INP_RIGHT];
	up		= global.sett_inp[INP_UP];
	down	= global.sett_inp[INP_DOWN];
	sel		= global.sett_inp[INP_SEL];
	can		= global.sett_inp[INP_CAN];
	
	press_left	= keyboard_check_pressed(left);
	press_right	= keyboard_check_pressed(right);
	press_up	= keyboard_check_pressed(up);
	press_down	= keyboard_check_pressed(down);
	
	hold_left	= keyboard_check(left);
	hold_right	= keyboard_check(right);
	hold_up		= keyboard_check(up);
	hold_down	= keyboard_check(down);
	
	press_sel	= keyboard_check_pressed(sel);
	press_can	= keyboard_check_pressed(can);
	
	hold_sel	= keyboard_check(sel);
	hold_can	= keyboard_check(can);
	
	press_fscr		= keyboard_check_pressed(global.sett_inp[INP_FSCR]);
	press_atwalk	= keyboard_check_pressed(global.sett_inp[INP_ATWALK]);
}


