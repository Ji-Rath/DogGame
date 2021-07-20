
//Toggle debugging
if(keyboard_check_pressed(vk_f3))
{
    global.Debug = !global.Debug;
}

if(keyboard_check_pressed(vk_f2))
{
	var RandomIndex = random(1000);
	var Name = "Screenshot_"+string(RandomIndex);
	
	while(file_exists(Name+".png"))
	{
		RandomIndex = random(1000);
		Name = "Screenshot_"+string(RandomIndex);
	}
	screen_save(Name+".png");
}