
// Talk (interaction sequence)
if (talk.act == true && talk.type.door.act == true)
{
	var _door = talk.type.door;
	if (_door.close.snd_asset != -1 && _door.close.snd_style != -1)
		fn_aud_play(_door.close.snd_asset, _door.close.snd_style);
}


// Noise (audio that can only be heard if the player is near the object)
if (audio_is_playing(noise.aud.id) == true)
	fn_aud_stop(noise.aud.id);
