if(harmful){
	
	if(fireball>0){
		y = oPlayer.y+512
		//x = oPlayer.x
		
		fireball--
		if(fireball = 0){
			vspeed = -10;	hspeed = 0
			soundRand(sndDragonDash);
		}
	}
	
	if(y<oPlayer.y-320){
		harmful = false;
		sprite_index = sDragon;
		speed = 0;
		
		fireball = 100
	} else {
		vspeed-=0.3
	}
	exit;	
}

if(tilemap_get_at_pixel(tileMap,x,y)!=0) {
	if(iconAlpha<1) iconAlpha += 0.1
} else {
	if(iconAlpha>0) iconAlpha -= 0.05
}

if(fireball = -1) { //zooming offscreen
	
	if(x<0 || x>room_width) exit;
	
	hspeed = hspeed * 0.8
	image_angle = -2*hspeed
	
	motion_add(90,0.1)
	speed = min(speed,4)
	
	if(y<oPlayer.y-320) {
		harmful = true;
		sprite_index = sDragon3
		
		fireball = 120
		y = oPlayer.y+512
		x = oPlayer.x
		
		vspeed = 0;	hspeed = 0
		image_xscale = 1;	image_yscale = 1
		
		sinCount = 0
	}
	exit;
}

var angDiff = point_direction(x,y,oPlayer.x,oPlayer.y);
angDiff = angle_difference(aimDir,angDiff)

if(angDiff>0) aimDir -= 5
else aimDir += 5

motion_add(aimDir,0.1)
speed = min(speed,4)

image_angle = -2*hspeed

sinCount++
if(sinCount>360) sinCount-=360;

image_xscale = dcos(sinCount)/4 + 0.75
image_yscale = image_xscale

if(fireball>1) {
	
	fireball--

} else if(sprite_index = sDragon2 && fireball = 1 && image_index > 3) {
	
	fireball = 0
	instance_create_depth(x,y-20*image_yscale,depth-1,oDragonball)
	soundRand(sndDragonBreath)
}