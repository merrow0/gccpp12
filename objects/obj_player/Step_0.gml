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


if (gamepad_button_check_pressed(ds_list_find_value(obj_controller.gamepad_queue, 0), gp_shoulderr))
{
	sort_order = !sort_order;
	ds_list_sort(obj_controller.gamepad_queue, sort_order);
}

if (gamepad_button_check(ds_list_find_value(obj_controller.gamepad_queue, 1), gp_face1))
{
	with (instance_create_layer(x, y - 3, "Instances", obj_bullet))
	{
		direction = obj_cross.direction;
		image_angle = direction;
		speed = other.bullet_speed;
	}
}