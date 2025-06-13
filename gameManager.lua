
local GameManagerClass = {}

TURN_STATE = {
    SETUP = 1,
    STAGING = 2,
    REVEAL = 3,
    REVEAL_FLIP = 4,
    REVEAL_TARGET = 5,
    REVEAL_EFFECT = 6,
    REVEAL_POWER = 7,
    CALC_POINTS = 8,
    ENDTURN = 9,
    ENDTURN_SELECT = 10,
    ENDTURN_TARGET = 11,
    ENDTURN_EFFECT = 12,
    ENDTURN_POWER = 13,
    DISCARD_SELECT = 14,
    DISCARD_EFFECT = 15
}

function GameManagerClass:init(pointsToWin, cardTables)
    self.turnNumber = 1
    self.pointsToWin = pointsToWin
    self.turn_state = TURN_STATE.SETUP

    self.revealQueue = {}

    self.cardTables = cardTables
end

function GameManagerClass:update()
    
end

-- draw the turn number and current 
function GameManagerClass:draw()
    love.graphics.setFont(largeFont)

    love.graphics.setColor(0.82, 0.41, 0.12, 1)
    love.graphics.print("TURN " .. self.turnNumber, GAME_STATUS.x, GAME_STATUS.y - love.graphics.getFont():getHeight()/2)

    love.graphics.setFont(smallFont)
end

-- function to be called at the beginning of each turn.
function GameManagerClass:beginTurn(p1, p2)
    -- set each player's mana == turnNumber
    p1.mana = self.turnNumber
    p2.mana = self.turnNumber

    -- have each player take a card from their deck
    p1:takeCardFromDeck()
    p2:takeCardFromDeck()

    self:reposition("P1", "HAND")
    self:reposition("P2", "HAND")

    p1.standingBy = false
    p2.standingBy = false
end

-- returns the card pile the mouse is currently hovering over.
function GameManagerClass:getDropTarget()
    for _, playerZones in pairs(DROP_ZONES) do
        for l, location in pairs(playerZones) do
            local isMouseOver = 
                love.mouse.getX() > location.MIN.x and
                love.mouse.getX() < location.MAX.x and
                love.mouse.getY() > location.MIN.y and
                love.mouse.getY() < location.MAX.y
            if isMouseOver then
                return l
            end
        end
    end
    return "FALSE"
end



-- function to move any card to and from any location.
-- src and dst are location strings, card is a card object.
function GameManagerClass:moveCard(card, src, dst)

    if src == dst or dst == "FALSE" then 
        self:reposition(card.owner_key, src)
        return false
    end
    
    if dst ~= "FALSE" and #self.cardTables[card.owner_key][dst] < #POSITIONS[card.owner_key][dst] then
        for i = #self.cardTables[card.owner_key][src], 1, -1 do
            if self.cardTables[card.owner_key][src][i] == card then
                table.remove(self.cardTables[card.owner_key][src], i)
                break
            end
        end
        
        table.insert(self.cardTables[card.owner_key][dst], card)
        card.location = dst
        self:reposition(card.owner_key, dst)
        self:reposition(card.owner_key, src)
    end
    -- self:reposition(card.owner_key, src)

    return true
end

-- given a player ID and a location, reposition cards in the corresponding card table.
function GameManagerClass:reposition(owner, location)
    for i, card in ipairs(self.cardTables[owner][location]) do
        card.position = POSITIONS[owner][location][i]
    end
end
-- function to be called when a player makes a move.
-- add the move to the event queue.
function GameManagerClass:addMoveToQueue(player_key, card, location)
    table.insert(self.revealQueue, {
        player = player_key, 
        card = card, 
        location = location
    })
end

-- function to call once both players have submitted their play.
-- cards will be revealed and take effect in the order given by the event queue.
-- 
function GameManagerClass:revealCards()
    -- for each card in the reveal queue
        -- flip over the card and highlight it
        -- highlight all cards affected by its ability
        -- 
end

function GameManagerClass:endTurn()
    -- for each card on the board
        -- trigger any onEndTurn abilities
end

return GameManagerClass
