chainAngle += chainSpeed
if(chainAngle>360) chainAngle-=360
else if(chainAngle< 0) chainAngle+=360
image_angle = chainAngle+90

if(chainAngle<90 || chainAngle>270) chainSpeed = max(chainSpeed-0.1,-10) 
else chainSpeed = min(chainSpeed+0.1,10)

x = anchorX + lengthdir_x(32*chainLength,chainAngle)
y = anchorY + lengthdir_y(32*chainLength,chainAngle)

if(!audio_is_playing(sndAxeSwing) && abs(270-chainAngle)<10) soundDist(sndAxeSwing,32,256)