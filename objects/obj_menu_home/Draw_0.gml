
var l = lvl_curr;
if (l == LVL_LANG)
{	
	for (var d = 0; d < array_length(lvl[l].decor); d++)
		lvl[l].decor[d].alpha = (d == lvl[l].option_curr);
}


event_inherited();

