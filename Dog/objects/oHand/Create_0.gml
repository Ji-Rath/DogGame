/// @description Insert description here
// You can write your code in this editor

TurnRate = 4; //Speed for turning cup when grabbed
IceRate = 3; //Frequency to spawn ice (Every x water, spawn 1 ice)

/////////////////////////////////////////////////////////////////////////////

var YPos = 0;
var Inst = self;
Joint = noone;

bGrabbed = false;
phy_fixed_rotation = true;

/** Spawn arm joints and attach to eachother to create one 'rope' */
var test = true;
for(var i=0;i<3;i++)
{
	YPos = (i+1)*128;
	var NextInst = oMiniGame.CreateInstance(x,y+YPos, oArm, "Instances");
	NextInst.AttachedTo = Inst;
	physics_joint_rope_create(Inst, NextInst, NextInst.x, NextInst.y, NextInst.x, NextInst.y, 5, test);
	test = false;
	Inst = NextInst;
}

function SpawnContents()
{
	/** make water spawn at the top of the cup */
	var spawnX = phy_position_x+random_range(-10,10) // + lengthdir_x(100, (-phy_rotation+360)+90+random_range(-20,20))
	var spawnY = phy_position_y+random_range(-20,20) // + lengthdir_y(100, (-phy_rotation+360)+90+random_range(-20,20))
	
	//if(alarm[0] == -1)
	//	alarm[0] = IceSpawnRate * 60;
	
	static Spawn = 0;
	if (Spawn == IceRate)
	{
		oMiniGame.CreateInstance(spawnX, spawnY, oIce);
		Spawn = 0;
	}
	Spawn++;
		
	//used to set the way each individual particle or "water" acts alone
	var flags = phy_particle_flag_water | phy_particle_flag_viscous;
	//used to set how the entire group of particles or "water" acts together
	var groupflags =  phy_particle_group_flag_rigid | phy_particle_group_flag_solid;

    //first create the grouping of particles, how they act, where they are created, and how they appear
    physics_particle_group_begin(flags, groupflags, spawnX, spawnY, 0, 0, 0, 0, c_white, 1, 1, 2);
    //since it's a group, we have to add some sort of shape. 
    //usually you would have more than 1 object added, however not for this example.
    physics_particle_group_circle(1);
    //set the collision (since it's a circle that's 16x16 in a 24x24 centered sprite, we set the radius
    //which is half of a circle to 6. Not 8, which is half, because we want them to overlap a bit to
    //create a "blending" effect
    physics_particle_set_radius(12);
    //set how heavy the object it (mass in physics)
    physics_particle_set_density(0.002);
    //set the waters velocity, or how far it will continue to move when 
    //acted upon and not acted upon (collision wise)
    physics_particle_set_damping(0.1);
    //prevent instabilies in the physics, more specifically gravity for each particle or water
    physics_particle_set_gravity_scale(1.5);
    //say "hey this is the end of the group creation"
    physics_particle_group_end();
}

/** Attach the last arm to the anchor point */
physics_joint_rope_create(Inst, oAnchorPoint, Inst.x, Inst.y+128, oAnchorPoint.x, oAnchorPoint.y, 2, false);

phy_position_x = 762;
phy_position_y = 222;

#region //Create cup physics object
function CreateBoxFixture(x1, y1, x2, y2, x3, y3, x4, y4)
{
	var OriginX = sprite_get_xoffset(sprite_index);
	var OriginY = sprite_get_yoffset(sprite_index);

	// Base 
	var fix = physics_fixture_create();   // prepare to make the physics fixture

	physics_fixture_set_polygon_shape(fix);
	physics_fixture_add_point(fix, x1-OriginX, y1-OriginY);
	physics_fixture_add_point(fix, x2-OriginX, y2-OriginY);
	physics_fixture_add_point(fix, x3-OriginX, y3-OriginY);
	physics_fixture_add_point(fix, x4-OriginX, y4-OriginY);

	physics_fixture_set_density(fix, 0);    // then define the physics paramenters

	physics_fixture_bind(fix, id);   // Now bind the fixture to the object
	physics_fixture_delete(fix); // and delete the fixture	
}

//CreateBoxFixture(0, 111, 97, 111, 97, 127, 0, 127);
CreateBoxFixture(80, 0, 112, 0, 112, 128, 80, 128);
CreateBoxFixture(-16, 0, 16, 0, 16, 128, -16, 128);

#endregion

repeat(20)
	SpawnContents();

RestingBox[0] = oMiniGame.CreateInstance(phy_position_x, phy_position_y + 110, oHandRest);
RestingBox[1] = oMiniGame.CreateInstance(phy_position_x, phy_position_y - 75, oHandRest);
RestingBox[2] = oMiniGame.CreateInstance(phy_position_x + 100, phy_position_y, oHandRest);
RestingBox[2].phy_rotation = 90;