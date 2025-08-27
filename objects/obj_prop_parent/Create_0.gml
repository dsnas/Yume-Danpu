
fn_obj_img( , , , , , image_xscale, image_yscale, image_angle);
fn_obj_depth();




// Myself
myself =
{
	type : "prop",
	
	imgSpd : 0,
	x : x,
	y : y,
	xOfs : 0,
	yOfs : 0,
	xSc : image_xscale,
	ySc : image_yscale,
	ang : image_angle,
	
	
	draw :
	{
		act : true
	},
	
	
	shake :
	{
		act : true,
		dist : 0,
		durCurr : 0
	}
}




// Solid
solid = true;




// Talk (interaction sequence)
talk =
{
	act : false,
	stg : -1,
	
	dur : 0, // Duration in frames of the interaction sequence
	durCurr : 0,
	
	
	// Types
	type :
	{
		// Bell type (starts playing an audio)
		bell :
		{
			act : false,
			
			aud_asset : [-1],
			aud_style : CONFIG_AUD_STYLE.TALKER,
			aud_idx : -1
		},
		
		
		// Door type (starts a room transition)
		door :
		{
			act : false
		},
		
		
		// Gift type (unlocks an effect, item or a theme)
		gift :
		{
			act : false,
			
			loot_idx : -1,
			loot_arr : -1
		},
		
		
		// Trigger type (starts other objects' interaction sequences)
		trig :
		{
			act : false,
			key : CONFIG_KEY.SLCT,
			dist : 16,
		}
	}
}




// Noise (audio that can only be heard if the player is near the object)
noise =
{
	act : false,
	distMin : (160 * 1.25),
	
	aud :
	{
		asset : -1,
		style : -1,
		loops : true,
		vol : 0,
		id : -1,
	},
	
	wait :
	{
		act : false,
		durMin : 0,
		durMax : 0,
		durCurr : 0
	}
}




fn_prop_evCreate();
