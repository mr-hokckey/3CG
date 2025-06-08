
CardTypeClass = {}

function CardTypeClass:new()
    local cardType = {}
    local metadata = {__index = CardTypeClass}
    setmetatable(cardType, metadata)

    return cardType
end

return CardTypeClass
