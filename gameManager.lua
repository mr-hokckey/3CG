
local GameManagerClass = {}

TURN_PHASE = {
    STAGE,
    REVEAL,
    END_TURN
}

function GameManagerClass:init(pointsToWin, cardTables)
    self.turnNumber = 1
    self.pointsToWin = pointsToWin
    self.turnPhase = TURN_PHASE.STAGE

    self.revealQueue = {}

    self.cardTables = cardTables
end

function GameManagerClass:update()
    
end

function GameManagerClass:draw()
    
end

-- function to be called at the beginning of each turn.
function GameManagerClass:beginTurn()
    -- set each player's mana == turnNumber

    -- have each player take a card from their deck

    -- p1.standingBy = false
    -- p2.standingBy = false

    -- self.turnPhase = STAGE
end

-- returns the card pile the mouse is currently hovering over.
function GameManagerClass:getDropTarget()
    return "PASS"
end

-- function to move any card to and from any location.
-- src and dst are location strings, card is a card object.
function GameManagerClass:moveCard(card, src, dst)
    
end

-- given a player ID and a location, reposition cards in the corresponding card table.
function GameManagerClass:reposition(owner, location)
    for i, card in ipairs(self.cardTables[owner][location]) do
        card.position = POSITIONS[owner][location][i]
    end
end
-- function to be called when a player makes a move.
-- add the move to the event queue.
function GameManagerClass:addMoveToQueue(player, card, location)
    
end

-- function to call once both players have submitted their play.
-- cards will be revealed and take effect in the order given by the event queue.
-- 
function GameManagerClass:revealCards()
    -- self.turnPhase = REVEAL


end

function GameManagerClass:endTurn()
    -- for each card on the board
        -- trigger any onEndTurn abilities
end

return GameManagerClass
