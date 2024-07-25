var lookX;
var lookY;

if(view_visible[1]) {
	
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

	//x += (lookX-x)/6
	y += (lookY-y)/6
	x = lookX;

	//var c1leftbounds, c1rightbounds, c2leftbounds, c2rightbounds;
	c1leftbounds = x-camWidth/2
	c1rightbounds= x+camWidth/2

	if(c1leftbounds<0) {
	
		c2leftbounds = room_width+c1leftbounds;
		c2rightbounds = room_width;
	
		c1leftbounds = 0	
	
		//
	
		c2width = c2rightbounds-c2leftbounds;
		c1width = camWidth - c2width;
	
		// place cam 2 on the left
	
		view_set_xport(1,0)
		view_set_wport(1,c2width)
	
		view_set_xport(0,c2width)
		view_set_wport(0,c1width)
	
	} else if(c1rightbounds>room_width) {
	
		c2leftbounds = 0;
		c2rightbounds = c1rightbounds-room_width;
	
		c1rightbounds = room_width;
	
		//
	
		c2width = c2rightbounds-c2leftbounds;
		c1width = camWidth - c2width;
	
		// place cam 1 on the left
	
		view_set_xport(0,0)
		view_set_wport(0,c1width)
	
		view_set_xport(1,c1width)
		view_set_wport(1,c2width)
	
	} else {
	
		view_set_xport(0,0)
		view_set_wport(0,camWidth)
		c1width = camWidth;
	
		view_set_xport(1,camWidth)
		view_set_wport(1,0)
		c2leftbounds = 0;
		c2rightbounds= 0;
		c2width = 0;
	}

	if(bgShift = 1) {
		bgyOffset -= 0.5
		if (abs(bgyOffset)>bgY/2) bgyOffset+=bgY
	}

	var finY = y;
	if(screenShake != 0) {
	
		screenShake = -screenShake * 0.8
		if(abs(screenShake)<0.5) screenShake = 0;
	
		if(oPause.menu[2,1]=0) screenShake = 0;
		else finY += screenShake/5*oPause.menu[2,1]
	}

	var c1centre = c1leftbounds+c1width/2
	var c2centre = c2leftbounds+c2width/2

	camera_set_view_size(cam1, c1width, camHeight)
	camera_set_view_size(cam2, c2width, camHeight)

	var vm = matrix_build_lookat(c1centre,finY,-10,c1centre,finY,0,0,1,0);
	var pm = matrix_build_projection_ortho(c1width,camHeight,1,3200);
	camera_set_view_mat(cam1,vm)
	camera_set_proj_mat(cam1,pm);


	vm = matrix_build_lookat(c2centre,finY,-10,c2centre,finY,0,0,1,0);
	pm = matrix_build_projection_ortho(c2width,camHeight,1,3200);

	camera_set_view_mat(cam2,vm);
	camera_set_proj_mat(cam2,pm);

} else {
	
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
	
	if(room = rChoice) lookX = room_width/2
	//x += (lookX-x)/6
	y += (lookY-y)/6
	x = lookX;
	
	if(bgShift = 1) {
		
		bgyOffset -= 0.5
		if (abs(bgyOffset)>bgY/2) bgyOffset+=bgY
	}

	var finY = y;
	if(screenShake != 0) {
	
		screenShake = -screenShake * 0.8
		if(abs(screenShake)<0.5) screenShake = 0;
	
		if(oPause.menu[2,1]=0) screenShake = 0;
		else finY += screenShake/5*oPause.menu[2,1]
	}
	
	c1width = camWidth
	view_set_xport(0,0)
	view_set_wport(0,c1width)
	camera_set_view_size(cam1, c1width, camHeight)

	var vm = matrix_build_lookat(lookX,finY,-10,lookX,finY,0,0,1,0);
	var pm = matrix_build_projection_ortho(c1width,camHeight,1,3200);
	
	camera_set_view_mat(cam1,vm)
	camera_set_proj_mat(cam1,pm);

}