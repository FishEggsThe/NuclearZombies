var randomI = irandom(array_length(spawnNodes)-1);
var spawnNode = spawnNodes[randomI];
instance_create_layer(spawnNode.x, spawnNode.y, "Instances", zombies[0]);
zombiesToSpawn--;
alarm[0] = timeToSpawn;