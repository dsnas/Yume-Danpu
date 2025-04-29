/// @descr opt move - normal

if (opt_move == true)
{
	opt_pos += (opt_move_inp[lvl, 1] - opt_move_inp[lvl, 0]); // move
	
	if (opt_pos < 0) // pos switch sides
		opt_pos = (opt_amt[lvl] - 1);
	if (opt_pos >= opt_amt[lvl])
		opt_pos = 0;
}
