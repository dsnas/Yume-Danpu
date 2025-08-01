
//////// Functions related to entities/NPCs


function fn_entity_getId() // Retrieves the ID of the NPC, which determines its behavior and appearance
{
	entity_id = "";
	chara_preset = "";
	
	switch (room)
	{
		case rm_nexus: // Nexus
			entity_id = "help";
			chara_preset = "entity_evil";
			break;
		case rm_macaco: // Macacolandia
		case rm_dbgwrld: // Debug World
			entity_id = "macaco_citizen";
	}
}

function fn_entity_evCreate() // Create Event determined by the NPC's ID
{
	fn_chara_setup(chara_preset);
	
	
	// Macacolandia monkey citizen
	if (entity_id == "macaco_citizen")
	{
		self_imgSpd = (random_range(0.5, 1.5) / 30);
		
		dir[DIR_LT].spr = spr_entity_macaco_citizen;
		dir[DIR_RT].spr = dir[DIR_LT].spr;
		dir[DIR_UP].spr = dir[DIR_LT].spr;
		dir[DIR_DN].spr = dir[DIR_LT].spr;
		
		talk_type.bell.act = true;
	}
}
function fn_entity_evStep() // Step Event determined by the NPC's ID
{
	fn_chara_move();
	
	
	// Macacolandia monkey citizen
	if (entity_id == "macaco_citizen")
	{
		
	}
}




// I am not insane. I am not in pain. I am not Shane. Have you seen the walls? Have you seen the balls? Have you seen the dolls? The dog is barking for food. The dog is barking for good. The dog is barking for wood. There is no one here. There is no one near. There is no fun fear.
