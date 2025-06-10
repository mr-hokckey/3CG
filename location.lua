
LocationClass = {}

function LocationClass:new(name, cards, positions, dropZone)
    local location = {}
    local metadata = {__index = LocationClass}
    setmetatable(location, metadata)

    location.id = name
    location.cards = cards

    return location
end
