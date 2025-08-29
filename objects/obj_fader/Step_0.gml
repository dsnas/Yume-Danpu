
if (type.fade.act == true) // Fade type
{
	var _iris = type.fade.iris;
	if (_iris.act == false && stg == -1)
		stg = 0;
	else if (_iris.act == true)
	{
		_iris.siner += 0.1;
		_iris.xOfs += (cos(_iris.siner) / 4);
		_iris.yOfs += (sin(_iris.siner) / 4);
		
		_iris.rad = fn_lerp(_iris.rad, 0, _iris.radSpd);
		_iris.alp = fn_lerp(_iris.alp, 1, _iris.alpSpd);
		if (_iris.rad <= _iris.radTgt && stg == -1)
			stg = 0;
	}
	
	
	// Fades out of the source room
	if (stg == 0)
	{
		type.fade.alp = fn_lerp(type.fade.alp, 1, type.fade.alpSpd);
		if (type.fade.alp >= (1 - type.fade.alpJump))
		{
			stg = 1;
			if (tgt.rm != -1)
				room_goto(tgt.rm);
			type.fade.alp = 1;
			type.fade.wait.dur = type.fade.wait.durTgt;
		}
	}
	
	
	// Fades in to the target room
	else if (stg == 1 && type.fade.wait.dur <= 0)
	{
		type.fade.alp = fn_lerp(type.fade.alp, 0, type.fade.alpSpd);
		if (type.fade.alp <= type.fade.alpJump)
		{
			stg = 2;
			type.fade.alp = 0;
			fn_obj_destroy();
		}
	}
	else if (stg == 1 && type.fade.wait.dur > 0)
	{
		type.fade.wait.dur -= 1;
		
		with (obj_player)
		{
			if (other.tgt.player.x != 0)
			{
				x = other.tgt.player.x;
				myself.x = x;
			}
			if (other.tgt.player.y != 0)
			{
				y = other.tgt.player.y;
				myself.y = y;
			}
			if (other.tgt.player.dir != -1)
				dir_curr = other.tgt.player.dir;
		}
	}
}




// Holy Mighty this is sooooo EXCITING! Might as well end it all, put an end to it. But I'm not doing that.  I    n e v e r    w i l l                                                 . . . ?
