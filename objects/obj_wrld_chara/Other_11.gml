/// @descr coll and int

coll_xPlc[FAC_LEFT]		= (x - move_maxTime);
coll_xPlc[FAC_RIGHT]	= (x + move_maxTime);
coll_xPlc[FAC_UP]		= x;
coll_xPlc[FAC_DOWN]		= x;
	
coll_yPlc[FAC_LEFT]		= y;
coll_yPlc[FAC_RIGHT]	= y;
coll_yPlc[FAC_UP]		= (y - move_maxTime);
coll_yPlc[FAC_DOWN]		= (y + move_maxTime);
	
for (var i = 0; i < 4; i++) // loop through all facings
{
	coll_objPlc[i] = instance_place(coll_xPlc[i], coll_yPlc[i], obj_wrld_coll_parent);
	int_objPlc[i] = instance_place(coll_xPlc[i], coll_yPlc[i], obj_wrld_int_parent);
}
