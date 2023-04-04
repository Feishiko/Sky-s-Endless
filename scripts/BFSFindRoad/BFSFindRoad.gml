/*
This is a function that using BFS to find your way by a 2d grid.
_grid is a 2d array
_selfX is your gridX
_selfY is your gridY
_positionX is your targetX
_positionY is your targetY
_4dir if true, that is a 4 direction, if false that is a 8 direction
-1 is empty in the array
0 is a wall/solid in the array

to use this function, you need to change _selfX and _selfY to a real value in your object
*/
function BFSFindRoad(_grid, _gridMaxX, _gridMaxY, _selfX, _selfY, _positionX, _positionY, _4dir) {
	var mapQueueX = ds_queue_create();
	var mapQueueY = ds_queue_create();
	var selfX, selfY, positionX, positionY;
	selfX = _selfX;
	selfY = _selfY;
	positionX = _positionX;
	positionY = _positionY;
	number = 1;
	if(_4dir) {
		//LOOP
		repeat(2000) {
			//UP
			if(positionY > 0) {
				if(_grid[positionX, positionY - 1] == -1) {
					_grid[positionX, positionY - 1] = number;
					ds_queue_enqueue(mapQueueX, positionX);
					ds_queue_enqueue(mapQueueY, positionY - 1);
				}
			}
			//DOWN
			if(positionY < _gridMaxY) {
				if(_grid[positionX, positionY + 1] == -1) {
					_grid[positionX, positionY + 1] = number;
					ds_queue_enqueue(mapQueueX, positionX);
					ds_queue_enqueue(mapQueueY, positionY + 1);
				}
			}
			//LEFT
			if(positionX > 0) {
				if(_grid[positionX - 1, positionY] == -1) {
					_grid[positionX - 1, positionY] = number;
					ds_queue_enqueue(mapQueueX, positionX - 1);
					ds_queue_enqueue(mapQueueY, positionY);
				}
			}
			//RIGHT
			if(positionX < _gridMaxX) {
				if(_grid[positionX + 1, positionY] == -1) {
					_grid[positionX + 1, positionY] = number;
					ds_queue_enqueue(mapQueueX, positionX + 1);
					ds_queue_enqueue(mapQueueY, positionY);	
				}
			}
			positionX = ds_queue_dequeue(mapQueueX);
			positionY = ds_queue_dequeue(mapQueueY);
			number += 1;
			if(_grid[selfX, selfY] != -1) {
				break;	
			}
		}
		var leftValue, rightValue, upValue, downValue;
		leftValue = 999999;
		rightValue = 999999;
		upValue = 999999;
		downValue = 999999;
		var finalValue = 999999;
		with(oMonster) {
			_grid[gridX, gridY] = -1;	
		}
		//LEFT
		if(selfX > 0) {
			leftValue = _grid[selfX - 1, selfY];
		}
		//RIGHT
		if(selfX < _gridMaxX) {
			rightValue = _grid[selfX + 1, selfY];	
		}
		//UP
		if(selfY > 0) {
			upValue = _grid[selfX, selfY - 1];	
		}
		//DOWN
		if(selfY < _gridMaxY) {
			downValue = _grid[selfX, selfY + 1];	
		}
		if(leftValue == -1 || leftValue == 0) {
			leftValue = 999999;	
		}
		if(rightValue == -1 || rightValue == 0) {
			rightValue = 999999;	
		}
		if(upValue == -1 || upValue == 0) {
			upValue = 999999;	
		}
		if(downValue == -1 || downValue == 0) {
			downValue = 999999;	
		}
		finalValue = min(leftValue, rightValue, upValue, downValue);
		//LEFT
		if(leftValue != 999999) {
			if(finalValue == leftValue) {
				gridX -= 1;
				angle = 180;//Remember delete this line if you wanna reuse
				exit;
			}
		}
		//RIGHT
		if(rightValue != 999999) {
			if(finalValue == rightValue) {
				gridX += 1;
				angle = 0;//Remember delete this line if you wanna reuse
				exit;
			}
		}
		//UP
		if(upValue != 999999) {
			if(finalValue == upValue) {
				gridY -= 1;
				angle = 90;//Remember delete this line if you wanna reuse
				exit;
			}
		}
		//DOWN
		if(downValue != 999999) {
			if(finalValue == downValue) {
				gridY += 1;
				angle = 270;//Remember delete this line if you wanna reuse
				exit;
			}
		}
	}else {
		//8-dir BFS Find Road	
	}
}