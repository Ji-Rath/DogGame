
//Create AIGrid
var CellWidth = 64;
var CellHeight = 64;

var CellCountW = room_width/CellWidth;
var CellCountH = room_height/CellHeight;

global.AIGrid = mp_grid_create(0, 0, CellCountW, CellCountH, CellWidth, CellHeight);

var LayerID = layer_get_id("Collision");
if(LayerID)
{
    var TileID = layer_tilemap_get_id(LayerID);
    for(var i=0;i<tilemap_get_width(TileID);i++)
    {
        for(var j=0;j<tilemap_get_height(TileID);j++)
        {
            if(tilemap_get(TileID, i, j))
            {
                mp_grid_add_cell(global.AIGrid, i, j);
            }
        }
    }
}

//Check enemies in the room and update their position with the pos on file
with(oEnemyParent)
{
    var GridString = ds_map_find_value(oAreaStats.SaveState,room_get_name(room)+"Enemy");
    if(GridString != undefined)
    {
        var Grid = ds_grid_create(0,0);
        ds_grid_read(Grid,GridString);
        for(var i=0;i<ds_grid_height(Grid);i++)
        {
            if (ds_grid_get(Grid,0,i) == Key)
            {
                x = ds_grid_get(Grid,1,i);
                y = ds_grid_get(Grid,2,i);
                Health = ds_grid_get(Grid,3,i);
            }
        }
    }
}

//Check triggers and update the ones that were already used
with(oTriggerParent)
{
    var GridString = ds_map_find_value(oAreaStats.SaveState,room_get_name(room)+"Trigger");
    if(GridString != undefined)
    {
        var Grid = ds_grid_create(0,0);
        ds_grid_read(Grid,GridString);
        for(var i=0;i<ds_grid_height(Grid);i++)
        {
            if (ds_grid_get(Grid,0,i) == Key)
            {
                Used = ds_grid_get(Grid,1,i);
            }
        }
    }
}
//Check NPC's and update the ones that were already used
with(oNPCParent)
{
    var GridString = ds_map_find_value(oAreaStats.SaveState,room_get_name(room)+"Trigger");
    if(GridString != undefined)
    {
        var Grid = ds_grid_create(0,0);
        ds_grid_read(Grid,GridString);
        for(var i=0;i<ds_grid_height(Grid);i++)
        {
            if (ds_grid_get(Grid,0,i) == Key)
            {
                Used = ds_grid_get(Grid,1,i);
            }
        }
    }
}
