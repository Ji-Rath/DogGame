
Grabbed = true;

physics_remove_fixture(self, ObjectFixture);

Fixture = physics_fixture_create();
physics_fixture_set_density(Fixture, 0.1);
physics_fixture_set_restitution(Fixture, 0.1);
physics_fixture_set_collision_group(Fixture, 0);
physics_fixture_set_linear_damping(Fixture, 15);
physics_fixture_set_angular_damping(Fixture, 15);
physics_fixture_set_friction(Fixture,0.2);
physics_fixture_set_polygon_shape(Fixture);
