
//////// Functions related to entities/NPCs


function fn_entity_getId() // Retrieves the ID of the NPC, which determines its behavior and appearance
{
	entity_id = "";
	
	// Macacolandia monkey citizen
	if (room == rm_dbgwrld) || (room == rm_macaco)
		entity_id = "macaco_citizen";
}

function fn_entity_evCreate() // Create Event determined by the NPC's ID
{
	// Macacolandia monkey citizen
	if (entity_id == "macaco_citizen")
	{
		self_imgSpd = (random_range(0.5, 1.5) / 30);
		
		dir_spr[DIR_LT] = spr_entity_macaco_citizen;
		dir_spr[DIR_RT] = dir_spr[DIR_LT];
		dir_spr[DIR_UP] = dir_spr[DIR_LT];
		dir_spr[DIR_DN] = dir_spr[DIR_LT];
		
		move_preset = MOVE_PRESET_ENTITY_PEACE;
		
		interact_type = INTERACT_TYPE_MEOW;
		
		fn_interact_meow_addAsset("snd_entity_macaco_citizen_");
	}
}
function fn_entity_evStep() // Step Event determined by the NPC's ID
{
	// Macacolandia monkey citizen
	if (entity_id == "macaco_citizen")
	{
		// Interaction sequence
		if (interact_stg == 0)
		{
			interact_meow_idx = irandom_range(0, 4);
			var i = irandom_range(1, 100);
			if (i <= 5)
				interact_meow_idx = irandom_range(5, 6);
		}
		fn_interact_seq();
	}
}


