
local PathFinder = require "Pathfinder/MoveToApp"
local map = nil

function AreaOne()
	map = getMapName()
	if map == "Safari Area 1" then
		moveToGrass()
	else
		PathFinder.moveTo(map, "Safari Area 1")
	end
end

function AreaTwo()
	map = getMapName()
	if map == "Safari Area 2" then
		moveToGrass()
	else
		PathFinder.moveTo(map, "Safari Area 2")
	end
end

function AreaThree()
	map = getMapName()
	if map == "Safari Area 3" then
		moveToGrass()
	else
		PathFinder.moveTo(map, "Safari Area 3")
	end
end

function Exclusive()
	map = getMapName()
	if map == "Safari Exclusive" then
		moveToGrass()
	else
		PathFinder.moveTo(map, "Safari Exclusive")
	end
end

function HealPoke()
	map = getMapName()
	PathFinder.useNearestPokecenter(map)
end
