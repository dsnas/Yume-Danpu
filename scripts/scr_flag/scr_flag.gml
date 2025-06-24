
//////// Funtions related to flags, variables that save the player's progress through the world



/*
function fn_flag_setup() // Sets up flags
{
	global.flag[0] = -1;
	
	
	fn_flag_add(0, false); 
	fn_flag_add(1, "James Borgon");
	global.flag_amt = array_length(global.flag);
	global.flag_file_name = "flag.ini";
	
	
	if (file_exists(global.flag_file_name) == false)
		fn_flag_file_save();
	else if (file_exists(global.flag_file_name) == true)
		fn_flag_file_load();
}

function fn_flag_add(_idx, _value)
{
	global.flag[_idx] = _value;
}
function fn_flag_mod(_idx, _value)
{
	fn_flag_add(_idx, _value);
	fn_flag_file_save();
}


function fn_flag_file_write(_flag_idx, _flag)
{
	var v = global.GAME_VER[global.GAME_VER_IDX];
	var i = _flag_idx;
	var f = _flag;
	
	
	ini_open(global.flag_file_name);
	if (is_numeric(f) == true)
		ini_write_real(v, i, f);
	else if (is_string(f) == true)
		ini_write_string(v, i, f);
	ini_close();
}
function fn_flag_file_read(_game_ver, _flag_idx)
{
	var v = _game_ver;
	var i = _flag_idx;
	var f = global.flag[i];
	var r;
	
	
	ini_open(global.flag_file_name);
	if (is_numeric(f) == true)
		r = ini_read_real(v, i, 0);
	else if (is_string(f) == true)
		r = ini_read_string(v, i, "Salenis");
	ini_close();
	
	
	return r;
}


function fn_flag_file_save()
{
	ini_open(global.flag_file_name);
	
	for (var i = 0; i < global.flag_amt; i++)
		fn_flag_file_write(i, global.flag[i]);
	
	ini_close();
}
function fn_flag_file_load()
{
	var v = global.GAME_VER[global.GAME_VER_IDX];
	ini_open(global.flag_file_name);
	
	
	
	
	
	ini_open(global.flag_file_name);
	for (var i = 0; i < global.flag_amt; i++)
		fn_flag_file_read(v, i);
	
	
	ini_close();
}
*/











// Checks if the save file is from an older version and updates it to the current format
	/*
	for (var vI = (global.GAME_VER_AMT - 2); vI >= 0; vI--)
	{
		if (ini_section_exists(global.GAME_VER[vI]) == true && ini_section_exists(v) == false)
		{
			for (var fI = 0; fI < global.flag_amt; fI++)
			{
				if (ini_key_exists(global.GAME_VER[vI], fI) == true)
				{
					ini_close();
					if (is_numeric(f) == true)
						ini_write_real(v, i, ini_read_real(global.GAME_VER[vI], fI, 0));
					else if (is_string(f) == true)
						ini_write_string(v, i, ini_read_string(global.GAME_VER[vI], fI, "Salenis"));
					
					continue;
				}
				else
				{
					
				}
			}
			
			break;
		}
		else if (ini_section_exists(global.GAME_VER[vI]) == false)
		{
			if (ini_section_exists(v) == false)
				continue;
			else if (ini_section_exists(v) == true)
			{
				fn_log("!!!!!!! AAAAAAAAAAAAAAAAAAAAA");
				break;
			}
		}
	}
	*/
