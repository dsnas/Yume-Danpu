
csr_x = lerp(csr_x, mouse_x, 0.05);
csr_y = lerp(csr_y, mouse_y, 0.05);
direction = point_direction(x, y, csr_x, csr_y);


if (keyboard_check(vk_space) == true)
	speed += 0.5;

if (abs(speed) == 0)
	friction = 0;
else
	friction = 0.1;
	
