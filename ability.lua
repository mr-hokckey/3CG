
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

function AbilityClass:powerModifier(cardTable, modifier) end
