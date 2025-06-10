
LocationClass = {}

function LocationClass:new(id, p1_cards, p2_cards)
    local location = {}
    local metadata = {__index = LocationClass}
    setmetatable(location, metadata)

    location.id = id
    location.p1_cards = p1_cards
    location.p2_cards = p2_cards

    return location
end
