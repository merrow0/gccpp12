randomize();

enemy_wave_delay = 10;


gamepad_queue = ds_list_create();


for (var i = 0; i < gamepad_get_device_count(); i++)
{
	if (gamepad_is_connected(i))
	{
		ds_list_add(gamepad_queue, i);
		gamepad_set_axis_deadzone(i, 0.5);
	}
}

