oSidebarL.imprinted = self;
globalvar cheat;
cheat = false;
fpsNorm = 0;

maxSpeed = 3
weight = 100
lastWeight = 0

grounded = 0
crushMax = floor(weight/100)*crushMultiplier
crushes = 1
counterFallEffect = 4

heartMax = 3
hearts = heartMax
soulHearts = 2

iframes = 0
iflash = 0
iPushFrames = 0

jumpedTimer=0
apexTime = 5
image_speed = 0
bashActive = 0
walkFrame = 0
items = 0

fallMax = 6
vspeed = fallMax

#macro baseGrav 0.2
grav = baseGrav

fallReset = 0

tranLevel = -1;
tranRoom = rChoice;
dead = false;
mobile = true;

#region drawing variables
//jiggles
belly_x = x;
belly_y = y;
belly_xoffset = 0;
belly_yoffset = 0;
belly_hspeed = 0;
belly_vspeed = 0;
belly_elasticity = 0.5;
belly_damping = 0.1;
belly_limit = 4;
#endregion

#region ItemStacks

	hTumActive = 0;	hTumDuration = 0
	evKatsuma = false;
	//evBlompo = 0;
	
#endregion
altarInstantiate()

#region Display
	hFace = 1
	image_xscale = hFace
	girth = 1; //Player Display Scaling
	spritePart = 0
	drawSin = 45
	drawOffset = 0
	
	weightStages = sprite_get_height(sPlayerWalk)/playerSpriteHeight
	//show_debug_message(string(weightStages)+" Weight Stages!")
	
	drawSurf = surface_create(64,64)
	dsScalex = 1; dsVelx = 0;
	dsScaley = 1; dsVely = 0;
	
#endregion

#region Transition Event Weighting

// Shop, Event, Rare Event, Temple
teWeight = [6,8,4,0];

#endregion
show_debug_message("\nConsole Start")