sleepMoves = {"Sleep Powder", "Hypnosis", "Spore", "Yawn", "Sing"}
if falseswiper == nil then
for pokemonId=1,getTeamSize(),1 do
    for pokemonId=1, getTeamSize(), 1 do
        if hasMove(pokemonId, "False Swipe") then
            falseswiper = pokemonId
        end
    end
end
end

function checkSleepMoves()
for _,sleepMoves in pairs(sleepMoves) do

if sleeper == nil then
	for sleeppokemonId=1,getTeamSize(),1 do
    for sleeppokemonId=1, getTeamSize(), 1 do
        if hasMove(sleeppokemonId, sleepMoves) then
            sleeper = sleeppokemonId
        end
    end
end
end
end
end


function doSleepMoves()
	checkSleepMoves()
    result = false
    if sleepMoves[1] ~= "" then
    for i = 1, TableLength(sleepMoves), 1 do
        if useMove(sleepMoves[i]) then
            result = true
            break
        end
    end
    end
    return result
end
