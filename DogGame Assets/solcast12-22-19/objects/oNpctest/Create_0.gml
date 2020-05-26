/// @description Insert description here
// You can write your code in this editor


hsp = 0;
vsp = 0;
move = 0

if (instance_exists(oPlayer))
{
	walksp = oPlayer.walksp;
	grv = oPlayer.grv;
	movefriction = oPlayer.movefriction;
}
count = 0;

state = 1;

idlesprite = sPearl;
startupsprite = sPearlStartup;
runsprite = sPearlRun;
winddownsprite = sPearlWinddown;
knockbacksprite = sPearlKnockback;
knockbackloopsprite = sPearlKnockbackloop;
knockbacklandsprite = sPearlKnockbackland;
getupsprite = sPearlKnockbackgetup;

startupframes = 13-1;
runframes = 20-1;
winddownframes = 45-1;
knockbackframes =8-1;
landframes = 21-1;
getupframes = 24-1;