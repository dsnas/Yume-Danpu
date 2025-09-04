
// Camera
cam =
{
	id : -1,
	
	x : 0,
	y : 0,
	w : 320,
	h : 240,
	
	tgt : obj_player,
	
	lock :
	{
		x : undefined,
		y : undefined
	}
}
cam.id = camera_create_view(cam.x, cam.y, cam.w, cam.h);
view_enabled = true;
view_set_visible(0, true);
view_set_wport(0, 640);
view_set_hport(0, 480);
view_set_camera(0, cam.id);


// Background
for (var b = 0; b < bg_lenMax; b++)
{
	if (bg[b] != -1 && fn_obj_exists(bg[b]) == true)
	{
		fn_obj_destroy(b);
		bg[b] = -1;
	}
}


// Loop
loop =
{
	xAct : false, // Determines whether the room loops infinitely along the horizontal axis
	yAct : false // Determines whether the room loops infinitely along the vertical axis
}


fn_stage_evCreate();
