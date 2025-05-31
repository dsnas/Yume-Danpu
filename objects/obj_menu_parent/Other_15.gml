/// @descr opt move → normal

var l = lvl;

if (opt_move == true)
{
	var _pos_old = opt_pos[l];
	
	opt_pos[l] += (fn_inp("press", SETT_INP.DN) - fn_inp("press", SETT_INP.UP)); // move
	if (opt_pos[l] < 0) // pos switch sides if reached limit
		opt_pos[l] = (opt_amt[l] - 1);
	if (opt_pos[l] >= opt_amt[l])
		opt_pos[l] = 0;
	
	if (_pos_old != opt_pos[l]) // play snd
		fn_aud_play(global.thm_snd_optMove[global.chara_thm], SETT_VOL.MENU);
}
