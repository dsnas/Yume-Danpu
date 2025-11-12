
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
	
	freezeTrig : true,
	
	
	// Types
	type :
	{
		// Bell type (starts playing an audio)
		bell :
		{
			act : false,
			dur : 30,
			dur_curr : 0,
			
			aud_asset : [-1],
			aud_style : CONFIG_AUD_EMTR.PROP,
			aud_idx : -1
		},
		
		
		// Door type (starts a room transition)
		door :
		{
			act : false,
			
			open :
			{	
				imgSpd : 0.5,
				
				snd_asset : -1,
				snd_style : -1
			},
			
			close :
			{
				snd_asset : -1,
				snd_style : -1
			}
		},
		
		
		// Gift type (unlocks an effect, item or a theme)
		gift :
		{
			act : false,
			
			content : [-1],
			content_idx : 0,
		},
	}
}


// Talk trigger (starts other objects' interaction sequences)
talkTrig =
{
	act : false,
	key : CONFIG_KEY.CONFIRM,
	dist : 16
}




// Noise (audio that can only be heard if the player is near the object)
noise =
{
	act : false,
	stg : -1,
	dist : (160 * 1.25),
	
	wait :
	{
		act : false,
		dur_min : 0,
		dur_max : 0,
		dur_curr : 0
	},
	
	aud :
	{
		asset : -1,
		style : -1,
		loops : true,
		vol : 0,
		id : -1,
	},
}




fn_prop_evCreate();
