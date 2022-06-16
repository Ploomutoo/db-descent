//camera = camera_create();
//view_camera[0] = camera;

x = room_width/2
y = room_height/2

/*camWidth = 640;
camHeight = 360;

var vm = matrix_build_lookat(x,y,-10,x,y,0,0,1,0);
var pm = matrix_build_projection_ortho(camWidth,camHeight,1,3200);

camera_set_view_mat(camera,vm);
camera_set_proj_mat(camera,pm);*/

//Beat Get
beatInterval = 60/115
beatNext = floor(17/beatInterval)*beatInterval

// Anim Channel

aCurve = animcurve_get(acJiggle)
aChannel = animcurve_get_channel(aCurve,0)

aPos = 0
aOut = 1
