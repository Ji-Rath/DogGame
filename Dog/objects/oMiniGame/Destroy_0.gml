/// @description Insert description here
// You can write your code in this editor

for(var i=0;i<ds_list_size(Instances);i++)
{
    var Instance = ds_list_find_value(Instances,i);
    if(instance_exists(Instance))
    {
        instance_destroy(Instance);
    }
}
		
if(EndTurn)
{
	with(oBattleManager)
		EndTurn();
}
else
	oBattleManager.DrawGUI = true;