x+=velocity*facing
velocity += (10-velocity)/10

image_yscale = 4/velocity

if(x<0) x+=room_width
else if(x>room_width) x-=room_width

if(!onCamera(x)) instance_destroy()