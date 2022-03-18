if(instance_exists(oPlayer)) {
	lookAt = oPlayer;
	x = lookAt.x
	y = lookAt.y
} else lookAt = noone;

camera = camera_create();
view_camera[0] = camera;

camWidth = 360;
camHeight = viewHeight;

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
var pm = matrix_build_projection_ortho(camWidth,camHeight,1,3200);

camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera,pm);

camFocus = false;

screenShake = 0;

bgSprite = sBgRocks

bgX = sprite_get_width(bgSprite)
bgY = sprite_get_height(bgSprite)

bgTilesX = 1+ceil(viewWidth/bgX)
bgTilesY = 1+ceil(viewHeight/bgY)

bgShift = 0
bgyOffset = 0