// Detect Lunze-color 
var current_color = draw_getpixel(x-5, y-9);
var red = colour_get_red(current_color);
var blue = colour_get_blue(current_color);

if (red > 60)
	lunz_color = "red";
else if (blue > 30)
	lunz_color = "blue";
else
	lunz_color = "kacknoob";
	
if (lunz_color == "red" && shield_color == c_blue) || (lunz_color == "blue" && shield_color == c_red)
	hp -= 2;
	
// Move ship
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

// Change player
if (gamepad_button_check_pressed(ds_list_find_value(obj_controller.gamepad_queue, 0), gp_shoulderr))
{
	sort_order = !sort_order;
	ds_list_sort(obj_controller.gamepad_queue, sort_order);
	shield_color = sort_order ? c_red : c_blue;
	
	gamepad_set_vibration(ds_list_find_value(obj_controller.gamepad_queue, 0), 1, 1);
	alarm_set(1,60);
}

// Player shoot
if (gamepad_button_check(ds_list_find_value(obj_controller.gamepad_queue, 1), gp_face1) & can_shoot)
{
	audio_sound_pitch(snd_player_shot, random_range(0.5, 0.6));
	audio_play_sound(snd_player_shot, 10, false);
	
	shoot_offset *= -1;
	with (instance_create_layer(x + shoot_offset, y - 3, "Instances", obj_bullet))
	{
		direction = obj_cross.direction;
		image_angle = direction;
		speed = other.bullet_speed;
	}
	
	can_shoot = false;
	alarm_set(0, 10);
}

// HP check
if (hp < obj_controller.player_total_hp)
	hp++;
	
if (hp <= obj_controller.player_total_hp div 2)
{
	if (!audio_is_playing(snd_shield_low))
		audio_play_sound(snd_shield_low, 10, false);
}

if (hp <= 0)
	instance_destroy();
	
	


/* *** DEBUG ***
if (keyboard_check(vk_left))
	x -= 5;
else if (keyboard_check(vk_right))
	x += 5;

if (keyboard_check(vk_space)  & can_shoot)
{
	audio_sound_pitch(snd_player_shot, random_range(0.5, 0.6));
	audio_play_sound(snd_player_shot, 10, false);
	
	shoot_offset *= -1;
	with (instance_create_layer(x + shoot_offset, y - 3, "Instances", obj_bullet))
	{
		direction = obj_cross.direction;
		image_angle = direction;
		speed = other.bullet_speed;
	}
	
	can_shoot = false;
	alarm_set(0, 10);
}
*/