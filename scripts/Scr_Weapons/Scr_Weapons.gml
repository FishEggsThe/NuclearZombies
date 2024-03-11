function GetWeaponInfo(wepID){
	var player = Obj_Player;
	//player.fire_weapon = GetFireWeapon(wepID);
}

function UpdateWeapon(wepID){
	wepSprite = GetWeaponSprite(wepID);
	switch (wepID) {
		case 0:
			auto = false;
			fire_weapon = function() {
				AddShake(1); //global.shake_screen(100); why the fuck did this method stop working;
				wepPushback = 10;
				reload = 14;
				with instance_create_layer(x, y, "Instances", Obj_PlayerProjectile) {
					direction = random_range(other.gunAngle-5, other.gunAngle+5);
					speed = 10;
				}
			}
			break;
		case 1:
			auto = false;
			fire_weapon = function() {
				AddShake(5);
				wepPushback = 10;
				reload += 30;
				repeat(5) {
					with instance_create_layer(x, y, "Instances", Obj_PlayerProjectile) {
						direction = random_range(other.gunAngle-15, other.gunAngle+15);
						speed = random_range(8, 12);
					}
				}
			}
			break;
		case 2:
			auto = true;
			fire_weapon = function() {
				AddShake(1); //global.shake_screen(100); why the fuck did this method stop working;
				wepPushback = 10;
				reload = 11;
				with instance_create_layer(x, y, "Instances", Obj_PlayerProjectile) {
					direction = random_range(other.gunAngle-3, other.gunAngle+3);
					speed = 10;
				}
			}
			break;
	}
}

function GetWeaponSprite(wepID) {
	switch(wepID) {
		case 0: return Spr_TestPistol;
		case 1: return Spr_TestShotgun;
		case 2: return Spr_TestShotgun;
	}
}