depth+=4

oPlayer.x = x
oCamera.x = oPlayer.x

state = 0
dx = 140+oCamera.camWidth/2
dy = 32
dim = 0

tilemap_tileset(tileMap,tsGeneric)

if(isRare) pickEventRare();
else pickEvent();

if(variable_instance_exists(event,"eInit")) event.eInit();

voice = talkEvent;
if(variable_instance_exists(event,"eVoice")) voice = event.eVoice;

sprite_index = event.sprite;
var cOut = event.eChance();
drawText = ""

drawChance = 100*cOut[0];
if(drawChance>10) drawChance = floor(drawChance)

if(array_length(cOut)>1) {
	drawText = cOut[1]
} else drawText = string(cOut[0])+"%";
