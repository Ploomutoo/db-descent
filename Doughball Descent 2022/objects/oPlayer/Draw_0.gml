//draw_text(x+32,y,string(x))
if(dead) exit;

surface_set_target(drawSurf)
draw_clear_alpha(c_white,0)

var repX = surface_get_width(drawSurf)/2
var repY = surface_get_height(drawSurf)

if(iframes>0) {
	if(iflash<8)gpu_set_fog(1,c_white,1,0);
	iflash++
	if(iflash>16) iflash = 0
}

var finScale = hFace*girth

#region jiggles

var j_dir = point_direction(belly_x, belly_y, x+drawOffset+belly_xoffset, y+belly_yoffset);
var j_dist = point_distance(belly_x, belly_y, x+drawOffset+belly_xoffset, y+belly_yoffset)
if(j_dist > belly_limit) //enforcing limit
{
	belly_x += lengthdir_x(j_dist-belly_limit, j_dir);
	belly_y += lengthdir_y(j_dist-belly_limit, j_dir);
	//resetting j_dist
	j_dist = point_distance(belly_x, belly_y, x+belly_xoffset, y+belly_yoffset);
}
//adding velocity to jiggle
var j_force = lerp(0, belly_elasticity, j_dist/belly_limit);
belly_hspeed += lengthdir_x(j_force, j_dir);
belly_vspeed += lengthdir_y(j_force, j_dir);
belly_x += belly_hspeed;
belly_y += belly_vspeed;
//damping
belly_hspeed -= belly_hspeed*belly_damping*2;
belly_vspeed -= belly_vspeed*belly_damping;

//draw_circle(belly_x, belly_y, 5, false);
#endregion

if(bashActive<=0) {
	//draw_sprite_part_ext(sPlayerWalk,walkFrame,0,(spritePart+1)*playerSpriteHeight,playerSpriteWidth,playerSpriteHeight,floor(repX-playerSpriteWidth*finScale/2),floor(repY-playerSpriteHeight),finScale,1,c_white,1)
	draw_sprite_ext(sPlayerJiggleBase,spritePart+1,repX,repY-drawOffset,finScale,1,image_angle,c_white,1)
	draw_sprite_ext(sPlayerJiggle,spritePart+1,repX,repY-drawOffset+belly_y-y,finScale,1,image_angle,c_white,1)
	
	if (abs(hspeed)>0.2) {
		walkFrame+=0.06
		if(walkFrame>3) walkFrame-=3
	}
	
} else draw_sprite_part_ext(sPlayerBump,image_index,0,(spritePart+1)*46,50,46,repX-25*finScale,repY-46-drawOffset,finScale,1,c_white,1)

gpu_set_fog(0,c_white,1,0);
surface_reset_target()

if(oPause.menu[4,1]=true) {
	draw_surface_ext(drawSurf,x-repX*dsScalex,y-repY*dsScaley,dsScalex,dsScaley,0,c_white,1)
	
} else {
	draw_surface_ext(drawSurf,x-repX,y-repY,1,1,0,c_white,1)
	
}