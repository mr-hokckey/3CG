
PlayerClass = {}

function PlayerClass:new(id, deck, hand, discard)
    local player = {}
    local metadata = {__index = PlayerClass}
    setmetatable(player, metadata)

    player.id = id
    player.mana = 0
    player.points = 0

    player.deck = deck
    player.hand = hand
    player.discard = discard

    return player
end

function PlayerClass:update()
    
end

function PlayerClass:draw()
    
end

-- take a card from the player's deck and place it in their hand.
-- this function will fail if the player has 7 cards in their hand.
function PlayerClass:takeCardFromDeck()
    
end

-- function to be called after click dragging a card from their hand to a location.
-- This adds the player's move to the Event Queue in the gameManager.
function PlayerClass:stageCard(gameManager, card, dst)
    gameManager:moveCard(card, "hand", dst)
    -- self.mana = self.mana - card.cost
    gameManager:addMoveToQueue("player", card, dst)
end

-- undo all moves.
function PlayerClass:undoAll(gameManager)
    -- for each move in the event queue
        -- move the card back to the player's hand
        -- give them their mana back
        -- clear this move from the event queue.
end

-- function to be called after the player is finished staging their cards.
-- tells the gameManager that the player has submitted their play.
function PlayerClass:submitPlay(gameManager)
    
end
