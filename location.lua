
LocationClass = {}

function LocationClass:new(id, p1_cards, p2_cards)
    local location = {}
    local metadata = {__index = LocationClass}
    setmetatable(location, metadata)

    location.id = id
    location.p1_cards = p1_cards
    location.p2_cards = p2_cards

    self.p1_power = 0
    self.p2_power = 0

    return location
end

function LocationClass:update()
    self.p1_power = 0
    self.p2_power = 0

    for _, card in ipairs(self.p1_cards) do
        self.p1_power = self.p1_power + card.power
    end

    for _, card in ipairs(self.p2_cards) do
        self.p2_power = self.p2_power + card.power
    end
end

function LocationClass:draw()
    love.graphics.setFont(mediumFont)

    love.graphics.push()
    love.graphics.translate(LOCATION_NUMBERS[self.id].P1.x, LOCATION_NUMBERS[self.id].P1.y)
    love.graphics.setColor(1, 0.97, 0.86, 1)
    love.graphics.printf(" " .. self.p1_power, 0, -love.graphics.getFont():getHeight()/2, CARD_WIDTH*2, "left")
    love.graphics.pop()

    love.graphics.push()
    love.graphics.translate(LOCATION_NUMBERS[self.id].P2.x, LOCATION_NUMBERS[self.id].P2.y)
    love.graphics.setColor(0, 0, 0, 1)
    love.graphics.printf(self.p2_power .. " ", 0, -love.graphics.getFont():getHeight()/2, CARD_WIDTH*2, "right")
    love.graphics.pop()

    love.graphics.setFont(largeFont)

    love.graphics.push()
    love.graphics.translate(LOCATION_NUMBERS[self.id].DIFF.x, LOCATION_NUMBERS[self.id].DIFF.y)
    
    if self.p1_power > self.p2_power then love.graphics.setColor(1, 0.97, 0.86, 1)
    elseif self.p1_power < self.p2_power then love.graphics.setColor(0, 0, 0, 1)
    elseif self.p1_power == self.p2_power then love.graphics.setColor(0.5, 0, 0, 1) end
    
    love.graphics.printf(math.abs(self.p1_power - self.p2_power), 2, -love.graphics.getFont():getHeight()/2, CARD_WIDTH*2, "center")
    love.graphics.pop()
    
    love.graphics.setFont(smallFont)
end
