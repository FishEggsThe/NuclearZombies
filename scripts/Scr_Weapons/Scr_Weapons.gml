function UpdateWeapon(){
	switch (wepA) {
		case 0:
			fire_weapon = funtion() {
				instance_create_layer(x, y, "Instances", Obj_Projectile);
			}
			break;
		case 1:
			fire_weapon = funtion() {
				instance_create_layer(x, y, "Instances", Obj_Projectile) {
					direction = 0;
					speed = 10;
				}
			}
			break;
		case 2:
			break;
	}
}