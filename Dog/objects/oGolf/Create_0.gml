currentpower = 0;
maxpower = 3 * 30;
timer = 3 * 30;
timerTrigger = false;
golfgame = layer_sequence_create("Instances",(room_width/2),(room_height/2),"seqHoleInOne");

layer_sequence_pause(golfgame);
layer_sequence_headpos(golfgame,1);