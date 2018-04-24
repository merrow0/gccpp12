instance_destroy(other);

hp--;

if (hp <= 0)
{
	audio_sound_pitch(snd_enemy_explode, random_range(0.8, 1.2));
	audio_play_sound(snd_enemy_explode, 10, false);
	
	instance_destroy();
	
	if (object_get_name(object_index) == "obj_enemy_warp")
		part_type_colour3(obj_controller.explode_type, c_yellow, c_orange, c_red);
	else if (object_get_name(object_index) == "obj_enemy_swarm")
		part_type_colour3(obj_controller.explode_type, c_purple, c_purple, c_purple);
	
	part_type_colour3(obj_controller.explode_type, c_yellow, c_orange, c_red);
	part_emitter_region(obj_controller.explode_system, obj_controller.explode_emitter, x, x, y, y, ps_shape_ellipse, ps_distr_gaussian);
	part_emitter_burst(obj_controller.explode_system, obj_controller.explode_emitter, obj_controller.explode_type, 100)

	with (instance_create_layer(x, y, "Instances", obj_point_text))
	{
		text = "+10";
		color = c_lime;
		obj_controller.player_points += 10;
	}
	
	if (!irandom(3))
		instance_create_layer(x, y, "Instances", obj_loot);
}