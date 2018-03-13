part_emitter_region(obj_controller.explode_system, obj_controller.explode_emitter, x, x, y, y, ps_shape_ellipse, ps_distr_gaussian);
part_emitter_burst(obj_controller.explode_system, obj_controller.explode_emitter, obj_controller.explode_type, 100)

with (instance_create_layer(x, y, "Instances", obj_point_text))
{
	text = "+100";
	color = c_lime;
}
