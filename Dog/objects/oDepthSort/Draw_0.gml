
var InstCount = instance_number(oDepthParent)
ds_grid_resize(DepthGrid,2,InstCount);
var DGrid = DepthGrid

//GET OBJECT Y POSITION AND ID
var InstNumber = 0;
with(oDepthParent)
{
    ds_grid_set(DGrid,0,InstNumber,id);
    ds_grid_set(DGrid,1,InstNumber,y)
    InstNumber ++;
}

//SORT OBJECTS BY DEPTH
ds_grid_sort(DGrid,1,true);

//DRAW OBJECTS IN ORDER
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