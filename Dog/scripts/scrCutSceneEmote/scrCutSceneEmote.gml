
var Object = argument0, Emote = argument1;

var EmoteObject = instance_create_layer(Object.x,Object.y-Object.sprite_yoffset,"Instances",oEmote);
EmoteObject.sprite_index = Emote;

scrCutSceneEnd();