/// @description Calculate wind decrease rate
// You can write your code in this editor

WindCount = clamp(WindCount-WindDecreaseRate, 0, WindNeeded);
alarm[0] = 1*60;