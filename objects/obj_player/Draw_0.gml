shield_xscale = choose(0.95, 1, 1.05);
shield_yscale = choose(0.95, 1, 1.05);
shield_alpha = choose(0.9, 1);

draw_sprite_ext(spr_shield, 0, x, y, shield_xscale, shield_yscale, 0, shield_color, shield_alpha);

draw_text(x, y+16, lunz_color);
draw_self();
