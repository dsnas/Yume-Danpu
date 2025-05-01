
image_speed = 0;
image_index = 0;
image_alpha = 0;

fn_import();



global.dbg = true;

global.dbg_rm = rm_wrld_pikini;
if (global.dbg == true)
	room_goto(global.dbg_rm);

fntTest = false;
fntTest_txt = "the quick brown fox\njumps over the lazy dog\n\noh, brother, this\nguy stinks!\n\nTHE QUICK BROWN FOX\nJUMPS OVER THE LAZY DOG\n\nvocê deveria fazer\nalgo bem excitante!\n\najatagem de gatarajem\n\n1234567890 quilômetros\nde ouro puro";
