
//Check enemies in the room and update their position with the pos on file
with(oEnemyParent)
{
    var EnemyGridString = ds_map_find_value(oAreaStats.SaveState,room_get_name(room)+"Enemy");
    if(EnemyGridString != undefined)
    {
        var EnemyGrid = ds_grid_create(0,0);
        ds_grid_read(EnemyGrid,EnemyGridString);
        for(i=0;i<ds_grid_height(EnemyGrid);i++)
        {
            if (ds_grid_get(EnemyGrid,0,i) == Key)
            {
                x = ds_grid_get(EnemyGrid,1,i);
                y = ds_grid_get(EnemyGrid,2,i);
                Health = ds_grid_get(EnemyGrid,3,i);
                i=ds_grid_height(EnemyGrid);
            }
        }
    }
}
