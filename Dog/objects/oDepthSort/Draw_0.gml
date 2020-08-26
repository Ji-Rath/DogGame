
//Get objects being tracked for depth and resize the grid accordingly
var InstCount = instance_number(oDepthBase)
ds_grid_resize(DepthGrid,2,InstCount);
var DGrid = DepthGrid

//Set grid values to the objects id and y position
var InstNumber = 0;
with(oDepthBase)
{
    ds_grid_set(DGrid,0,InstNumber,id);
    ds_grid_set(DGrid,1,InstNumber,y)
    InstNumber ++;
}

//Sort objects based on their y position
ds_grid_sort(DGrid,1,true);

//Draw the objects in the order they are on in the grid
InstNumber = 0;
repeat(InstCount)
{
    var Instance = ds_grid_get(DGrid,0,InstNumber);
    with(Instance)
    {
        event_perform(ev_draw,0);
    }
    InstNumber++;
}