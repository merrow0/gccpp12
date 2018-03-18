shield_xscale = choose(0.95, 1, 1.05);
shield_yscale = choose(0.95, 1, 1.05);
shield_alpha = choose(0.9, 1);

draw_sprite_ext(spr_shield, 0, x, y, shield_xscale, shield_yscale, 0, shield_color, shield_alpha);

var current_color = draw_getpixel(x-5, y-9);
var red = colour_get_red(current_color);
var blue = colour_get_blue(current_color);

color = noone;
if (red > 60)
	color = "red";
else if (blue > 30)
	color = "blue";
else
	color = "kacknoob";
	
if (color == "red" && shield_color == c_blue) || (color == "blue" && shield_color == c_red)
	hp -= 2;

draw_text(x, y+16, color + " / " + string(current_color));
draw_self();
