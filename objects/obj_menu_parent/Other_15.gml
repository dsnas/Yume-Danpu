/// @descr [opt move] dflt/normal

var l = lvl;


if (opt_move == true)
{
	var _pos_old = opt_pos[l];
	
	opt_pos[l] += (fn_inp("press", opt_moveDflt_inp[l][opt_pos[l]][1]) - fn_inp("press", opt_moveDflt_inp[l][opt_pos[l]][0])); // (movement)
	
	if (opt_pos[l] < 0) // (teleports the position to the opposite side of the array if it had crossed limits)
		opt_pos[l] = (opt_amt[l] - 1);
	if (opt_pos[l] >= opt_amt[l])
		opt_pos[l] = 0;
	
	if (_pos_old != opt_pos[l]) // (plays sound when the position changes)
		fn_aud_play(global.thm_snd_optMove[global.chara_thm], SETT_VOL.MENU);
}
