event_inherited();

image_xscale = 1.25;
image_yscale = 1.25;

speed = 1;
direction = point_direction(x, y, obj_player.x, obj_player.y);
dest_dir = direction;

shoot_dir = direction;
shoot_offset = 10;
shoot_dir_offset = 30;
shoot_speed = 10;
max_shoot = 15;
shoot_count = 0;
can_shoot = true;

change_dir = false;
alarm_set(0, 180);