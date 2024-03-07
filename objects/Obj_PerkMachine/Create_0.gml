event_inherited();
// 0 = Jug | 1 = Speed
perkNum = 0;
perkCost = 100;
pickupText = "Press 'E' to drink that shit";

pickupToDo = function() {
	var player = instance_find(Obj_Player, 0);
	for(var i = 0; i < array_length(player.perkList); i++) {
		if (perkNum == i && player.perkList[i] != false && player.points >= perkCost){
			player.perkList[i] = true;
			player.points -= perkCost;
			return;
		}
	}
}