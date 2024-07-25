function cameraMain() {

if(instance_exists(oPlayer)) {
	lookAt = oPlayer;
	x = lookAt.x
	y = lookAt.y
} else lookAt = noone;

//camera = camera_create();
cam1 = view_camera[0];
cam2 = view_camera[1];

view_visible[1] = true

view_set_camera(0,cam1)
view_set_camera(1,cam2)

#macro dispWidth 640
camWidth = dispWidth;
camHeight = viewHeight;

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
var pm = matrix_build_projection_ortho(camWidth,camHeight,1,3200);

camera_set_view_mat(cam1,vm);
camera_set_proj_mat(cam1,pm);

camera_set_view_mat(cam2,vm);
camera_set_proj_mat(cam2,pm);

camFocus = false;
screenShake = 0;

bgSprite = sBgRocks

bgX = sprite_get_width(bgSprite)
bgY = sprite_get_height(bgSprite)

bgTilesX = 1+ceil(viewWidth/bgX)
bgTilesY = 1+ceil(viewHeight/bgY)

bgShift = 0
bgyOffset = 0

}

function cameraMono() {
	
	if(instance_exists(oPlayer)) {
		lookAt = oPlayer;
		x = lookAt.x
		y = lookAt.y
	} else lookAt = noone;

	//camera = camera_create();
	cam1 = view_camera[0];
	cam2 = view_camera[1];
	
	view_enabled[1] = false;

	camWidth = dispWidth;
	camHeight = viewHeight;

	var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
	var pm = matrix_build_projection_ortho(camWidth,camHeight,1,3200);

	camera_set_view_mat(cam1,vm);
	camera_set_proj_mat(cam1,pm);

	camera_set_view_mat(cam2,vm);
	camera_set_proj_mat(cam2,pm);

	camFocus = false;
	screenShake = 0;

	bgSprite = sBgRocks

	bgX = sprite_get_width(bgSprite)
	bgY = sprite_get_height(bgSprite)

	bgTilesX = 1+ceil(viewWidth/bgX)
	bgTilesY = 1+ceil(viewHeight/bgY)

	bgShift = 0
	bgyOffset = 0
}

cameraMain();