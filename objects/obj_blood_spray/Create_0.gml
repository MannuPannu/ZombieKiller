FirstParticleSystem = part_system_create();

first_particle = part_type_create();

part_type_scale(first_particle,1,1);

part_type_size(first_particle,3,1,0,0);

part_type_color1(first_particle, c_red);

part_type_speed(first_particle,2,4,0,0);

part_type_direction(first_particle,30,120,0,0);


part_type_gravity(first_particle,0.2,270);

part_type_life(first_particle,15,20);

