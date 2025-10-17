event_inherited();

shootStage = 0;
canShoot = false;

shoot = noone;

funcHurt = function _hurt(attacker,isStomp)
{	
	playerKill(self);
	oTally.foesBomped++

	if(shoot != noone && instance_exists(shoot)) instance_destroy(shoot)
	instance_destroy();
}