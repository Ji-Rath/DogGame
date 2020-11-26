// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function LoopValue(Current, Difference, Min, Max)
{
	Current += Difference;
	while (Current > Max)
	{
		var Diff = abs(Current - Max);
		Current = Diff;
	}
	while (Current < Min)
	{
		var Diff = abs(Current - Min);
		Current = Max - Diff;
	}
	return Current;
}