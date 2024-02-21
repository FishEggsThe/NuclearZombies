function UpdateWeapon(wepID){
	switch (wepID) {
		case 0:
			wepSprite = Spr_TestPistol;
			fire_weapon = function() {
				with instance_create_layer(x, y, "Instances", Obj_Projectile) {
					direction = random_range(other.gunAngle-5, other.gunAngle+5);
					speed = 10;
				}
			}
			break;
		case 1:
			wepSprite = Spr_TestShotgun;
			fire_weapon = function() {
				repeat(5) {
					with instance_create_layer(x, y, "Instances", Obj_Projectile) {
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