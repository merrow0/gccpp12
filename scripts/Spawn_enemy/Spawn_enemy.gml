var enemy_count = argument0;

var awake_right = true;

path_start_point = irandom_range(150, 490);
path = choose(enemy_zickzack_path);
			  

for (i = 1; i < enemy_count + 1; i++) 
{
	if (awake_right)
	{
		var enemy = instance_create_layer(660, 128, "Instances", obj_enemy_warp);    
	}
	else
	{
		var enemy = instance_create_layer(-20, 128, "Instances", obj_enemy_warp);
	}
	
	awake_right = !awake_right;

	with(enemy)
	{
		path_start_point = other.path_start_point;
		path = other.path;
		alarm_set(0, other.i * 30);
		state =  state.wait;
	}
}
