
CardClass = {}

CARD_NAMES = { "Wooden Cow", "Pegasus", "Minotaur", "Titan", "Zeus", "Ares", "Medusa", "Cyclops", "Poseidon", "Artemis", "Hera", "Demeter", "Hades", "Heracles", "Dionysus", "Hermes", "Hydra", "Ship of Theseus", "Sword of Damocles", "Midas", "Aphrodite", "Athena", "Apollo", "Hephaestus", "Persephone", "Prometheus", "Pandora", "Icarus", "Iris", "Nyx", "Atlas", "Daedalus", "Helios", "Mnemosyne" }
CARD_STATE = {
    IDLE,
    SELECTED,
    GRABBED
}

function CardClass:new()
    local card = {}
    local metadata = {__index = CardClass}
    setmetatable(card, metadata)

    return card
end

function CardClass:update()
    
end

function CardClass:draw()
    
end

function CardClass:flip()
    
end

-- return true if the mouse is hovering over this card, false if not.
function CardClass:checkForMouseOver()
    local isMouseOver = 
        love.mouse.getX() > self.position.x and
        love.mouse.getX() < self.position.x + CARD_WIDTH and
        love.mouse.getY() > self.position.y and
        love.mouse.getY() < self.position.y + CARD_HEIGHT
        
    return isMouseOver
end

return CardClass
