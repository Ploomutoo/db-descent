if (event_data[? "event_type"] == "sprite event")// or you can check "sprite event"
{
	if(event_data[? "message"] = "apex")
	{
		var _ix,_iy
		for(_ix = bbox_left; _ix < bbox_right; _ix+=32)
		{
			for(_iy = bbox_top; _iy < bbox_bottom; _iy+=32)
			{
				breakBlock(_ix,_iy,1)
			}
			breakBlock(_ix,bbox_bottom,1)
		}
	}
}