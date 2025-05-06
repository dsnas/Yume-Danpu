/// @descr opt move - normal

if (opt_move == true)
{
	opt_pos += (fn_inp("press", INP_DN) - fn_inp("press", INP_UP)); // move
	
	if (opt_pos < 0) // pos switch sides
		opt_pos = (opt_amt[lvl] - 1);
	if (opt_pos >= opt_amt[lvl])
		opt_pos = 0;
}
