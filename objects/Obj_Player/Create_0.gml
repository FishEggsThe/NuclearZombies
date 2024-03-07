if !instance_exists(Obj_Camera) {instance_create_layer(x, y, "Instances", Obj_Camera);}

moveSpeed = 0;
moveSpeedInc = 1;
moveSpeedMax = 4;
moveDirection = 0;
xSpeed = 0;
ySpeed = 0;
horizontalDirection = 1;
verticalDirection = 1;
inControl = true;

loadout = [0, -1, -1];
loadoutAmmo = [0, 0, 0];
loadoutID = 0;
loadoutSize = 2;
wepSprite = Spr_TestPistol;
pointing = 0;
wepPushback = 0;
reload = 0;
wepPickupRange = 48;
fireBuffer = 0;
fireBufferSet = 10;

maxHP = 8;
hp = maxHP;
die = false;
setInvFrames = 60;
invFrames = 0;

points = 500;

perkList = [0];

fire_weapon = function() {
	//function
}

UpdateWeapon(loadout[false]);
