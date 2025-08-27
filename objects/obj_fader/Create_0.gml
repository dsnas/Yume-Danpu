
fn_obj_img( , , , , 0);


fader = // :3
{
	stg : 0, // ID number of the current stage of the movement sequence
	
	
	// Source (data about the transition's origin)
	src :
	{
		rm : -1,
		obj : -1,
	},
	
	
	// Target (data about the transition's target)
	tgt :
	{
		rm : -1,
		
		player_x : 0,
		player_y : 0,
		player_dir : -1
	},
	
	
	// Types
	type :
	{
		// Fade type
		fade :
		{
			act : true,
			col : c_black,
			alp : 0,
			alpSpd : 0.15
		},
		
		
		// Standard/Normal door type
		door_std :
		{
			
		},
		
		
		// Unique/Special door type
		door_uniq :
		{
			
		}
	}
}




// Hello, David. I expect a video call. Do what I want and I'll show you my feet.
