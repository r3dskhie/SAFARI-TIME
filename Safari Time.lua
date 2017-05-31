
							 -- Copyright © 2016 redskhie
						 
dofile "Safari/NatureSwapExceptions.lua"
dofile "config.lua"
dofile "Safari/SafariMaps.lua"
dofile "Safari/MoveExceptions.lua"

	
name = "Safari Time"
author = "redskhie"
description = [[This script will catch your desired Pokemons SAFARI WORLD]]

-- First you need to get the module loaded in your script :
	local PathFinder = require "Pathfinder/MoveToApp"  -- loading the module MoveToApp and getting the functions it sends back in a table: PathFinder.
-- Now to use PathFinder functions you can write PathFinder.functionName().
-- You can require MoveToApp from anywhere above in the hierarchie.
	local map = nil -- we want to only call getMapName() on time per onPathAction() so we use this variable


	local AreaOneList = {"Pinsir", "Kangaskhan", "Scyther"}
	local AreaTwoList = {"Bulbasaur", "Chansey", "Rhyhorn"}
	local AreaThreeList = {"Eevee", "Snorlax", ""}
	local Exclusive = {"Chansey", "Marill", "Pinsir", "Venipede", "Scyther", "Rhyhorn", "Starly"}
	
function onDialogMessage(pokecenter)
    if stringContains(pokecenter, "Would you like me to heal your Pokemon?") then
        pokecenterCounter = pokecenterCounter + 1
        if usingLogs then
            log("Info ~ Times in Pokecenter: " .. pokecenterCounter)
        end
    end
end

function onPathAction()
    
    if not isMounted() and mountSwitch == true and hasItem(mount) and not isSurfing() and isOutside() then
        log("---------------------------")
        log("~~~ Riding on my pet!!! ~~~")
        log("---------------------------")
                return useItem(mount)
    elseif sleepPP() and fswipePP() and isPokemonUsable(1) and isPokemonUsable(synchIndex2) and isPokemonUsable(synchIndex3) and isPokemonUsable(falseswiper) and getPokemonHealthPercent(falseswiper) > fswipeHP and getPokemonHealthPercent(sleeper) > sleeperHP and isPokemonUsable(sleeper) then
    
		if singleCatch then
			if huntMap == "Area 1" then
				AreaOne()
			elseif huntMap == "Area 2" then
				AreaTwo()
			elseif huntMap == "Area 3" then
				AreaThree()
			elseif huntMap == "Exclusive" then
				Exclusive()
			end
		elseif multipleCatch then
			natureSwap()
		end
	else
		useNearestPokecenter(map)
	end

    

end
function onStart()

	startime = os.time()
    	shinyCounter = 0
	pokecenterCounter = 0
    	wildCounter = 0	
	pokeballCounter = 0
	startMoney = getMoney()
	poke1 = 0
	poke2 = 0
	poke3 = 0
	poke = 0
	add1 = 0
	add2 = 0
	add3 = 0
	log("-----------------------------------------------------------")
        log("|---- We are now Commencing the Catch Routine ----|")
        log("-----------------------------------------------------------")
	if multipleCatch then
		log("-------- MULTI-CATCHING STARTED --------")
        	log("-------- Script Information --------")
		log("~~~HUNTED POKEMONS~~~")
		log("-Morning Time: "..toHunt1.."- -Location: Hoenn Safari "..huntMap1.." -")
		log("-Day Time: "..toHunt2.."- -Location: Hoenn Safari "..huntMap2.." -")
		log("-Night Time: "..toHunt3.."- -Location: Hoenn Safari "..huntMap3.." -")
        	log("--------------------------------------")
	elseif singleCatch then
		log("-------- SINGLE-CATCHING STARTED --------")
       		log("-------- Script Information --------")
		log("-We will hunt "..toHunt.." all Day!!!- -Location: Hoenn Safari "..huntMap.." -")
        	log("--------------------------------------")
	end
	

end
function onPause()
    
    	log(" --------------------------------------------")
        log("|--------- CATCH ROUTINE PAUSED ----------|")
        log(" --------------------------------------------")
		log("|--------- Move Remaining Power Points ----------|")
    	log("--------------------------------------")
    	log("False Swipe: " .. tostring(getRemainingPowerPoints(falseswiper,weakmove)))
    	log("Sleep Move: " .. tostring(getRemainingPowerPoints(sleeper,sleepmove)))
    	log("-----------------------------------------------------------")
    	
    	log(" ")
	if multipleCatch then
		log("-------- MULTI-CATCHING Status --------")
        	log(" ")
		log("~~~HUNTED POKEMONS~~~")
		log("- "..toHunt1..": "..poke1)
		log("- "..toHunt2..": "..poke2)
		log("- "..toHunt3..": "..poke3)
        	log("--------------------------------------")
	elseif singleCatch then
		log("-------- SINGLE-CATCHING Status --------")
       		log(" ")
		log("- "..toHunt..": "..poke)
        	log("--------------------------------------")
	end
	
	
		log(" --------------------------------------------")
    	log("Pokeball's used: " .. pokeballCounter)
    	log("-----------------------------------------------------------")
    	log("Shinies Caught: " .. shinyCounter)
		log("Pokemons encountered: " .. wildCounter)
    	log("---------------------------------------------")
		log("Times in Pokecenter: " .. pokecenterCounter)
	if huntandFarm then
		log("Pokedollars earned: "..tostring(getMoney() - startMoney))
	end
	log("---------------------------------------------")
end

function onStop()
    log("-----------------------------------------------------------")
        log("---------------------- Routine Stopped ---------------------")
        log("-----------------------------------------------------------")
    endtime = os.time()
        log(string.format("Bot running time: %.2f", os.difftime(endtime,startime)/3600 ).. " hours")
        log("or")
        log(string.format("Bot running time: %.2f", os.difftime(endtime,startime)/60 ).. " minutes")
        log("-----------------------------------------------------------")
end

