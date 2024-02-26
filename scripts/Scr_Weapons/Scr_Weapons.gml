function UpdateWeapon(wepID){
	switch (wepID) {
		case 0:
			wepSprite = Spr_TestPistol;
			fire_weapon = function() {
				AddShake(1); //global.shake_screen(100); why the fuck did this method stop working;
				wepPushback = 10;
				reload = 6;
				with instance_create_layer(x, y, "Instances", Obj_PlayerProjectile) {
					direction = random_range(other.gunAngle-5, other.gunAngle+5);
					speed = 10;
				}
			}
			break;
		case 1:
			wepSprite = Spr_TestShotgun;
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
			break;
	}
}

function GetWeaponSprite(wepID) {
	switch(wepID) {
		case 0: return Spr_TestPistol;
		case 1: return Spr_TestShotgun;
	}
}