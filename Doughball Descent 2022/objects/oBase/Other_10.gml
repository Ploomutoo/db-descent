/*var popup = instance_create_depth(oPlayer.x,oPlayer.y-32,depth-4,oPopupText)
popup.drawString = nameTag

show_debug_message(string(instance_number(object_index))+" instances")
if(instance_number(object_index)>1) {
	
	with(object_index) if(id!=other.id) {
	
	show_debug_message("self "+string(self)+"\nother "+string(other))
	
	other.stacks++;
	oPlayer.items--;
	instance_destroy();
	
	}
	exit;
}*/

createEffect(x,y,sPaPoof);
