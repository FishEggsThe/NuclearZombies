moveSpeed = 0;
moveSpeedInc = 0.8;
moveSpeedMax = 4;
xSpeed = 0;
ySpeed = 0;
horizontalDirection = 1;
verticalDirection = 1;
xDraw = 0;
yDraw = 0;

loadout = [0, 0, -1];
loadoutAmmo = []
loadoutID = 0;
loadoutSize = 2;
wepSprite = Spr_TestPistol;
pointing = 0;
wepPushback = 0;
reload = 0;
wepPickupRange = 48;

maxHP = 8;
hp = maxHP;
die = false;
setInvFrames = 60;
invFrames = 0;

fire_weapon = function() {
	//function
}

UpdateWeapon(loadout[0]);