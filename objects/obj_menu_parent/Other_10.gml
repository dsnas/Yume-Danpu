/// @descr Option confirm results
// Disable the confirmation sound by modifying the variable "_confirm_snd" to -1


if (lvl_curr = LVL_MAIN && _option_curr < 3)
{
	lvl_curr = LVL_OTHER;
}
else
	_confirm_snd = -1;


