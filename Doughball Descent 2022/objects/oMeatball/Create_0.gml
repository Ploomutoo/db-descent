event_inherited();

if(length = 0) length = 3+irandom(5)

direction = aDown
if(spd = 0) spd = 1
speed = 0
countdown = 64
childSeg = noone;

if(length>0) {
	var segment = instance_create_layer(x,y,layer,oMeatballSeg)
	childSeg = segment
	segment.follow = self;
	segment.spd = spd
	segment.sprite_index = sprite_index
	length--
}

while(length>0){
	var segOld = segment
	segment = instance_create_layer(x,y,layer,oMeatballSeg)
	
	segOld.childSeg = segment
	segment.follow = segOld
	segment.spd = spd
	segment.sprite_index = sprite_index
	
	length--
}

lastX = x
lastY = y

turnDir = choose(1,-1)

image_index = 0
image_speed = 0