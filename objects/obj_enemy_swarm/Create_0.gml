event_inherited();

speed = 1;
direction = point_direction(x, y, obj_player.x, obj_player.y);
dest_dir = direction;

change_dir = false;
alarm_set(0, 180);