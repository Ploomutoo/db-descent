y = lerp(y,yDesired,0.2);

var checkObj = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,oParentBashable,0,false);
with(checkObj) funcHurt(self,false)
	
with(passenger) {
	
	x = other.x;
	y = other.y;
}
