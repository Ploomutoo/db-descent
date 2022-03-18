var bubX = x
if(!faceLeft) bubX-=16
else bubX -=8

var bubble = createEffect(bubX,y-16,sPaBubble)
bubble.hspeed = hspeed+sign(desSpeed)*4
bubble.friction = bubble.speed/30
bubble.image_index+=(x%3)/2