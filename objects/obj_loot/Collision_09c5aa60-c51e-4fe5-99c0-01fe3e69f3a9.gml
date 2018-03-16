audio_play_sound(snd_loot_collect, 8, false);

instance_destroy();

with (instance_create_layer(x, y, "Instances", obj_point_text))
{
	text = "+100";
	color = c_lime;
	obj_controller.player_points += 100;
}