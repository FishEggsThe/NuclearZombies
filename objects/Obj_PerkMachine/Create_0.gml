event_inherited();

// 0 = Jug | 1 = Speed
perkNum = 0;
perkCost = 100;
pickupText = "Press '" + interactKey + "' to drink that shit";

pickupToDo = function() {
	var player = instance_find(Obj_Player, 0);
	if (!player.perkList[perkNum] && player.points >= perkCost){
		player.perkList[perkNum] = true;
		player.points -= perkCost;
	}
}