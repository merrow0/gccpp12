image_xscale += scale_value;
image_yscale += scale_value;

if (image_xscale > 1.1 || image_xscale < 0.9)
{
	scale_value *= -1;
}