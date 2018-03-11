var xscale = obj_player.hp / player_total_hp;
draw_sprite_ext(spr_health, 0, 220, 54, xscale, 1, 0, c_white, 1);
draw_sprite(spr_bar, 0, 320, 54);