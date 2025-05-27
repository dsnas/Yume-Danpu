/// @descr opt move - normal

if (opt_move == true)
{
	var _pos_old = opt_pos;
	opt_pos += (fn_inp("press", SETT_INP_DN) - fn_inp("press", SETT_INP_UP)); // move
	
	if (opt_pos < 0) // pos switch sides if reached limit
		opt_pos = (opt_amt[lvl] - 1);
	if (opt_pos >= opt_amt[lvl])
		opt_pos = 0;

	if (_pos_old != opt_pos) // play snd
		fn_audio_play(snd_menu_opt_move, false, SETT_VOL_MENU, 1, 0);
}
