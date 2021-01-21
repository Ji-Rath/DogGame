
event_inherited();

CompleteDelay = 0.2; // Duration (seconds) to succeed minigame after crabs are still and on balance
VelocityThreshold = 25; // Max Crab velocity to be considered settled

////////////////////////////////////////////////////////////////////////
CrabList = ds_list_create();
CrabCount = 0;
Complete = false;
alarm[0] = 30;
Timer[0] = 1.5*60;
StillTimer = false;