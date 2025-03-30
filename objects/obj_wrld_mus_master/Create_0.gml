
fn_import();

image_speed = 0;
image_index = 0;
image_alpha = 0;

mus_amt = 5;
for (var i = 0; i < mus_amt; i++)
{
	mus[i] = -1;
	mus_volId[i] = VOL_MUSIC;
	mus_gainLvl[i] = 1;
	mus_gainTime[i] = 0;
}




if (wrld == rm_wrld_macaco) // macacolandia
{
	mus[0] = mus_wrld_macaco;
	mus_gainLvl[0] = 0.5;
}
if (wrld == rm_wrld_pikini) // fenda bo pikini
{
	mus[0] = mus_wrld_pikini;
	mus_gainLvl[0] = 0.5;
}



for (var i = 0; i < mus_amt; i++)
{
	if (mus[i] != -1)
	{
		fn_audio_play(mus[0], true, mus_volId[i], mus_gainLvl[i], mus_gainTime[i]);
	}
}