move_speed = 8;
aim_speed = 1;
bullet_speed = 20;
hp = obj_controller.player_total_hp;

direction = 90;
image_angle = direction;

cross = instance_create_layer(x, y - 100, "Instances", obj_cross);
cross.direction = direction;

sort_order = true;
can_shoot = true;
shoot_offset = 10;

shield_color = c_red;
shield_xscale = 1;
shield_yscale = 1;
shield_alpha = 1;
