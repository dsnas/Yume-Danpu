
fn_import();

image_speed = 0;
image_index = 0;
image_alpha = 0;

mus_amt = 5;
for (var i = 0; i < mus_amt; i++)
{
	mus[i] = -1;
	mus_vol[i] = 1;
	mus_volIdx[i] = SETT_VOL.MUS;
	mus_volDur[i] = 0;
}



if (wrld_rm == rm_wrld_macaco) // macacolandia
{
	mus[0] = mus_wrld_macaco;
	mus_vol[0] = 0.25;
}
if (wrld_rm == rm_wrld_pikini) // fenda bo pikini
{
	mus[0] = mus_wrld_pikini;
	mus_vol[0] = 0.75;
	
	mus[1] = snd_wrld_pikini;
	mus_volIdx[1] = SETT_VOL.AMB;
	mus_vol[1] = 1;
}


for (var i = 0; i < mus_amt; i++)
{
	if (mus[i] != -1)
	{
		fn_aud_play(mus[i], mus_volIdx[i], true, mus_vol[i], mus_volDur[i]);
	}
}