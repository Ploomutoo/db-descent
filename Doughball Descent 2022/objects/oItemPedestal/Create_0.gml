depth+=4
if(item=noone) item = pickItem()
contained = instance_create_depth(x,y,depth,item)

cSprite = contained.image_index
cDesc = contained.description

oPause.deactListAdd(contained)
//add it to a list on the pause menu idk

sinCount = 0
playerOn = false
tilemap_set_at_pixel(tileMap,3,x+1,y+1)