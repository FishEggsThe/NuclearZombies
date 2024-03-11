if !instance_exists(Obj_WaveManager) { instance_create_layer(0, 0, "Instances", Obj_WaveManager);}

zombiesToSpawnSet = 5;
zombiesToSpawn = zombiesToSpawnSet;

timeToSpawn = 30;
alarm[0] = timeToSpawn;

maxNumOfZombies = 24;
currWave = 0;
prevWave = 0;

zombies = [Obj_Zombie, Obj_AllFour, Obj_Beefcake];
spawnNodes = array_create(instance_number(Obj_SpawnNode), noone);
for(var i = 0; i < array_length(spawnNodes); i++) {
	spawnNodes[i] = instance_find(Obj_SpawnNode, i);
}
