
fn_obj_img( , , , , 0);
fn_obj_depth( , -14000);


global.dbg_act = true; // Determines if Debug Mode is enabled
global.dbg_actPwd = "hunter2"; // Password the player needs to enter to toggle Debug Mode
global.dbg_actRm = rm_macaco; // Room the game will start at (-1 == noone)

global.dbg_cmd_key = vk_alt; // Modifier key
global.dbg_cmd_rm[0] = rm_dbgwrld;
global.dbg_cmd_rm[1] = rm_macaco;

global.dbg_excessLog = false; // Determines if log messages will show excessively and unnecessarily (NOT recommended AT ALL)
