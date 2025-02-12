if(dead) exit;
var enemy = other

if(y<enemy.bbox_top+4 && vspeed>=0) 
{
	enemy.funcHurt(self,true)

} else {
	if(iframes>0 || !enemy.isHarmful) exit
	//Ow
	vspeed = -10
	takeDamage()
}
