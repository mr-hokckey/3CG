
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
    player.mana = 0
    player.points = 0

    player.deck = deck
    player.hand = hand
    player.discard = discard

    player.standingBy = false

    return player
end

function PlayerClass:update()
    
end

function PlayerClass:draw()
    love.graphics.setFont(largeFont)

    love.graphics.setColor(0.82, 0.41, 0.12, 1)
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
    
    local card = CardClass:new(table.remove(self.deck, 1), self.id, "HAND")
    card.isFaceUp = (card.owner_key == "P1" and true) or false
    table.insert(self.hand, card)
    
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
function PlayerClass:undoAll(gameManager, player_key)
    -- for each move in the event queue
        -- move the card back to the player's hand
        -- give them their mana back
        -- clear this move from the event queue.

    for i = #gameManager.revealQueue, 1, -1 do
        local reveal = gameManager.revealQueue[i]
        if reveal.player == player_key then
            gameManager:moveCard(reveal.card, reveal.location, "HAND")
            reveal.card.isFaceUp = true
            self.mana = self.mana + reveal.card.cost 
            table.remove(gameManager.revealQueue, i)
        end
    end
end

-- function to be called after the player is finished staging their cards.
-- tells the gameManager that the player has submitted their play.
function PlayerClass:submitPlay(gameManager)
    if gameManager.turn_state == TURN_STATE.STAGING then
        for i = #gameManager.revealQueue, 1, -1 do
            gameManager.revealQueue[i].card:flip()
        end
        self.standingBy = true
    end
end
