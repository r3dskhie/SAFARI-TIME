function onBattleAction()
	checkSleepMoves()
	if isWildBattle() and ((catchShiny and isOpponentShiny()) or (catchUncaught and not isAlreadyCaught())) then
		startBattle()
	elseif isWildBattle() and getOpponentName() == "Beldum" then
            	log("-------- Commencing Sleep Move --------")
		if getActivePokemonNumber() == 1 then
            return sendPokemon(sleeper) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3) or sendAnyPokemon() or run()
        elseif ( getActivePokemonNumber() == sleeper ) and ( getOpponentStatus() ~= "SLEEP" and getOpponentStatus() ~= "PARALIZE" and getOpponentStatus() ~= "POISON" and getOpponentStatus() ~= "BURN" ) then
            return useMove(sleepmove) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3) or sendAnyPokemon() or run()
        elseif getOpponentStatus() == "SLEEP" or getOpponentStatus() == "PARALIZE" or getOpponentStatus() == "POISON" or getOpponentStatus() == "BURN" then
            return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3) or sendAnyPokemon() or run()
        else
            return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3) or sendAnyPokemon() or attack() or run()
        end
	elseif singleCatch and getOpponentName() == toHunt then
		startBattle()
	elseif multipleCatch and (getOpponentName() == toHunt1 or getOpponentName() == toHunt2 or getOpponentName() == toHunt3) then
		startBattle()
	elseif Add and (getOpponentName() == addHunt1 or getOpponentName() == addHunt2 or getOpponentName() == addHunt3) then
		startBattle()
	elseif huntandFarm then
            return attack() or sendAnyPokemon() or run() or sendUsablePokemon()
	elseif (getOpponentName() == "Wobbuffet" ) then
		
		return attack() or sendAnyPokemon()
	else
            return run() or sendUsablePokemon() or attack() or sendAnyPokemon()
        end
	
end

function startBattle()
	if falseswiper == nil and sleeper == nil then
		log("-------- No Falseswiper and No Sleeper --------")
		log("-------- Starting to throw Pokeballs --------")
		return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball")  or sendAnyPokemon() or attack() or run()
	elseif falseswiper != nil and sleeper == nil then
		log("-------- Commencing False Swipe --------")
        if getActivePokemonNumber() == 1 then
            return sendPokemon(falseswiper) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3) or sendAnyPokemon() or run()
        elseif ( getActivePokemonNumber() == falseswiper ) and ( getOpponentHealthPercent() > 10 ) then
            return weakAttack() or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3) or sendAnyPokemon() or run()
        elseif getOpponentHealthPercent() <= 10 then
            return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3)  or sendAnyPokemon() or attack() or run()
		else
            return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3) or sendAnyPokemon() or attack() or run()
        end
	elseif sleeper != nil and falseswiper == nil then
		log("-------- Commencing Sleep Move --------")
		if getActivePokemonNumber() == 1 then
            return sendPokemon(sleeper) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3) or sendAnyPokemon() or run()
        elseif ( getActivePokemonNumber() == sleeper ) and ( getOpponentStatus() ~= "SLEEP" and getOpponentStatus() ~= "PARALIZE" and getOpponentStatus() ~= "POISON" and getOpponentStatus() ~= "BURN" ) then
            return useMove(sleepmove) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3) or sendAnyPokemon() or run()
        elseif getOpponentStatus() == "SLEEP" or getOpponentStatus() == "PARALIZE" or getOpponentStatus() == "POISON" or getOpponentStatus() == "BURN" then
            return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3) or sendAnyPokemon() or run()
        else
            return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3) or sendAnyPokemon() or attack() or run()
        end
	elseif falseswiper != nil and sleeper != nil then
		log("-------- Commencing False Swipe with Sleep Move --------")
		if getActivePokemonNumber() == 1 then
            return sendPokemon(falseswiper) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or run()
        elseif ( getActivePokemonNumber() == falseswiper ) and ( getOpponentHealth() > 1 ) then
            return weakAttack() or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3) or sendAnyPokemon() or run()
        elseif ( getActivePokemonNumber() == sleeper ) and ( getOpponentStatus() ~= "SLEEP" and getOpponentStatus() ~= "PARALIZE" and getOpponentStatus() ~= "POISON" and getOpponentStatus() ~= "BURN" ) and ( getOpponentHealth() == 1 ) then
            return useMove(sleepmove) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or run()
        elseif ( getActivePokemonNumber() == falseswiper ) and ( getOpponentHealth() == 1 ) then
            return sendPokemon(sleeper) or useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendAnyPokemon() or run()
        elseif getOpponentStatus() == "SLEEP" or getOpponentStatus() == "PARALIZE" or getOpponentStatus() == "POISON" or getOpponentStatus() == "BURN" then
            return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3) or sendAnyPokemon() or attack() or run()
        else
                return useItem("Pokeball") or useItem("Great Ball") or useItem("Ultra Ball") or sendPokemon(3) or sendAnyPokemon() or attack() or run()
        end
	end
end
function onBattleMessage(wild)
    
    if stringContains(wild, "A Wild SHINY ") then
        shinyCounter = shinyCounter + 1    
    
    elseif stringContains(wild, "You throw") then
        pokeballCounter = pokeballCounter + 1    
    
    elseif wild == "A Wild [FF9900]"..toHunt.."[-] Attacks!" then
        poke = poke + 1
  
    elseif wild == "A Wild [FF9900]"..toHunt1.."[-] Attacks!" then
        poke1 = poke1 + 1
	
    elseif wild == "A Wild [FF9900]"..toHunt2.."[-] Attacks!" then
        poke2 = poke2 + 1

    elseif wild == "A Wild [FF9900]"..toHunt3.."[-] Attacks!" then
        poke3 = poke3 + 1

    elseif stringContains(wild, "A Wild ") then
            wildCounter = wildCounter + 1
    end
      
end
	
