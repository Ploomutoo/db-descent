depth+=4

oPlayer.x = x
oCamera.x = oPlayer.x

state = 0
dx = 140+oCamera.camWidth/2
dy = 32
dim = 0

tilemap_tileset(tileMap,tsGeneric)
pickEvent();

sprite_index = event.sprite;
drawChance = 100*event.eChance()
if(drawChance>10) drawChance = floor(drawChance)
show_debug_message(event.eName)