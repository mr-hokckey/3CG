
PlayerClass = {}

PLAYER_KEYS = {
    [1] = "P1",
    [2] = "P2"
}

function PlayerClass:new(id, deck, hand, discard)
    local player = {}
    local metadata = {__index = PlayerClass}
    setmetatable(player, metadata)

    player.id = id
    player.key = PLAYER_KEYS[id]
    player.mana = 10
    player.points = 0

    player.deck = deck
    player.hand = hand
    player.discard = discard

    return player
end

function PlayerClass:update()
    
end

function PlayerClass:draw()
    love.graphics.setFont(largeFont)

    love.graphics.printf("MANA:\nSCORE:", PLAYER_NUMBERS[self.id].x, PLAYER_NUMBERS[self.id].y, SCREEN_WIDTH / 8, "right")
    love.graphics.printf("  " .. self.mana .. "\n  " .. self.points, PLAYER_NUMBERS[self.id].x + SCREEN_WIDTH / 8, PLAYER_NUMBERS[self.id].y, SCREEN_WIDTH / 8, "left")

    love.graphics.setFont(smallFont)
end

-- take a card from the player's deck and place it in their hand.
-- this function will fail if the player has 7 cards in their hand.
function PlayerClass:takeCardFromDeck()
    if #self.hand >= 7 then 
        return false
    end
    
    table.insert(self.hand, CardClass:new(table.remove(self.deck, 1), self.id, "HAND"))
    return true
end

-- function to be called after click dragging a card from their hand to a location.
-- attempt to move the card to the location. fails if the location is full or the player
-- doesn't have enough mana. then adds the player's move to the Event Queue in the gameManager.
function PlayerClass:stageCard(gameManager, card, dst)
    if self.mana >= card.cost then
        if gameManager:moveCard(card, "HAND", dst) then
            self.mana = self.mana - card.cost
            gameManager:addMoveToQueue(card.owner_key, card, dst)
        end
    end
    gameManager:reposition(card.owner_key, card.location)
end

-- undo all moves.
function PlayerClass:undoAll(gameManager)
    -- for each move in the event queue
        -- move the card back to the player's hand
        -- give them their mana back
        -- clear this move from the event queue.

    for i = #gameManager.revealQueue, 1, -1 do
        gameManager:moveCard(gameManager.revealQueue[i].card, gameManager.revealQueue[i].location, "HAND")
        self.mana = self.mana + gameManager.revealQueue[i].card.cost
        table.remove(gameManager.revealQueue, i)
    end
end

-- function to be called after the player is finished staging their cards.
-- tells the gameManager that the player has submitted their play.
function PlayerClass:submitPlay(gameManager)
    
end
