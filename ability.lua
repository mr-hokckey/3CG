
local gameManager = require("gameManager")

AbilityClass = {}

function AbilityClass:new()
    local ability = {}
    local metadata = {__index = AbilityClass}
    setmetatable(ability, metadata)
        
    return ability  
end

OnReveal = {}
Ongoing = {}
OnDiscard = {}
OnEndTurn = {}

function AbilityClass:modifyPower(cards, modifier, condition, count)
    for i = 1, count or 1, 1 do
        for _, card in ipairs(cards) do
            if condition then
                card.power = card.power + modifier
            end
        end
    end
end

function AbilityClass:modifyCost(cards, modifier, condition, count) end
function AbilityClass:modifyMana(player, modifier, condition, count) end
function AbilityClass:moveCard(card, dst, condition)
    if condition then
        gameManager:moveCard(card, card.location, dst)    
    end
end
