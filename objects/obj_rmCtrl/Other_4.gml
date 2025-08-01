
active = true;


// Room's camera
cam_x = 0;
cam_y = 0;
cam_w = 320;
cam_h = 240;
cam_tgt = obj_player;
cam = camera_create_view(0, 0, cam_w, cam_h);

view_enabled = true;
view_set_visible(0, true);
view_set_wport(0, 640);
view_set_hport(0, 480);
view_set_camera(0, cam);

fn_rmCtrl_cam_lock_act();


// Room's background
bg_clouds[0] = -1;
bg_sky[0] = -1;


// Infinite looping of the room
fn_rmCtrl_loop_act();


fn_rmCtrl_getId();
fn_rmCtrl_evCreate();
