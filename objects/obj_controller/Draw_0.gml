var xscale = instance_exists(obj_player) ? obj_player.hp / player_total_hp : 0;
draw_sprite_ext(spr_health, 0, 40, 54, xscale, 1, 0, c_white, 1);
draw_sprite(spr_bar, 0, 140, 54);

var player_points_text = string(player_points);
var len = string_length(player_points_text);
var d = 8 - len;
player_points_text = d * "0" + player_points_text; 

draw_text_ext_transformed(480, 35, player_points_text, 2, 100, 2, 2, 0);

if (main_state == gamestate.gameover)
{
	draw_text(320, 600, "HIGHSCORE: " + string(highscore));
}