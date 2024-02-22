moveSpeed = 0;
moveSpeedInc = 0.8;
moveSpeedMax = 4;
xSpeed = 0;
ySpeed = 0;
horizontalDirection = 1;
verticalDirection = 1;

loadout = [0, 1, -1];
loadoutID = 0;
loadoutSize = 2;
wepSprite = Spr_TestPistol;
pointing = 0;
wepPushback = 0;
reload = 0;

maxHP = 8;
hp = maxHP;
die = false;
setInvFrames = 60;
invFrames = 0;

fire_weapon = function() {
	//function
}

UpdateWeapon(loadout[0]);