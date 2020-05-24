
event_inherited();

//Remove current fixture properties
physics_remove_fixture(self, ObjectFixture);

//Default values for physics object
Fixture = physics_fixture_create();
physics_fixture_set_density(Fixture, 1);
physics_fixture_set_restitution(Fixture, 0.1);
physics_fixture_set_collision_group(Fixture, 0);
physics_fixture_set_linear_damping(Fixture, 0.1);
physics_fixture_set_angular_damping(Fixture, 0.1);
physics_fixture_set_friction(Fixture,1);
physics_fixture_set_polygon_shape(Fixture);
physics_fixture_add_point(Fixture, 170-SpriteXOffset, 217-SpriteYOffset); 
physics_fixture_add_point(Fixture, 334-SpriteXOffset, 217-SpriteYOffset);
physics_fixture_add_point(Fixture, 334-SpriteXOffset, 317-SpriteYOffset);
physics_fixture_add_point(Fixture, 170-SpriteXOffset, 317-SpriteYOffset);
ObjectFixture = physics_fixture_bind(Fixture, self);
physics_fixture_delete(Fixture);