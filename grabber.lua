
GrabberClass = {}

local gameManager = require("gameManager")

function GrabberClass:new()
    local grabber = {}
    local metadata = {__index = GrabberClass}
    setmetatable(grabber, metadata)

    grabber.selectedCard = nil
    grabber.grabbedCard = nil
    grabber.grabPos = Vector()
    grabber.grabOffset = Vector()

    return grabber
end

-- call checkForMouseOver on each card on the board, set the last one as selected.
function GrabberClass:update()
    self.selectedCard = nil
    
    for p, playerZones in ipairs(gameManager.cardTables) do
        for l, zone in pairs(playerZones) do
            for _, card in ipairs(zone) do
                card.state = CARD_STATE.IDLE
                if card:checkForMouseOver() then
                    self.selectedCard = card
                end
            end
        end
    end

    if self.selectedCard ~= nil then
        self.selectedCard.state = CARD_STATE.SELECTED
    end

    
    if self.grabbedCard == nil and love.mouse.isDown(1) then
        self:grab()
    end
  
    if not love.mouse.isDown(1) and self.grabbedCard ~= nil then
        self:release()
    end

    if self.grabbedCard ~= nil then
        self.grabbedCard.state = CARD_STATE.GRABBED
        self.grabbedCard.position = Vector(love.mouse.getX(), love.mouse.getY()) - self.grabOffset
    end
end

-- re-draw the grabbed card so it appears on top of all the other cards.
-- also draw the selected card on the left at a bigger scale, along with its description.
function GrabberClass:draw()
    if self.grabbedCard ~= nil then
        self.grabbedCard:draw()
    end

    if self.selectedCard ~= nil then
        
    end
end

function GrabberClass:grab()
    
end

function GrabberClass:release()
    
end
