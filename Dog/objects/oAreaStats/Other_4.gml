
//Check enemies in the room and update their position with the pos on file
with(oEnemyParent)
{
    var GridString = ds_map_find_value(oAreaStats.SaveState,room_get_name(room)+"Enemy");
    if(GridString != undefined)
    {
        var Grid = ds_grid_create(0,0);
        ds_grid_read(Grid,GridString);
        for(i=0;i<ds_grid_height(Grid);i++)
        {
            if (ds_grid_get(Grid,0,i) == Key)
            {
                x = ds_grid_get(Grid,1,i);
                y = ds_grid_get(Grid,2,i);
                Health = ds_grid_get(Grid,3,i);
                i=ds_grid_height(Grid);
            }
        }
    }
}

with(oTriggerParent)
{
    var GridString = ds_map_find_value(oAreaStats.SaveState,room_get_name(room)+"Trigger");
    if(GridString != undefined)
    {
        var Grid = ds_grid_create(0,0);
        ds_grid_read(Grid,GridString);
        for(i=0;i<ds_grid_height(Grid);i++)
        {
            if (ds_grid_get(Grid,0,i) == Key)
            {
                Used = ds_grid_get(Grid,1,i);
            }
        }
    }
}
