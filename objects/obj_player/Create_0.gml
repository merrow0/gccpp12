move_speed = 4;
aim_speed = 4;

direction = 90;
image_angle = direction;

cross = instance_create_layer(x, y - 100, "Instances", obj_cross);
cross.direction = direction;