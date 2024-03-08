event_inherited();

perkNum = 0;
perkCost = 2500;
pickupText = "Press 'E' to drink HP Pop (" + string(perkCost) + " points)";

hpIncrease = 4;

pickupToDo = function() {
	var player = instance_find(Obj_Player, 0);
	if (!player.perkList[perkNum] && player.points >= perkCost){
		player.perkList[perkNum] = true;
		player.points -= perkCost;
	
		player.maxHP += hpIncrease;
		player.hp += hpIncrease;
	}
}