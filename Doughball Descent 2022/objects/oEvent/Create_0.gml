depth+=4

oPlayer.x = x
oCamera.x = oPlayer.x

state = 0
dx = 140+oCamera.camWidth/2
dy = 32
dim = 0

tilemap_tileset(tileMap,tsGeneric)


switch(0) {
	
	case 0: //Funny Cave
	event = {
		
		eName : "Tight Cave",
		txExposition : "A glimmer in the dark catches your eye. "
		+"The cave passage is narrow\nbut maybe, just maybe?. "
		+"Do you attempt to squeeze in?",
		txAttempt : "You suck in your belly and\nsmoosh yourself into the cave",
		txDecline : "You look yourself up and down. Maybe you would've fit a\nfew floating cheeseburgers ago",
		
		eChance : function(){
			var i = 150/oPlayer.weight
			i = clamp(i,0,1)
			return(i);
		},
		
		txSuccess : "Miraculously your pliable body oozes\nthrough the passage with ease. The item within is yours!",
		success : function(){
			with(other) instance_create_depth(x+80,y,depth,oItemPedestal)
		},
		
		txFailure : "Within moments you have firmly\nwedged yourself in the opening. You are left solely with\ntime to reflect and digest",
		failure : function(){
			with(oPlayer){
				
				weight = max(weight-100,50)
				popUp(x,y-48,"-100 LBS")
			}
		}
		
	} break;
	
}

drawChance = 100*event.eChance()
if(drawChance>10) drawChance = floor(drawChance)
show_debug_message(event.eName)