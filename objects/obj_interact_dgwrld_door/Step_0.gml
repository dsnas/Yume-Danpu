
event_inherited();


if (room == rm_nexus)
{
	var _secret_dist = abs(distance_to_object(obj_player));
	var _secret_distMin = 32;
	var _secret_alpAmt = (_secret_dist / _secret_distMin);
	_secret_alpAmt = clamp(_secret_alpAmt, 0, 1);
	var _secret_alpSpd = 0.05;
	image_alpha = lerp(image_alpha, (1 - _secret_alpAmt), _secret_alpSpd);
}
