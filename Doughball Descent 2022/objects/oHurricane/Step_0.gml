var acEval = animcurve_channel_evaluate(aChan, acPos);
acPos += 0.05;

image_xscale = lerp(dwFrom,dwTo,acEval);
image_yscale = clamp(0.5+0.25/image_xscale,0,1.25)

if(acPos>=1) {
	
	if(dwTo = 0.5 && dwFrom = 1.5) {
		
		passenger.mobile = true;
		passenger.sprite_index = sPlayerHitbox;
		passenger.bashActive = 15;
		instance_destroy();	
	}
	
	image_xscale = dwTo;
	
	acPos = 0
	dwFrom = image_xscale;
	dwTo = 0.5;
}

#region collision checks
	
	var checkPos = x+(x-bbox_left)*sign(hspeed);
	
	checkPos+=hspeed
	var checkObj = collision_rectangle(checkPos,y-4,x,y-24,oParentBashable,0,false);
	markPoint(checkPos,y-4); markPoint(checkPos,y-24);
	if(checkObj!=noone) {
		
		if(checkObj.object_index = oHazGravel) {
			show_debug_message("gravel y: "+string(checkObj.y)+"\nself y: "+string(y))
			//only work if the gravel is at your level; ie its y is less than yours
			if(y>checkObj.y) with(checkObj) event_user(0);
		
		} else with(checkObj) event_user(0);
	}
	
	checkPos = x+(x-bbox_left)*sign(hspeed);
	if(checkPos>room_width || checkPos<0) {
	
		hspeed = -hspeed;
	
	} else {
	
		var checkTile= tilemap_get_at_pixel(tileMap,checkPos,y-16);

		if(checkTile!=0){
		
			with(oPlayer) breakBlock(checkPos,other.y-16);
			hspeed = -hspeed;
		}
	}

#endregion

y = lerp(y,yDesired,0.2);

with(passenger) {
	
	x = other.x;
	y = other.y;
}
