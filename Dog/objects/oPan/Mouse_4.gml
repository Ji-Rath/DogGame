
event_inherited();
physics_fixture_add_point(Fixture, 7-SpriteXOffset, 47-SpriteYOffset); 
physics_fixture_add_point(Fixture, 94-SpriteXOffset, 47-SpriteYOffset);
physics_fixture_add_point(Fixture, 94-SpriteXOffset, 80-SpriteYOffset);
physics_fixture_add_point(Fixture, 7-SpriteXOffset, 80-SpriteYOffset);
ObjectFixture = physics_fixture_bind(Fixture, self);
physics_fixture_delete(Fixture);