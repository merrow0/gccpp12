if (main_state == gamestate.menu)
{
	if (!instance_exists(obj_title))
	{
		audio_play_sound(snd_menu, 10, true);
		instance_create_layer(320, 480, "Instances", obj_title);
	}
	
	if (gamepad_button_check_pressed(ds_list_find_value(obj_controller.gamepad_queue, 0), gp_start)
		|| gamepad_button_check_pressed(ds_list_find_value(obj_controller.gamepad_queue, 1), gp_start))
	{
		part_particles_clear(obj_controller.cloud_part_system);
		main_state = gamestate.play;
		
		shake_intense = 15;
	}
}
else if (main_state == gamestate.play)
{
	if (instance_exists(obj_title))
	{
		instance_destroy(obj_title);
	}
		
	if (!instance_exists(obj_player))
	{
		audio_stop_sound(snd_menu);
		
		audio_play_sound(snd_play_blast, 10, false);
		audio_play_sound(snd_play, 10, true);
		
		instance_create_layer(320, 860, "Instances", obj_player);
	}
	
	enemy_count = instance_number(obj_enemy);

	if (!irandom(100))
		spawn_enemy(enemy_total - enemy_count div choose(1, 2));

	//if (!irandom(100) && enemy_count < enemy_total)
	if (!irandom(200))
		instance_create_layer(irandom_range(60, 600), 30, "Instances", obj_enemy_swarm);
}
else if (main_state == gamestate.gameover)
{
	with (obj_enemy)
		instance_destroy();
	
	if (!instance_exists(obj_gameover))
	{
		gamepad_set_vibration(ds_list_find_value(gamepad_queue, 0), 0, 0);
		gamepad_set_vibration(ds_list_find_value(gamepad_queue, 1), 0, 0);
		
		audio_stop_sound(snd_play);
		audio_play_sound(snd_gameover, 10, true);
		instance_create_layer(320, 480, "Instances", obj_gameover);
		
		
		var file = file_text_open_read(working_directory + "highscore");
		
		if (file != -1)
		{
			highscore = file_text_read_real(file);
			file_text_close(file);
		}
		
		highscore = player_points > highscore ? player_points : highscore;
		file = file_text_open_write(working_directory + "highscore");
		file_text_write_real(file, highscore);
		file_text_close(file);
	}
	
	if (gamepad_button_check_pressed(ds_list_find_value(obj_controller.gamepad_queue, 0), gp_start)
		|| gamepad_button_check_pressed(ds_list_find_value(obj_controller.gamepad_queue, 1), gp_start))
		room_restart();
}