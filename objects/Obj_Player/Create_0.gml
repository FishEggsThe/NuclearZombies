moveSpeed = 4;
xSpeed = 0;
ySpeed = 0;
horizontalDirection = 1;
verticalDirection = 1;
facing = 1;
currTileMap = layer_tilemap_get_id("Tiles_Wall");

wepA = 0;
wepB = 1;
wepSprite = Spr_TestPistol;
pointing = 0;

fire_weapon = function() {
	//function
}

UpdateWeapon(wepA);