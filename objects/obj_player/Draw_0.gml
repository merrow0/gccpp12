var current_color = draw_getpixel(x, y-17);
var red = colour_get_red(current_color);
var blue = colour_get_blue(current_color);

color = noone;
if (red > 60)
	color = "red";
else if (blue > 30)
	color = "blue";
else
	color = "kacknoob";
	
if (color == "red" && image_index == 1) || (color == "blue" && image_index == 0)
	hp -= 2;

draw_text(x, y+16, color + " / " + string(current_color));
draw_self();
