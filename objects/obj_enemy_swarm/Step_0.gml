if (change_dir)
{
	dest_dir = point_direction(x, y, obj_player.x, obj_player.y);
	change_dir = false;
	alarm_set(0, 180);
}

direction = lerp(direction, dest_dir, 0.1);
image_angle = direction;

if (shoot_count == 0 && !irandom(100 * instance_count div 2))
{
	shoot_count = max_shoot;
	shoot_from_dir = image_angle - shoot_dir_offset;
	shoot_to_dir = image_angle + shoot_dir_offset;
	shoot_dir = shoot_from_dir;
}
	
if (shoot_count > 0 && can_shoot)
{
	var bullet = instance_create_layer(x, y, "Instances", obj_enemy_bullet);
	bullet.speed = shoot_speed;
	shoot_dir += shoot_offset;
	bullet.direction += shoot_dir;
		
	if (shoot_dir < shoot_from_dir || shoot_dir > shoot_to_dir)
		shoot_offset *= -1;
	
	shoot_count--;
	can_shoot = false;
	alarm_set(1, 2);
}