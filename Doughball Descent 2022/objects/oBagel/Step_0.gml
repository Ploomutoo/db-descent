var desX = 2*hDir
if(hDir = 1) desX+=bbox_right
else desX+=bbox_left

if(tsCheckEmpty(desX,y)||desX>room_width||desX<0) { hDir = -hDir; soundDist(sndGummyLand,32,128) }
else x+=hDir*2

sCount+=5
if(sCount>360) sCount-=360

image_angle+=dsin(sCount)