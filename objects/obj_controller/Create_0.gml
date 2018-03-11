randomize();

enemy_total = 10;
enemy_count = 0;

player_total_hp = 100;

gamepad_queue = ds_list_create();


for (var i = 0; i < gamepad_get_device_count(); i++)
{
	if (gamepad_is_connected(i))
	{
		ds_list_add(gamepad_queue, i);
		gamepad_set_axis_deadzone(i, 0.5);
	}
}

ds_list_add(gamepad_queue, 0);
ds_list_add(gamepad_queue, 1);


// Nebelgenerator
cloud_part_system = part_system_create()
//part_system_depth(cloud_part_system, depth-1)

cloud_type = part_type_create()
part_type_shape(cloud_type, pt_shape_cloud);
//part_type_scale(ind, xscale, yscale);
part_type_size(cloud_type, 15, 10, 0, 0);
part_type_speed(cloud_type, 2, 3, 0, 0)
part_type_direction(cloud_type, 270, 270, 0, 0);
part_type_life(cloud_type, 1000, 1000)
//part_type_gravity(cloud_type, 0.21, 270);

alarm_set(0, 10);
