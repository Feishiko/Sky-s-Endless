hp = 5;
hpMax = 5;

gridX = x div 8;
gridY = y div 8;

walkDuration = 0;
buildingMode = false;//Build Blindage
buildingStuff = oBlindage;//What to build in building mode
buildingBuff[0] = false;//Doubled
buildingBuff[1] = false;//Explode
buildingBuff[2] = false;//Faster

depth = -100;

spd = 1;
innerTurn = 0;

innerShootTurn = 0;
innerGrenadeTurn = 0;

for(var itemsNumber = 0; itemsNumber < 10; itemsNumber++) {
	items[itemsNumber, 0] = -1;// -1 - Nop 0 - WheatSeed 1 - Wheat 2 - IronSeed 3 - Iron 4 - PowderSeed 5 - Powder
	items[itemsNumber, 1] = 0;//number
	items[itemsNumber, 2] = false;//DOUBLED
	items[itemsNumber, 3] = false;//EXPLODE
	items[itemsNumber, 4] = false;//FASTER
}

deathTimer = 0;

ItemPick(0, 2);
ItemPick(2, 2);
ItemPick(4, 2);