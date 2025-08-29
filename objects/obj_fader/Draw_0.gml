
if (type.fade.act == true && type.fade.iris.act == true && stg < 1)
{
	var _iris = type.fade.iris;
	if (!surface_exists(_iris.surf))
		_iris.surf = surface_create(640, 480);
	surface_set_target(_iris.surf);
	draw_clear_alpha(_iris.col, _iris.alp);
	gpu_set_blendmode(bm_subtract);
	
	fn_draw_circle((_iris.x + _iris.xOfs), (_iris.y + _iris.yOfs), round(_iris.rad), _iris.prec);
	
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	draw_surface_ext(_iris.surf, 0, 0, 1, 1, 0, c_white, 1);
	surface_free(_iris.surf);
}
