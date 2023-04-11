if(other.doubled && !doubled) {
	doubled = true;
	if(itemID == 1 || itemID == 3 || itemID == 5 || itemID == 7) {
		number *= 2;	
	}
}

if(other.explode && !explode) {
	explode = true;	
}

if(other.faster && !faster) {
	faster = true;	
}