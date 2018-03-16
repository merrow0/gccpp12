if (main_state == gamestate.menu)
{
	if (!instance_exists(obj_title))
	{
		audio_play_sound(snd_menu, 10, true);
		instance_create_layer(320, 480, "Instances", obj_title);
	}
	
	if (keyboard_check_pressed(vk_f1))
		main_state = gamestate.play;
}
else if (main_state == gamestate.play)
{
	if (instance_exists(obj_title))
		instance_destroy(obj_title);
		
	if (!instance_exists(obj_player))
	{
		audio_stop_sound(snd_menu);
		
		audio_play_sound(snd_play_blast, 10, false);
		audio_play_sound(snd_play, 10, true);
		
		instance_create_layer(320, 900, "Instances", obj_player);
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
		audio_stop_sound(snd_play);
		audio_play_sound(snd_gameover, 10, true);
		instance_create_layer(320, 480, "Instances", obj_gameover);
	}
	
	if (keyboard_check_pressed(vk_enter))
		room_restart();
}