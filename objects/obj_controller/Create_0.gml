enum gamestate {
	menu,
	play,
	gameover
}

main_state = gamestate.menu;

randomize();

draw_set_font(fnt_neuro);
draw_set_color(c_white);
draw_set_halign(fa_center);

enemy_total = 15;
enemy_count = 0;

player_total_hp = 100;
player_points = 0;
highscore = 0;

shake_intense = 0;

gamepad_queue = ds_list_create();


for (var i = 0; i < gamepad_get_device_count(); i++)
{
	if (gamepad_is_connected(i))
	{
		ds_list_add(gamepad_queue, i);
		gamepad_set_axis_deadzone(i, 0.5);
	}
}

/* *** DEBUG ***
ds_list_add(gamepad_queue, 0);
ds_list_add(gamepad_queue, 1);
*/

if (ds_list_size(gamepad_queue) != 2)
{
	show_message("Dieses Spiel benötigt 2 Controller, diese bitte anschließen.");
	game_end();
}

// Nebel
cloud_part_system = part_system_create();
//part_system_depth(cloud_part_system, depth-1)

cloud_type = part_type_create();
part_type_shape(cloud_type, pt_shape_cloud);
//part_type_scale(ind, xscale, yscale);
part_type_size(cloud_type, 15, 10, 0, 0);
part_type_speed(cloud_type, 2, 3, 0, 0);
part_type_direction(cloud_type, 270, 270, 0, 0);
part_type_life(cloud_type, 1000, 1000);
//part_type_gravity(cloud_type, 0.21, 270);

// Explosion
explode_system = part_system_create();

explode_type = part_type_create();
part_type_sprite(explode_type, spr_spike, 0, 0, 1);
part_type_size(explode_type, 1, 2, 0, 0);
//part_type_alpha3(explode_type, 1, 1, 0);
part_type_speed(explode_type, 10, 20, -1.2, 0.5);
part_type_size(explode_type, 1, 2, -0.08, 0);
part_type_direction(explode_type, 0, 359, 0, 0);
part_type_orientation(explode_type, 0, 359, 2, 1, 0);
part_type_blend(explode_type, 0);
part_type_life(explode_type, 40, 80);

explode_emitter = part_emitter_create(explode_system);


//Schuss
shot_system = part_system_create();

shot_type = part_type_create();
part_type_shape(shot_type, pt_shape_disk);
part_type_size(shot_type, 0.1, 0.15, -0.005, 0);
part_type_colour1(shot_type, c_white);
part_type_alpha2(shot_type, 0.8, 0.2);
part_type_speed(shot_type, 1, 3, 0, 0);
part_type_direction(shot_type, 85, 95, 0, 0);
part_type_gravity(shot_type, 0.3, 270);
part_type_blend(shot_type, 1);
part_type_life(shot_type, 30, 90);

shot_emitter = part_emitter_create(shot_system);


alarm_set(0, 10);
