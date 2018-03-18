part_system_clear(cloud_part_system);
//part_type_destroy(cloud_type);

part_system_clear(explode_system);
part_system_clear(shot_system);

gamepad_set_vibration(ds_list_find_value(gamepad_queue, 0), 0, 0);
gamepad_set_vibration(ds_list_find_value(gamepad_queue, 1), 0, 0);

audio_stop_all();