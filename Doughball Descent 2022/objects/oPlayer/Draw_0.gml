//draw_text(x+32,y,string(x))
if(dead) exit;

if(iframes>0) {
	if(iflash<8)gpu_set_fog(1,c_white,1,0);
	iflash++
	if(iflash>16) iflash = 0
}

var finScale = hFace*girth

#region jiggles
var j_dir = point_direction(belly_x, belly_y, x+drawOffset+belly_xoffset, y+belly_yoffset);
var j_dist = point_distance(belly_x, belly_y, x+drawOffset+belly_xoffset, y+belly_yoffset);
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
	//draw_sprite_part_ext(sPlayerWalk,walkFrame,0,(spritePart+1)*playerSpriteHeight,playerSpriteWidth,playerSpriteHeight,floor(x-playerSpriteWidth*finScale/2),floor(y-playerSpriteHeight),finScale,1,c_white,1)
	draw_sprite_ext(sPlayerJiggleBase,spritePart+1,x,y-drawOffset,finScale,1,image_angle,c_white,1)
	draw_sprite_ext(sPlayerJiggle,spritePart+1,x,belly_y-drawOffset,finScale,1,image_angle,c_white,1)
	
	if (abs(hspeed)>0.2) {
		walkFrame+=0.06
		if(walkFrame>3) walkFrame-=3
	}
	
} else draw_sprite_part_ext(sPlayerBump,image_index,0,(spritePart+1)*46,50,46,x-25*finScale,y-46-drawOffset,finScale,1,c_white,1)

gpu_set_fog(0,c_white,1,0);

//draw_text(x,y-48,string(image_angle))
if(!cheat) exit;
//draw_self();
draw_set_color(c_yellow)
//draw_rectangle(bbox_left+1,bbox_top+1,bbox_right-1,bbox_bottom-1,1)
draw_set_color(c_white)