
CardClass = {}

CARD_NAMES = { "Wooden Cow", "Pegasus", "Minotaur", "Titan", "Zeus", "Ares", "Medusa", "Cyclops", "Poseidon", "Artemis", "Hera", "Demeter", "Hades", "Heracles", "Dionysus", "Hermes", "Hydra", "Ship of Theseus", "Sword of Damocles", "Midas", "Aphrodite", "Athena", "Apollo", "Hephaestus", "Persephone", "Prometheus", "Pandora", "Icarus", "Iris", "Nyx", "Atlas", "Daedalus", "Helios", "Mnemosyne" }

CARD_STATE = {
    IDLE,
    SELECTED,
    GRABBED
}

PLAYER_KEYS = {
    [1] = "P1",
    [2] = "P2"
}

CARD_SPRITE_SHEET = love.graphics.newImage("assets/cards.png")

CARD_DATA = require("cardData")
CARD_BACK_QUAD = love.graphics.newQuad(6 * CARD_WIDTH, 4 * CARD_HEIGHT, CARD_WIDTH, CARD_HEIGHT, CARD_SPRITE_SHEET)

function CardClass:new(name, owner, location)
    local card = {}
    local metadata = {__index = CardClass}
    setmetatable(card, metadata)

    card.owner = owner
    card.owner_key = PLAYER_KEYS[owner]
    card.location = location
    card.position = Vector()
    card.isFaceUp = true
    card.state = CARD_STATE.IDLE

    card.type = CARD_DATA[name]
    card.name = name
    card.cost = card.type.cost
    card.power = card.type.power
    card.text = card.type.text
    card.ability = card.type.ability

    card.quad = love.graphics.newQuad((card.type.id % 7 + (card.owner-1)*7) * CARD_WIDTH, math.floor(card.type.id / 5) * CARD_HEIGHT, CARD_WIDTH, CARD_HEIGHT, CARD_SPRITE_SHEET)

    return card
end

function CardClass:update()
    
end

function CardClass:draw()
    love.graphics.push()

    love.graphics.translate(self.position.x, self.position.y)
    
    love.graphics.setColor(1, 1, 1, 1)
    if self.isFaceUp then
        love.graphics.draw(CARD_SPRITE_SHEET, self.quad, 0, 0)
        love.graphics.setColor(0.82, 0.41, 0.12, 1)
        love.graphics.printf(self.cost, 0, 1, CARD_WIDTH / 4, "center", 0)
        love.graphics.printf(self.power, CARD_WIDTH * 3 / 4, 1, CARD_WIDTH / 4, "center", 0)
    else
        love.graphics.draw(CARD_SPRITE_SHEET, CARD_BACK_QUAD, 0, 0)
    end

    love.graphics.pop()
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
