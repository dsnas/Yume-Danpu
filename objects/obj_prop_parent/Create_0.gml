
fn_obj_img( , , , , , image_xscale, image_yscale, image_angle);
fn_obj_depth();


// Render (self-drawing)
render =
{
	act : true,
	
	imgSpd : 0,
	
	x : x,
	y : y,
	xOfs : 0,
	yOfs : 0,
	
	xSc : image_xscale,
	ySc : image_yscale,
	ang : image_angle
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
	
	delay :
	{
		act : false,
		durMin : 0,
		durMax : 0,
		durCurr : 0
	}
}
