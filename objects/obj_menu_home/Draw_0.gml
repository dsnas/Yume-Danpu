
var l = lvl_curr;
if (l == LVL_LANG)
{	
	for (var d = 2; d < array_length(lvl[l].decor); d++)
		lvl[l].decor[d].alpha = ((d - 2) == lvl[l].option_curr);
}


event_inherited();

