audio_play_sound(snd_player_explode, 10, false);

instance_destroy(obj_cross);

part_type_colour3(obj_controller.explode_type, c_yellow, c_orange, c_red);
part_emitter_region(obj_controller.explode_system, obj_controller.explode_emitter, x, x, y, y, ps_shape_ellipse, ps_distr_gaussian);
part_emitter_burst(obj_controller.explode_system, obj_controller.explode_emitter, obj_controller.explode_type, 500)


obj_controller.main_state = gamestate.gameover;