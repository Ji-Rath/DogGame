
//Set grid values
var CellWidth = 64;
var CellHeight = 64;

var CellCountW = room_width/CellWidth;
var CellCountH = room_height/CellHeight;

//Create the AI grid
global.AIGrid = mp_grid_create(0, 0, CellCountW, CellCountH, CellWidth, CellHeight);

//Avoid tiles that are within the 'Collision' layer
var LayerID = layer_get_id("Collision");
if (LayerID)
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

// Load all object data
var DataMap = GetObjectData();
if (DataMap)
{
	var KeyList = ds_map_keys_to_array(DataMap);
	for (var i=0;i<array_length(KeyList);i++)
	{
		LoadObject(KeyList[i]);
		show_debug_message("Loaded: "+object_get_name(KeyList[i]));
	}
}

layer_script_begin(layer_get_id("GUI"), sequence_transition_begin);
layer_script_end(layer_get_id("GUI"), sequence_transition_end);
