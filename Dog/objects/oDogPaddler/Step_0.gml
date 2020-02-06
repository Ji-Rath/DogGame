/// @description Insert description here
// You can write your code in this editor

if(instance_exists(obj_textbox))
{
	if (sprite_index = hspritewalk) or (sprite_index = hspriterun)
	{
		sprite_index = hsprite;
		
	}
	else if (sprite_index = spriteupwalk) or (sprite_index = spriteuprun)
	{
		sprite_index = spriteup;
		
	}
	else if (sprite_index = spritedownwalk) or (sprite_index = spritedownrun)
	{
		sprite_index = spritedown;
		
	}
	
	exit;	
	
}
if (room = battle)
{
	instance_destroy();
	BattleManager.enemy = attacker;
	BattleManager.actioninput = bind_action;
	
}
if (instance_exists(oFade))
{
	exit;
	
}
if (place_meeting(x,y,oEnemy))
{
	//var enemyplace = instance_place(x,y,oEnemy);
	
	
	
	if (oEnemy.state == estates.aggro) or (oEnemy.state == estates.alert)
	{
		if (battlewarp = noone)
		{
			battlewarp = instance_create_layer(x,y,"effects",oWarp);
			battlewarp.target = battle;
			battlewarp.warpcolor = c_red;
		}
		
	}
	else
	{
		if (battlewarp = noone)
		{
			battlewarp = instance_create_layer(x,y,"effects",oWarp);
			battlewarp.target = battle;
			battlewarp.warpcolor = c_aqua;
		}
		
	}
	
}

key_left = keyboard_check(bind_left);
key_leftreleased = keyboard_check_released(bind_left);

key_right = keyboard_check(bind_right);
key_rightreleased = keyboard_check_released(bind_right);

key_down = keyboard_check(bind_down);
key_downreleased = keyboard_check_released(bind_down);

key_up = keyboard_check(bind_up);
key_upreleased = keyboard_check_released(bind_up);

key_action = keyboard_check_pressed(bind_action);
key_baction = keyboard_check(bind_baction);





if (hsp != 0)
{
	hmoving = true
}
else
{
	hmoving = false
}
if (vsp != 0)
{
	vmoving = true;
}
else
{
	vmoving = false
}

if (hmoving = true)
{
	image_xscale = sign(hsp)*scale;

}




if ((key_leftreleased) or (key_rightreleased)) and (vmove = 0)
{
	sprite_index = hsprite;
	
}
else if (key_upreleased)  and (hmove = 0)
{
	sprite_index = spriteup;
}
else if (key_downreleased) and (hmove = 0)
{
	sprite_index = spritedown;
}
else if (key_baction) and (hmoving = true)
{
	sprite_index = hspriterun;
		
}
else if (hmove != 0)
{
	sprite_index = hspritewalk
		
}
else if (key_baction) and (vmoving = true) and (vmove < 0)
{
	sprite_index = spriteuprun;
}
else if (vmove < 0)
{
	sprite_index = spriteupwalk;
			
}
else if (key_baction) and (vmoving = true)
{
	sprite_index = spritedownrun;
}
else if (vmove > 0)
{
	sprite_index = spritedownwalk;
			
}








if (key_baction)
{
	walksp = 8;
	
}
else
{
	walksp = 3;
	
}



if (state = paddlerstates.normal)
{
	
	hmove = key_right - key_left;
	vmove = key_down-key_up;
	
	hsp = hmove*walksp;
	vsp = vmove*walksp;
	
	movement_collision();
	
	
	
}

radius = 50;


input_interact = keyboard_check_pressed(bind_action);
if (input_interact)
{
	var inst = collision_rectangle(x-radius,y-radius,x+radius,y+radius,npc,false,false);
	
	if (inst!= noone)
	{
		with (inst)
		{
			create_textbox(text,id)
		}
	}
	
	
}