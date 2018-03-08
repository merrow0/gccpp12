var hspd = gamepad_axis_value(ds_list_find_value(obj_controller.gamepad_queue, 0), gp_axislh) * move_speed;
x += hspd;


var aim_spd = gamepad_axis_value(ds_list_find_value(obj_controller.gamepad_queue, 1), gp_axislh) * aim_speed;

cross.direction -= aim_spd;
cross.direction = clamp(cross.direction, aim_speed, 180 - aim_speed);

var cx = lengthdir_x(100, cross.direction);
var cy = lengthdir_y(100, cross.direction);

x = clamp(x, 50, 590);

cross.x = x + cx;
cross.y = y + cy;




/*
if (place_meeting(x + vx, y, obj_wall))
{
    while (!place_meeting(x + sign(vx), y, obj_wall))
        x += sign(vx);
    vx = 0;
}
x += vx;

if (place_meeting(x, y + vy, obj_wall))
{
    while (!place_meeting(x, y + sign(vy), obj_wall))
        y += sign(vy);
    vy = 0;
}
y += vy;

*/

/*
if (gamepad_button_check(gamepad_id,gp_shoulderrb))
{
	if ((hdir != 0 || vdir != 0) && energy > 0)
	{
		var bullet = instance_create_layer(x, y, "Instances", obj_bullet);
		bullet.image_angle = point_direction(x, y, x + hdir, y + vdir);
		bullet.direction = bullet.image_angle;
		bullet.color = color;
		bullet.x_player = x;
		bullet.y_player = y;
						
		if (!(bullet_count % 10))
			bullet.leuchtspur_visible = true;
		
		energy--;
		bullet_count++;
	}
}
else
{
	bullet_count = 0;
	
	if (energy < 100)
		energy++;
}

if (gamepad_button_check(gamepad_id,gp_shoulderr))
{
	if ((hdir != 0 || vdir != 0) && energy > 99)
	{
		var missile = instance_create_layer(x, y, "Instances", obj_missile);
		missile.color = color;
		missile.direction = point_direction(x, y, x + hdir, y + vdir);
	
		energy -= 100;
	}
}

