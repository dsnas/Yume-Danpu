
image_speed = 0;
image_index = 0;
image_alpha = 0;

fn_import();




bg_amtMax = 25;
for (var i = 0; i < bg_amtMax; i++)
	bg_obj[i] = -1;
bg_depthMax = (layer_get_depth("Background") - 1);




fn_wrld_bg_create_0(); // create event based on the world the player is currently in [0]




for (var i = 0; i < bg_amtMax; i++)
{
	if (bg_obj[i] != -1)
	{
		fn_spawn(bg_obj[i], 0, 0);
		obj.depth = (bg_depthMax - i);
	}
}




fn_wrld_bg_create_1(); // create event based on the world the player is currently in [0]
