
event_inherited();

physics_fixture_add_point(Fixture, 170-SpriteXOffset, 217-SpriteYOffset); 
physics_fixture_add_point(Fixture, 334-SpriteXOffset, 217-SpriteYOffset);
physics_fixture_add_point(Fixture, 334-SpriteXOffset, 317-SpriteYOffset);
physics_fixture_add_point(Fixture, 170-SpriteXOffset, 317-SpriteYOffset);
ObjectFixture = physics_fixture_bind(Fixture, self);
physics_fixture_delete(Fixture);