var lookX;
var lookY;

if(lookAt!=noone) {
	lookX = lookAt.x
	lookY = lookAt.y+yOffset
	if(camFocus){
		lookX += (mouse_x-lookX)/8;
		lookY += (mouse_y-lookY)/8;
	}
} else {
	lookX = room_width/2
	lookY = room_height/2
}

x = clamp(x+(lookX-x)/6,180,room_width-180)
y += (lookY-y)/6

if(bgShift = 1) {
	bgyOffset -= 0.5
	if (abs(bgyOffset)>bgY/2) bgyOffset+=bgY
}

var finX = round(x)
var finY = round(y)

if(screenShake != 0) {
	
	screenShake = -screenShake * 0.8
	if(abs(screenShake)<0.5) screenShake = 0;
	
	if(oPause.menu[2,1]=0) screenShake = 0;
	else finY += screenShake/5*oPause.menu[2,1]
}

var vm = matrix_build_lookat(finX,finY,-10,finX,finY,0,0,1,0);
camera_set_view_mat(camera,vm)

var pm = matrix_build_projection_ortho(camWidth,camHeight,1,3200);
camera_set_proj_mat(camera,pm);