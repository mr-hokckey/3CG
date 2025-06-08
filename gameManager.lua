
GameManagerClass = {}

function GameManagerClass:new()
    local gameManager = {}
    local metadata = {__index = GameManagerClass}
    setmetatable(gameManager, metadata)

    return gameManager
end

function GameManagerClass:update()
    
end

function GameManagerClass:draw()
    
end

-- function to move any card to and from any location.
-- src and dst are location strings, card is a card object.
function GameManagerClass:moveCard(card, src, dst)
    
end

-- function to be called when a player makes a move.
-- add the move to the event queue.
function GameManagerClass:addMoveToQueue(player, card, location)
    
end

-- function to call once both players have submitted their play.
-- cards will be revealed and take effect in the order given by the event queue.
-- 
function GameManagerClass:revealCards()
    
end

return GameManagerClass
