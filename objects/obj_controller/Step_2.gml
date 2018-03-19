if (shake_intense > 1)
{
    view_xport[0] += random_range(shake_intense, -shake_intense);
    view_yport[0] += random_range(shake_intense, -shake_intense);
	
	shake_intense *= 0.6;
}
else
{
	view_xport[0] = 0;
    view_yport[0] = 0;
}
