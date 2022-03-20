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

function overshoot(in, towards, increment)
{
	if(in < towards)
	{
		return(in + increment);
	}
	else
	{
		return(in - increment);
	}
}