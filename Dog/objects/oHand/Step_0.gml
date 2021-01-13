/// @description Insert description here
// You can write your code in this editor

/** Clamp rotation to 0-360 */
if (phy_rotation < 0)
	phy_rotation = 360;
if (phy_rotation > 360)
	phy_rotation = 0;

/** spew out water when facing down */
if(bGrabbed && phy_rotation > 110 && phy_rotation < 250)
{
	/** make water spawn at the top of the cup */
	spawnX = x + lengthdir_x(100, (-phy_rotation+360)+90+random_range(-20,20))
	spawnY = y + lengthdir_y(100, (-phy_rotation+360)+90+random_range(-20,20))
	
	if(alarm[0] == -1)
		alarm[0] = IceSpawnRate * 60;
	
	//used to set the way each individual particle or "water" acts alone
	var flags = phy_particle_flag_water | phy_particle_flag_viscous;
	//used to set how the entire group of particles or "water" acts together
	var groupflags =  phy_particle_group_flag_rigid | phy_particle_group_flag_solid;

    //first create the grouping of particles, how they act, where they are created, and how they appear
    physics_particle_group_begin(flags, groupflags, spawnX, spawnY, 0, 0, 0, 0, c_white, 1, 1, 2);
    //since it's a group, we have to add some sort of shape. 
    //usually you would have more than 1 object added, however not for this example.
    physics_particle_group_circle(3);
    //set the collision (since it's a circle that's 16x16 in a 24x24 centered sprite, we set the radius
    //which is half of a circle to 6. Not 8, which is half, because we want them to overlap a bit to
    //create a "blending" effect
    physics_particle_set_radius(12);
    //set how heavy the object it (mass in physics)
    physics_particle_set_density(0.1);
    //set the waters velocity, or how far it will continue to move when 
    //acted upon and not acted upon (collision wise)
    physics_particle_set_damping(0.5);
    //prevent instabilies in the physics, more specifically gravity for each particle or water
    physics_particle_set_gravity_scale(1);
    //say "hey this is the end of the group creation"
    physics_particle_group_end();
}

if (bGrabbed)
{
	if (input_check(EVerb.Interact))
	{
		phy_rotation += TurnRate;
	}
	if (input_check(EVerb.Sprint))
	{
		phy_rotation -= TurnRate;
	}
}