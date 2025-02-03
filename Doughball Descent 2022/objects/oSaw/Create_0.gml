event_inherited()
stompable = false

anchorX = x
anchorY = y

if(chainLength = 0) chainLength = 1+irandom(3)
if(chainAngle = 0) chainAngle = irandom(360)

if(chainSpeed = 0) chainSpeed = 6/chainLength

funcHurt = function _hurt(attacker,isStomp)
{	
	//Nothing 
}