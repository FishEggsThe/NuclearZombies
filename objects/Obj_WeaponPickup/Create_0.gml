event_inherited();
wepID = 1;//irandom_range(0, 1);
image_index = GetWeaponSprite(wepID);
pickupText = "Press E to pickup weapon";
//xShadow = 15;
//yShadow = 5;
//gunRaise = 30;

pickupToDo = function() {
	var player = instance_find(Obj_Player, 0);
	
	
	for(var i = 0; i < player.loadoutSize; i++) {
		if player.loadout[i] == wepID {
			// Ammo shizz
			
			instance_destroy();
			return;
		}
	}
	
	for(var i = 1; i < player.loadoutSize; i++) {
		if player.loadout[i] <= -1 {
			player.loadout[i] = wepID;
			player.loadoutID = i;
			with(player){ UpdateWeapon(loadout[loadoutID]);}
			
			instance_destroy();
			return;
		}
	}
	
	player.loadout[player.loadoutID] = player.pickupID;
	with(player){ UpdateWeapon(loadout[loadoutID]);}
	instance_destroy();
}