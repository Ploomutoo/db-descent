drawWidth = 1;
acPos = 0;
acRate = 0.05;

dwFrom = 0.5;
dwTo = 1.5;

yDesired = round(y/32)*32

var aCurve = animcurve_get(acHurricane)
aChan = animcurve_get_channel(aCurve,0)

passenger = noone;

function disengage() {
	passenger.mobile = true;
	passenger.sprite_index = sPlayerHitbox;
	passenger.bashActive = 15;
	passenger.crushes = storedCrush;
	instance_destroy();	
}