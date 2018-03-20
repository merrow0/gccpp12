image_xscale += scale_value;
image_yscale += scale_value;

if (image_xscale > 1.05 || image_xscale < 0.95)
{
	scale_value *= -1;
}