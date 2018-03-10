if (state = state.warp)
{
	difference = path_start_point - x;
	
	if (abs(difference) > warp_speed)
	{
		x += sign(difference) * warp_speed;
	}
	else
	{
		x = path_start_point;
		state = state.follow_path;
		path_start(path, 10, path_action_stop, false);
	}
}