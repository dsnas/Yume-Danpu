
function fn_menu_pse_resume() // resumes the game
{
	fn_menu_lvlTrans_start(lvl_amtMax, true);
	
	if (scrSv_spr != -1)
	{
		if (file_exists(scrSv_fname) == true)
			file_delete(scrSv_fname);
		if (sprite_exists(scrSv_spr) == true)
			sprite_delete(scrSv_spr);
		scrSv_spr = -1;
	}
	
	instance_activate_all();
	audio_resume_all();
	
	wrld_chara.move_stg = -1;
}
