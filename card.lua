
require "vector"

CardClass = {}

CARD_NAMES = { "Wooden Cow", "Pegasus", "Minotaur", "Titan", "Zeus", "Ares", "Medusa", "Cyclops", "Poseidon", "Artemis", "Hera", "Demeter", "Hades", "Heracles", "Dionysus", "Hermes", "Hydra", "Ship of Theseus", "Sword of Damocles", "Midas", "Aphrodite", "Athena", "Apollo", "Hephaestus", "Persephone", "Prometheus", "Pandora", "Icarus", "Iris", "Nyx", "Atlas", "Daedalus", "Helios", "Mnemosyne" }

CARD_STATE = {
    IDLE,
    SELECTED,
    GRABBED
}

CARD_DATA = require("cardData")
CARD_BACK = love.graphics.newQuad()

CARD_WIDTH = 64
CARD_HEIGHT = 96

function CardClass:new(name, owner, location)
    local card = {}
    local metadata = {__index = CardClass}
    setmetatable(card, metadata)

    card.owner = owner
    card.location = location
    card.position = Vector()
    card.isFaceUp = true
    card.state = CARD_STATE.IDLE

    card.type = CARD_DATA[name]
    card.name = name
    card.cost = card.type[cost]
    card.power = card.type[power]
    card.text = card.type[text]
    card.ability = card.type[ability]

    card.sprite = nil
    for i, value in ipairs(CARD_NAMES) do
        if value == name then
            card.sprite = love.graphics.newQuad((i-1) % 7, (i-1)//5, CARD_WIDTH, CARD_HEIGHT)
        end
    end

    return card
end

function CardClass:update()
    
end

function CardClass:draw()
    
end

function CardClass:flip()
    self.isFaceUp = not self.isFaceUp
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
