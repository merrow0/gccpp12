/// Nebelgenerator
part_type_color1(smoke, choose(c_red, c_green));
part_particles_create(smoke, choose(160), -300, smoketrail, 1);
part_particles_create(smoke, choose(480), -300, smoketrail, 1);

alarm_set(0, 120);
