var acEval = animcurve_channel_evaluate(aChan, acPos);
acPos += acRate;

image_xscale = lerp(dwFrom,dwTo,acEval)*drawWidth;
image_yscale = clamp(0.5+0.25/image_xscale,0,1.25)

if(acPos>=1) {
	
	if(dwTo = 0.5 && dwFrom = 1.5) disengage();

	
	image_xscale = dwTo;
	
	acPos = 0
	dwFrom = image_xscale;
	dwTo = 0.5;
	acRate = 0.07;
}

#region collision checks
	
	if(hspeed>0) var checkPos = bbox_right
	else var checkPos = bbox_left
		
	if(checkPos>room_width || checkPos<0) {
	
		hspeed = -hspeed;
	
	} else {
	
		var checkTile= tilemap_get_at_pixel(tileMap,checkPos,y-16);
		
		if(checkTile=0) {
			
			checkPos+=hspeed
			var checkObj = collision_rectangle(checkPos,y-4,x,y-24,oParentBashable,0,false);
			//markPoint(checkPos,y-4); markPoint(checkPos,y-24);
			with(checkObj) {
				
				if(object_get_parent(object_index)!=oParentTileObject) event_user(0);
			}
			
		} 
		else {
		
			with(oPlayer) {
				
				crushes = 1;
				breakBlock(checkPos,y-16);
				crushes = 0;
			}
			hspeed = -hspeed;
		}
	}
	

#endregion

y = lerp(y,yDesired,0.2);

with(passenger) {
	
	x = other.x;
	y = other.y;
}
