// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information

function scrSpawnParticle(XPos, YPos, ParticleFunction, Count, Lifetime)
{
	var ParticleObject = instance_create_layer(XPos, YPos, "Instances", oParticleBase);
	variable_instance_set(ParticleObject, "ParticleCount", Count);
	ParticleObject.Lifetime = Lifetime;
	ParticleObject.ParticleFunction = ParticleFunction;
	ParticleObject.ParticleCount = Count;
}

function scrPartRun() {
	particle1 = part_type_create();
	part_type_sprite(particle1,sEffectSmoke,1,0,0);
	part_type_size(particle1,1,1,0.05,0);
	part_type_scale(particle1,0.10,0.10);
	part_type_color1(particle1,4227200);
	part_type_alpha2(particle1,1,0);
	part_type_speed(particle1,1,2,-0.05,0);
	part_type_direction(particle1,0,359,0,0);
	part_type_orientation(particle1,0,359,1,0,1);
	part_type_blend(particle1,1);
	part_type_life(particle1,30,30);
	
	return particle1;
}