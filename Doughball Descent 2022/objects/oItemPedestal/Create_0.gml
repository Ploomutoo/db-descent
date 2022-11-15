depth+=4

if(item=noone) item = pickItem();
item = instance_create_layer(x,y,layer,item)

description = item.description
itemSprite = item.image_index;

var itemInd = item.object_index;
instance_destroy(item);
item = itemInd;

sinCount = 0
playerOn = false