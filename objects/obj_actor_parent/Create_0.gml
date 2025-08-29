
event_inherited();
myself.type = "actor";




// Directions
DIR_LT = 0;
DIR_RT = 1;
DIR_UP = 2;
DIR_DN = 3;

DIR_AXIS_HOR = 0;
DIR_AXIS_VER = 1;

dir[DIR_LT] = // Left
{
	spr : -1,
	key : CONFIG_KEY.LT,
	axis : DIR_AXIS_HOR,
	sign : -1
}

dir[DIR_RT] = // Right
{
	spr : -1,
	key : CONFIG_KEY.RT,
	axis : DIR_AXIS_HOR,
	sign : 1
}

dir[DIR_UP] = // Up
{
	spr : -1,
	key : CONFIG_KEY.UP,
	axis : DIR_AXIS_VER,
	sign : -1
}

dir[DIR_DN] = // Down
{
	spr : -1,
	key : CONFIG_KEY.DN,
	axis : DIR_AXIS_VER,
	sign : 1
}

fn_actor_dir_spr(id, sprite_index);
dir_curr = DIR_DN; // Current direction the actor is facing




// Movement
move =
{
	act : true,
	stg : -1, // ID number of the current stage of the movement sequence
	amt : 0, // Amount of consecutive movement sequences in any direction, mode and type
	
	tgtX : 0,
	tgtY : 0,
	startX : 0,
	startY : 0,
	
	
	// Wait (delays the start of the movement sequence)
	wait :
	{
		act : false,
		durMin : 30,
		durMax : 240,
		durCurr : 0
	},
	
	
	// Modes
	mode :
	{
		manual :
		{
			act : false,
			held : false
		},
			
		auto :
		{
			act : false,
			
			chase_act : false,
			chase_tgt : -1
		}
	},
	
	
	// Types
	type :
	{
		// Walk type
		walk :
		{
			act : false,
			
			dur : 16, // Duration in frames of the walking sequence
			durCurr : 0,
			dist : 16, // Distance in pixels the actor will walk
			precise : false, // Whether movement checks for collisions in distances smaller than {move.type.walk.dist}
			
			
			// Walking animation
			fstep :
			{
				act : false,
				amtCurr : 0,
				
				wait_durCurr : 0,
				
				snd_asset : -1,
				snd_style : -1,
			}
		},
		
		
		// Roll type
		roll :
		{
			act : false,
			
			dist : 0, // Distance in pixels the actor will walk
			distMin : 0.5, // Minimum allowed distance for {move.type.roll.dist}
			distMax : 4, // Maximum allowed distance for {move.type.roll.dist}
			distAccel : 0.1,
			distDecel : 0.1,
			precise : true, // Whether movement checks for collisions in distances smaller than {move.type.roll.dist}
			
			snd_asset : -1,
			snd_style : -1,
			snd_pchMin : 0.5,
			snd_pchMax : 1.5,
			snd_id : -1,
			
			turn :
			{
				shake_act : true,
				shake_dist : 1,
				shake_dur : 8,
				
				snd_asset : -1,
				snd_style : -1,
				snd_pchMin : 0.25,
				snd_pchMax : 0.45,
			},
		
			hit :
			{
				shake_act : true,
				shake_dist : 1,
				shake_dur : 6,
				
				snd_asset : -1,
				snd_style : -1
			}
		}
	},
	
	
	// Chain (stops the actor from moving too far from their original position)
	chain :
	{
		act : false,
		dist : 48
	}
}




fn_actor_evCreate();




// HUA-LATUCA-PAYA!!!! HO-POPAPO-TUYA!!!!!!! AAAAAAAAAAAAAARRRRRRRGHHHHHHH!!!!!!!!!!!
