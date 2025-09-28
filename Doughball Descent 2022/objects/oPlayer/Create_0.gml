instance_create_layer(0,0,layer,oTally);

#region migrated sidebar functionality
uiSpacing = 8;
drawProg=0
altometerHeight = sprite_get_height(sAltometer)-13;
mapHeight = round(room_height/32)
global.colorA = c_red
global.colorB = c_yellow
if (level=undefined) level=0;
loop = 0

#macro calibrateGameHeight room_set_height(rGame,2048+level*512+loop*1024)
calibrateGameHeight;
levelText = ""
#endregion

globalvar cheat;
cheat = false;
fpsNorm = 0;

weight = 100
dWeight = weight;	//displayed weight
lastWeight = 0
var thresh = [0  ,100,200,400,600,800,1200];
var count	  = array_length(thresh)-1;
weightCategories =
{
	threshold : thresh,
	crushes   : [0  ,1,  2,  3,  4,  5	,6   ],
	stageCount : count,
	maxStableWeight : thresh[count], //weight at which weight will decay over time
	spriteNum		: sprite_get_height(sPlayerWalk)/playerSpriteHeight,
	spriteStageInc  : [0,100,200,300,400,600,800,1000,1200],
	//weights at which sprites change, should deffo be on the internal stage increments, extras between
	//there are 9 sprite stages presently starting at 0
	getStage : function(_weight)
	{
		var i = 0;
		repeat(stageCount)
		{	
			if(_weight<threshold[i+1]) return(i);
			i++;
		}
		return(stageCount);
	},
	stage : 1, //current stage
	progToNext: 0, //percent progress to next stage
	dProg : 0, //displayed progress
	getProg : function(_weight,_stage,_dprog) //generally used with progToNext
	{	
		var numerator = _weight - threshold[_stage];
		//ex 150 lbs: 150 (current weight) - 100 (threshold for current stage) -> 50
		
		if(_stage+1>stageCount)
		{
			var out = [0,0];
			return(out);
		}
		
		var denominator = threshold[_stage+1]-threshold[_stage]
		numerator = numerator / denominator;
		//ex 50 lbs to next ->  50 / 100 (threshold for current stage) - 200 (threshold for next stage)
		//					50 / 100 -> 0.5 progress to next stage
		
		_dprog = _dprog+(numerator-_dprog)/10
		//ex 0.0 dprog 0.5 numerator
		// numerator is higher	0.0 + (0.5-0.0)/2  -> 0.25
		// continuation			0.25+(0.5-0.25)/2-> 0.375 approaching as expected
		
		// numerator is lower		1.0  + (0.5-1.0)/2  -> 0.75
		// continuation			0.75+(0.5-0.75)/2-> 0.635 as expected, is the display broken?
		
		if(numerator>=1)
		{
			numerator = 0
			oCamera.screenShake = 10
			instance_create_depth(oPlayer.x,oPlayer.y-48,-1,oWeightUp)
			soundRand(sndWeightUp)
		}
		var out = [numerator,_dprog];
		//ex [0.5, 0.0]
		return(out);
	}
};
if weightCategories.spriteNum != array_length(weightCategories.spriteStageInc) show_error("Sprite num and number of increments should be equal!",0);
// Sanity check ^
weightCategories.stage = weightCategories.getStage(weight);

grounded = 0
//crushMax = floor(weight/100)*crushMultiplier
crushes = 1
counterFallEffect = 4

heartMax = 6
hearts = heartMax
soulHearts = 0

canCombo = false
combo = 0
comboTime = 120

iframes = 0
iflash = 0
iPushFrames = 0

maxSpeed = 3
jumpedTimer=0
apexTime = 5
image_speed = 0

aquatic = false;

bashActive = 0
extraBashFrames = 3;

collisionHeight = 24

walkFrame = 0
items = [];

fallMax = 6
vspeed = fallMax

#macro baseGrav 0.2
grav = baseGrav

function loGrav(newGravity,duration)
{
	//Duration in seconds, please
	grav = newGravity;
	alarm[2] = duration*room_speed;
}

fallReset = 0

tranLevel = -1;
tranRoom = rChoice;
endHeight = -1;

dead = false;
mobile = true;

#region drawing variables
//jiggles
draw_angle = 0;

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
		
	drawSurf = surface_create(64,64)
	dsScalex = 1; dsVelx = 0;
	dsScaley = 1; dsVely = 0;
	
	heartDraw = 0
	
#endregion

#region Transition Event Weighting

// Shop, Event, Rare Event, Temple, Cornucopia, Campfire, Arena, Trans Rights
teWeight = [6,10,3,3,8,4,5,0.1];
roomGrav = -1;

#endregion
show_debug_message("\nConsole Start")