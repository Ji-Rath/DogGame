/// @description End Create Event

var PartEmitter = part_emitter_create(PartSystem);

var HalfSize = Size/2;
part_emitter_region(PartSystem, PartEmitter, XPos-HalfSize, XPos+HalfSize, YPos-HalfSize, YPos+HalfSize, EmitterShape, EmitterDist);
part_emitter_stream(PartSystem, PartEmitter, ParticleFunction, ParticleCount);

alarm[1] = Lifetime*60;