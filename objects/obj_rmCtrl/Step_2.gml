
if (active == true)
{
	// Room's camera
	if (cam_tgt != -1 && fn_obj_exists(cam_tgt) == true)
	{
		cam_x = (cam_tgt.render.x + (cam_tgt.sprite_width / 2) - (cam_w / 2));
		if (cam_lock_xAct == true)
			cam_x = cam_lock_x;
	
		cam_y = (cam_tgt.render.y - (cam_tgt.sprite_height / 2) - (cam_h / 2));
		if (cam_lock_yAct == true)
			cam_y = cam_lock_y;
	
		camera_set_view_pos(cam, cam_x, cam_y);
		camera_set_view_size(cam, cam_w, cam_h);
	}
}
