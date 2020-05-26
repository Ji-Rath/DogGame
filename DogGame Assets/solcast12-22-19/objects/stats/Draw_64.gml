/// @description Insert description here
// You can write your code in this editor
var xoffset = 40;



for ( var i = 0; i<maxphealth; i++) {
	draw_sprite(semptyheart, 0, xstart + (xoffset*i),ystart);
	
}
for ( var i = 0; i<phealth; i++) {
	draw_sprite(sHeart, 0, xstart + (xoffset*i),ystart);
	
}

var xbuttonstart = xstart + 70;
var ybuttonstart = ystart + 55





for ( var i = 0; i<maxbuttontop; i++) {
	draw_sprite(sbuttonempty, 0, xbuttonstart + (xoffset*i),ybuttonstart);
	
}
var xbuttonstart2 = xstart + 45;
for ( var i = 0; i<maxbuttonbottom; i++) {
	draw_sprite(sbuttonempty, 0, xbuttonstart2 + (xoffset*i),ybuttonstart + 45);
	
}




for (var i = 0; i< shovel; i++)
{
	draw_sprite(sbuttonshovel,  0, xbuttonstart + (xoffset*i),ybuttonstart);
	
	
}







phealth = clamp(phealth,0,maxphealth);


heartposx = (xstart+(xoffset*(phealth)))-30;
heartposy = ystart+30;