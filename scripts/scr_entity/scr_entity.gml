
//////// Functions related to entities/NPCs


function fn_entity_getId() // Retrieves the ID of the entity, which determines its behavior and appearance
{
	entity_id = "";
	entity_preset = "";
	
	switch (object_index)
	{
		case obj_entity_macaco_monkey:
			entity_id = "macaco_monkey";
			entity_preset = "good";
			break;
		
		case obj_entity_dbgwrld_blood:
			entity_id = "dbgwrld_blood";
			entity_preset = "evil";
			break;
	}
}

function fn_entity_evCreate() // Create Event determined by the entity's ID
{
	fn_actor_evCreate();
	fn_actor_set_dir_spr(id, sprite_index);
	move_type.walk.dur = 32;
	move_type.walk.act = true;
	move_mode.rnd.act = true;
	if (entity_preset == "good") // Peaceful
	{
		image_index = 1;
		move_delay.act = true;
		move_chain.act = true;
	}
	else if (entity_preset == "evil") // Hostile
	{
		image_index = 2;
		noise.aud_asset = snd_entity_evil_noise;
		move_mode.chase.act = true;
		move_mode.chase.tgt = obj_player;
	}
		
	
	switch (entity_id)
	{
		case "macaco_monkey":
			render.imgSpd = (random_range(0.5, 1.5) / 30);
			talk_type.bell.act = true;
			fn_talker_talk_type_bell_aud_asset("snd_entity_macaco_monkey_");
			break;
		
		case "dbgwrld_blood":
			render.imgSpd = (random_range(0.5, 1.5) / 30);
			break;
	}
}
function fn_entity_evStep() // Step Event determined by the entity's ID
{
	if (talk_type.bell.act == true && talk_stg == 0)
	{
		switch (entity_id)
		{
			case "macaco_monkey": // Macacolandia monkey
				talk_type.bell.aud_idx = irandom_range(0, 4);
				if (irandom_range(1, 100) <= 5)
					talk_type.bell.aud_idx = irandom_range(5, 6);
				break;
		}
	}
	
	event_inherited();
	fn_actor_evStep();
}




// I am not insane. I am not in pain. I am not Shane. Have you seen the walls? Have you seen the balls? Have you seen the dolls? The dog is barking for food. The dog is barking for good. The dog is barking for wood. There is no one here. There is no one near. There is no fun fear.
