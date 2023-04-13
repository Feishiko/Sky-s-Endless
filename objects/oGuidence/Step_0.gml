//Blindage
if(!guidence[0] && ItemExists(8, 1)) {
	guidence[0] = true;
	guidenceTurn[0] = oGameCont.time + 2;
}

//Bread
if(!guidence[1] && ItemExists(9, 1)) {
	guidence[1] = true;
	guidenceTurn[1] = oGameCont.time + 2;
}

//Plough
if(!guidence[2] && ItemExists(10, 1)) {
	guidence[2] = true;
	guidenceTurn[2] = oGameCont.time + 2;
}

//Grenade
if(!guidence[3] && ItemExists(11, 1)) {
	guidence[3] = true;
	guidenceTurn[3] = oGameCont.time + 2;
}

//Potion
if(!guidence[4]) {
	if(ItemExists(12, 1) || ItemExists(13, 1) || ItemExists(14, 1)) {
		guidence[4] = true;
		guidenceTurn[4] = oGameCont.time + 2;
	}
}