var current_color = draw_getpixel(x, y-17);
var red = colour_get_red(current_color);
var green = colour_get_green(current_color);

//var kack = string(x) + " / " + string(y-32);

color = noone;
if (red > 60)
	color = "red";
else if (green > 30)
	color = "green";
else
	color = "kacknoob";

draw_text(x, y+16, color + " / " + string(current_color));
draw_self();
