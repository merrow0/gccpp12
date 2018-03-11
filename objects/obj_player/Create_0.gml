move_speed = 8;
aim_speed = 4;
bullet_speed = 20;

direction = 90;
image_angle = direction;

cross = instance_create_layer(x, y - 100, "Instances", obj_cross);
cross.direction = direction;

sort_order = true;
can_shoot = true;
shoot_offset = 4;