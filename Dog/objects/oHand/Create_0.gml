/// @description Insert description here
// You can write your code in this editor

TurnRate = 3; //Speed for turning cup when grabbed
IceSpawnRate = 0.25;

/////////////////////////////////////////////////////////////////////////////

var YPos = 0;
var Inst = self;
Joint = noone;

bGrabbed = false;

/** Spawn arm joints and attach to eachother to create one 'rope' */
for(var i=0;i<3;i++)
{
	YPos = (i+1)*128;
	var NextInst = oMiniGame.CreateInstance(x,y+YPos, oArm, "Instances");
	NextInst.AttachedTo = Inst;
	physics_joint_rope_create(Inst, NextInst, NextInst.x, NextInst.y, NextInst.x, NextInst.y, 2, true);
	Inst = NextInst;
}

/** Attach the last arm to the anchor point */
physics_joint_rope_create(Inst, oAnchorPoint, Inst.x, Inst.y+128, oAnchorPoint.x, oAnchorPoint.y, 2, false);




