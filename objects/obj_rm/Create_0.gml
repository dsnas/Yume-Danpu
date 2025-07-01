
fn_obj_img( , , , , 0);
fn_obj_depth( , -9000);


fn_rm_getId();


mus_amtMax = 3;
for (var i = 0; i < mus_amtMax; i++)
	fn_rm_mus_add(i, -1);

fn_rm_loop_act();

rm_curTemp = room;


fn_rm_evCreate();
