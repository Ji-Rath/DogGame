
event_inherited();

//Remove current fixture properties
physics_remove_fixture(self, ObjectFixture);

//Default values for physics object
Fixture = physics_fixture_create();
physics_fixture_set_density(Fixture, 1);
physics_fixture_set_restitution(Fixture, 0.1);
physics_fixture_set_collision_group(Fixture, 0);
physics_fixture_set_linear_damping(Fixture, 0.5);
physics_fixture_set_angular_damping(Fixture, 0.1);
physics_fixture_set_friction(Fixture,0.5);
physics_fixture_set_polygon_shape(Fixture);
physics_fixture_add_point(Fixture, 7-SpriteXOffset, 47-SpriteYOffset); 
physics_fixture_add_point(Fixture, 94-SpriteXOffset, 47-SpriteYOffset);
physics_fixture_add_point(Fixture, 94-SpriteXOffset, 80-SpriteYOffset);
physics_fixture_add_point(Fixture, 7-SpriteXOffset, 80-SpriteYOffset);
ObjectFixture = physics_fixture_bind(Fixture, self);
physics_fixture_delete(Fixture);

