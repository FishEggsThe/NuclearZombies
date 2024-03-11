var randomI = irandom(array_length(spawnNodes)-1);
var spawnX = x;
var spawnY = y;

if array_length(spawnNodes) > 0 {
	var spawnNode = spawnNodes[randomI];
	spawnX = spawnNode.x;
	spawnY = spawnNode.y;
}
instance_create_layer(spawnX, spawnY, "Instances", zombies[0]);
zombiesToSpawn--;
alarm[0] = timeToSpawn;