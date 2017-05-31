function AreaOne()
	if getMapName() == "Safari Area 1" then
		moveToGrass()
	else
		map = getMapName()
		PathFinder.moveTo(map, "Safari Area 1")
	end
end

function AreaTwo()
	if getMapName() == "Safari Area 2" then
		moveToGrass()
	else
		map = getMapName()
		PathFinder.moveTo(map, "Safari Area 2")
	end
end

function AreaThree()
	if getMapName() == "Safari Area 3" then
		moveToGrass()
	else
		map = getMapName()
		PathFinder.moveTo(map, "Safari Area 3")
	end
end

function Exclusive()
	if getMapName() == "Safari Exclusive" then
		moveToGrass()
	else
		map = getMapName()
		PathFinder.moveTo(map, "Safari Exclusive")
	end
end
