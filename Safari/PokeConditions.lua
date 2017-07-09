
local sleepMoves = {"Sleep Powder", "Hypnosis", "Spore", "Yawn", "Sing"}
if falseswiper == nil then
for pokemonId=1,getTeamSize(),1 do
    for pokemonId=1, getTeamSize(), 1 do
        if hasMove(pokemonId, "False Swipe") then
            falseswiper = pokemonId
        end
    end
end
end
if sleeper == nil then
for pokemonId=1,getTeamSize(),1 do
    for pokemonId=1, getTeamSize(), 1 do
        if hasMove(pokemonId, "Sleep Powder", "Hypnosis", "Spore", "Yawn", "Sing") then
            sleeper = pokemonId
        end
    end
end
end
