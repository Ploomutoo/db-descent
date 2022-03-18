// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function approach(start_val, end_val, increment)
{
	if(start_val < end_val)
	{
		return(min(start_val + increment, end_val));
	}
	else
	{
		return(max(start_val - increment, end_val));
	}
}