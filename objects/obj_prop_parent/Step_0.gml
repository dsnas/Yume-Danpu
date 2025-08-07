
// Noise (audio that can only be heard if the player is near the object)
if (noise.act == true && noise.aud.asset == -1 && noise.aud.style == -1)
{
	if (noise.aud.id == -1)
	{
		if (noise.delay.act == false) || (noise.delay.act == true && noise.delay.durCurr <= 0)
		{
			if (noise.delay.act == true)
				noise.delay.durCurr = irandom_range(noise.delay.durMin, noise.delay.durMax);
			noise.aud.id = fn_aud_play(noise.aud.asset, noise.aud.style, 0, , , noise.aud.loops);
		}
		else
			noise.delay.durCurr -= 1;
	}
	else
	{
		if (audio_is_playing(noise.aud.id) == true)
		{
			var _aud_volTgt = (1 - (clamp(distance_to_object(obj_player), 0, noise.distMin) / noise.distMin));
			var _aud_volSpd = 0.05;
			noise.aud.vol = lerp(noise.aud.vol, _aud_volTgt, _aud_volSpd);
			fn_aud_vol(noise.aud.asset, noise.aud.id, noise.aud.style, noise.aud.vol);
		}
		else
			noise.aud.id = -1;
	}
}
