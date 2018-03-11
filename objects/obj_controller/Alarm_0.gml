/// Nebelgenerator

var rx1 = choose(100, 540);
var rx2 = rx1 == 100 ? 540 : 100;

part_type_color1(cloud_part_system, choose(c_red, c_blue));
part_type_orientation(cloud_part_system, 0, 360, 0, 0, false);
part_particles_create(cloud_part_system, rx1, -300, cloud_type, 1);

part_type_color1(cloud_part_system, choose(c_red, c_blue));
part_type_orientation(cloud_part_system, 0, 360, 0, 0, false);
part_particles_create(cloud_part_system, rx2, -300, cloud_type, 1);

alarm_set(0, 120);
