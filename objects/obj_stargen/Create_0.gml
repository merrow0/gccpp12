for (var yy = 0; yy < room_height; yy++)
{
	if (!irandom(10))
	{
		with (instance_create_layer(irandom_range(1, room_width-1), yy, "Stars", obj_star))
		{
			direction = 270;
			speed = choose(0.5, 1, 1.5);
		}
	}
}