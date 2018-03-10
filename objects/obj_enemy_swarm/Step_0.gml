if (change_dir)
{
	dest_dir = point_direction(x, y, obj_player.x, obj_player.y);
	change_dir = false;
	alarm_set(0, 180);
}

direction = lerp(direction, dest_dir, 0.1);
image_angle = direction;