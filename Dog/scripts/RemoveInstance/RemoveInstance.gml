// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information


function RemoveInstance(Type, Key)
{
	var Room = ds_map_find_value(oAreaStats.SaveState,"Room");
	var EnemyGrid = ds_grid_create(0,0);
	ds_grid_read(EnemyGrid, ds_map_find_value(oAreaStats.SaveState,Room+Type));
			
	//Find enemy to delete from the room
	for(i=0;i<ds_grid_height(EnemyGrid);i++)
	{
		if(ds_grid_get(EnemyGrid,0,i) == Key)
		{
			ds_grid_set(EnemyGrid,3,i,0);
			i = ds_grid_height(EnemyGrid);
		}
	}
	ds_map_replace(oAreaStats.SaveState,Room+Type,ds_grid_write(EnemyGrid));
}