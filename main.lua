
io.stdout:setvbuf("no")

love.graphics.setDefaultFilter("nearest", "nearest")

-- variable to be used in a function that detects a left click.
local mousePressed = false

function love.load()

    require "vector"
    require "positions"

    gameManager = require("gameManager")
    require "card"
    require "deck"
    require "player"
    require "location"
    require "grabber"

    love.window.setMode(SCREEN_WIDTH, SCREEN_HEIGHT)
    love.window.setTitle("Mythomagic") -- A reference to Percy Jackson

    smallFont = love.graphics.newFont("assets/MinecraftStandard.otf", 6, "mono")
    mediumFont = love.graphics.newFont("assets/MinecraftStandard.otf", 12, "mono")
    largeFont = love.graphics.newFont("assets/MinecraftStandard.otf", 24, "mono")
    love.graphics.setFont(smallFont)

    -- create cardTables, a table of tables. Every single card object will always be inside one of these.
    cardTables = {
        P1 = {
            LOCATION_1 = {},
            LOCATION_2 = {},
            LOCATION_3 = {},
            HAND = {},
            DECK = {},
            DISCARD = {},
        },
        P2 = {
            LOCATION_1 = {},
            LOCATION_2 = {},
            LOCATION_3 = {},
            HAND = {},
            DECK = {},
            DISCARD = {},
        },
    }

    -- create a gameManager object
    gameManager:init(25, cardTables)

    -- create 2 decks - a list of 20 card names for each player
    p1_deck = { "Wooden Cow", "Pegasus", "Minotaur", "Titan", "Zeus", "Ares", "Medusa", "Cyclops", "Poseidon", "Artemis", "Hera", "Demeter", "Hades", "Heracles", "Dionysus", "Hermes", "Hydra", "Ship of Theseus", "Sword of Damocles", "Midas" }
    p2_deck = { "Wooden Cow", "Wooden Cow", "Pegasus", "Pegasus", "Minotaur", "Minotaur", "Titan", "Titan", "Zeus", "Zeus", "Ares", "Ares", "Medusa", "Medusa", "Cyclops", "Cyclops", "Poseidon", "Poseidon", "Artemis", "Artemis", "Hera", "Hera" }

    -- create 2 player objects
    player1 = PlayerClass:new(1, p1_deck, cardTables.P1.HAND, cardTables.P1.DISCARD)
    player2 = PlayerClass:new(2, p2_deck, cardTables.P2.HAND, cardTables.P2.DISCARD)

    -- create 3 location objects
    location1 = LocationClass:new(1, cardTables.P1.LOCATION_1, cardTables.P2.LOCATION_1)
    location2 = LocationClass:new(2, cardTables.P1.LOCATION_2, cardTables.P2.LOCATION_2)
    location3 = LocationClass:new(3, cardTables.P1.LOCATION_3, cardTables.P2.LOCATION_3)
    
    players = {
        P1 = player1,
        P2 = player2
    }
    
    locations = {
        LOCATION_1 = location1,
        LOCATION_2 = location2,
        LOCATION_3 = location3
    }

    player1:takeCardFromDeck()
    player1:takeCardFromDeck()
    player1:takeCardFromDeck()

    player2:takeCardFromDeck()
    player2:takeCardFromDeck()
    player2:takeCardFromDeck()

    grabber = GrabberClass:new(player1)

    gameManager:reposition("P1", "HAND")
    gameManager:reposition("P2", "HAND")
end

-- An attempt at a Finite State Machine. The textbook says to use a switch statement,
-- but Lua doesn't actually have that, so I used a bunch of if-elses.
function love.update()
    -- grabber:update()

    -- location1:update()
    -- location2:update()
    -- location3:update()

    local leftClick = checkForLeftClick()

    -- initial setup state
    if gameManager.turn_state == TURN_STATE.SETUP then
        if leftClick then
            gameManager:beginTurn(player1, player2)
            gameManager.turn_state = TURN_STATE.STAGING
        end
    
    -- beginning of the turn: players stage their cards.
    elseif gameManager.turn_state == TURN_STATE.STAGING then
        grabber:update()


        if player1.standingBy then
            -- randomly generate player 2's moves
            player2.standingBy = true
        end
        if player1.standingBy and player2.standingBy then
            gameManager.turn_state = TURN_STATE.REVEAL
        end

    -- time to reveal the cards :)
    elseif gameManager.turn_state == TURN_STATE.REVEAL then
        if leftClick then
            if #gameManager.revealQueue > 0 then
                gameManager.revealQueue[1].card:flip()
                grabber.selectedCard = gameManager.revealQueue[1].card
                gameManager.turn_state = TURN_STATE.REVEAL_FLIP
            else
                gameManager.turn_state = TURN_STATE.CALC_POINTS
            end
        end
    
    -- the next card in the queue flips over.
    elseif gameManager.turn_state == TURN_STATE.REVEAL_FLIP then
        if leftClick then
            if #gameManager.revealQueue[1].card.ability == 0 then
                gameManager.turn_state = TURN_STATE.REVEAL_POWER
                locations[gameManager.revealQueue[1].card.location]:calcPower()
            else
                gameManager.turn_state = TURN_STATE.REVEAL_TARGET
            end
        end
    
    -- if the card has an ability, highlight its targets...
    elseif gameManager.turn_state == TURN_STATE.REVEAL_TARGET then
        if leftClick then
            gameManager.turn_state = TURN_STATE.REVEAL_EFFECT
        end
    
    -- ...and then apply the effects.
    elseif gameManager.turn_state == TURN_STATE.REVEAL_EFFECT then
        if leftClick then
            gameManager.turn_state = TURN_STATE.REVEAL_POWER
        end
    
    -- update the card's location to display the correct power.
    elseif gameManager.turn_state == TURN_STATE.REVEAL_POWER then
        if leftClick then
            gameManager.turn_state = TURN_STATE.CALC_POINTS
            for _, location in pairs(locations) do
                location:awardPoints(player1, player2)
            end
        end
    
    -- once all cards have been revealed, give each player the points they've earned.
    elseif gameManager.turn_state == TURN_STATE.CALC_POINTS then
        if leftClick then
            gameManager.turn_state = TURN_STATE.ENDTURN
        end
    
    elseif gameManager.turn_state == TURN_STATE.ENDTURN then
        if leftClick then
            gameManager.turnNumber = gameManager.turnNumber + 1
            gameManager:beginTurn(player1, player2)
            gameManager.turn_state = TURN_STATE.STAGING
        end
    
    elseif gameManager.turn_state == TURN_STATE.ENDTURN_SELECT then

    
    elseif gameManager.turn_state == TURN_STATE.ENDTURN_TARGET then

    
    elseif gameManager.turn_state == TURN_STATE.ENDTURN_EFFECT then

    
    elseif gameManager.turn_state == TURN_STATE.ENDTURN_POWER then

    
    elseif gameManager.turn_state == TURN_STATE.DISCARD_SELECT then

    
    elseif gameManager.turn_state == TURN_STATE.DISCARD_EFFECT then

    end
end

function love.draw()
    -- Color palette:
    -- setColor(0, 0, 0, 1) - #000000 - Black
    -- setColor(0.5, 0, 0, 1) - #800000 - Maroon
    -- setColor(0.82, 0.41, 0.12, 1) - #D2691E - Chocolate
    -- setColor(1, 0.97, 0.86, 1) - #FFF8DC - Cornsilk

    love.graphics.setColor(0.82, 0.41, 0.12, 1)
    love.graphics.rectangle("fill", SCREEN_WIDTH * 1/4, 0, SCREEN_WIDTH * 1/2, SCREEN_HEIGHT)

    love.graphics.setColor(0.5, 0, 0, 1)
    for _, playerZones in pairs(POSITIONS) do
        for _, zone in pairs(playerZones) do
            for _, pos in ipairs(zone) do
                love.graphics.rectangle("line", pos.x, pos.y, CARD_WIDTH, CARD_HEIGHT)
            end
        end 
    end

    for _, playerZones in pairs(cardTables) do
        for _, zone in pairs(playerZones) do
            for _, card in ipairs(zone) do
                card:draw()
            end
        end 
    end

    gameManager:draw()

    player1:draw()
    player2:draw()

    location1:draw()
    location2:draw()
    location3:draw()

    grabber:draw()
end

function love.keypressed(key, scancode, isrepeat)
    if key == "u" then
        player1:undoAll(gameManager, "P1")
    end

    if key == "s" then
        player1:submitPlay(gameManager)
    end
end

function checkForLeftClick() 
    if not love.mouse.isDown(1) then
        mousePressed = false
    elseif love.mouse.isDown(1) and not mousePressed then
        mousePressed = true
        return true
    end
    return false
end
