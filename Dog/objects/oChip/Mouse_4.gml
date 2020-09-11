
global.PlayerHP = clamp(global.PlayerHP+HealthGain, 0, global.PlayerMaxHP);
global.PlayerPP = clamp(global.PlayerPP+PPGain, 0, global.PlayerMaxPP);;
instance_destroy();