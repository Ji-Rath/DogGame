
draw_self();

if(Counter < CompleteCounter)
{
    draw_sprite(sRopeCover, image_index, mouse_x,mouse_y);
}

if(global.Debug)
{
    physics_draw_debug();
}


