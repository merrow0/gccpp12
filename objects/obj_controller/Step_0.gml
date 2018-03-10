enemy_count = instance_number(obj_enemy);

if (!irandom(100))
	spawn_enemy(enemy_total - enemy_count);

if (!irandom(100) && enemy_count < enemy_total)
	instance_create_layer(irandom_range(60, 600), 30, "Instances", obj_enemy_swarm);
	