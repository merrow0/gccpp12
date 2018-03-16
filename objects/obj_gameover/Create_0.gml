game_x = 0;
game_y = 480;
over_x = 640;
over_y = 480;
x_offset = 20;

obj_game = instance_create_layer(game_x, game_y, "Instances", obj_gameover_game);
obj_over = instance_create_layer(over_x, over_y, "Instances", obj_gameover_over);