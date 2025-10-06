
randomize();
fn_config_setup();
window_set_caption(global.config.name);
window_set_color(c_black);
window_set_size((global.config.vid.resW * global.config.vid.resMult), (global.config.vid.resH * global.config.vid.resMult));
window_center();

fscr_act = -1;
fscr_waitMax = 15;
fscr_wait = fscr_waitMax;

vsync_act = -1;

showCsr_act = -1;




fn_obj_img( , , , , 0);
fn_obj_depth( , -15000);




// Yes! Yes! This is the pineapple of society! Ha! Ha-ha!
