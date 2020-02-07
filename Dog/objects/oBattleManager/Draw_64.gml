/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_black)
//draw_text(0,0,"LEVEL "+ string(global.plevel)+"  HP - "+string(global.phealth)+"  PP - "+string(global.pp))

draw_sprite(DPstat,0,0,0)
var c = textcol;
draw_text_ext_color(DPhpx,DPhpy,global.phealth,text_height,100,c,c,c,c,1)
draw_text_ext_color(DPhpx+1,DPhpy,global.phealth,text_height,100,c,c,c,c,1)

draw_text_ext_color(DPhpx,DPoffy,global.pp,text_height,100,c,c,c,c,1)
draw_text_ext_color(DPhpx+1,DPoffy,global.pp,text_height,100,c,c,c,c,1)


/*
draw_sprite(box,0,0,0)
var c = textcol;
draw_text_color(140,60,string(enemyname) + " has attacked!",c,c,c,c,1)
draw_text_color(140+1,60,string(enemyname) + " has attacked!",c,c,c,c,1)
