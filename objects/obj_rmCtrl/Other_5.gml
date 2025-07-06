
if (active == true)
{
	// Room's background
	for (var b = 0; b < array_length(bg_clouds); b++)
	{
		if (bg_clouds[b] != -1)
			fn_obj_destroy(bg_clouds[b]);
	}

	for (var b = 0; b < array_length(bg_sky); b++)
	{
		if (bg_sky[b] != -1)
			fn_obj_destroy(bg_sky[b]);
	}
}