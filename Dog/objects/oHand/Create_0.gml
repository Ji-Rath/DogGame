/// @description Insert description here
// You can write your code in this editor

var YPos = 0;
var Inst = self;
Joint = noone;

for(var i=0;i<3;i++)
{
	YPos = (i+1)*128;
	var NextInst = instance_create_layer(x,y+YPos,"Instances", oArm);
	NextInst.AttachedTo = Inst;
	physics_joint_rope_create(Inst, NextInst, NextInst.x, NextInst.y, NextInst.x, NextInst.y, 2, true);
	Inst = NextInst;
}

physics_joint_rope_create(Inst, oAnchorPoint, Inst.x, Inst.y+128, oAnchorPoint.x, oAnchorPoint.y, 2, false);




